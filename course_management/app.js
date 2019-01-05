const Koa = require('koa')
const Router = require('koa-router')
const render = require('koa-ejs')
const serve = require('koa-static')
const path = require('path')
const kaoBody = require('koa-body')
const mysql = require('mysql2/promise')
const session = require('koa-session')

const app = new Koa()
const router = new Router()

const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    database: 'online_courses'
})

app.keys = ['some secret hurr asdf qwer']
  const sessionStore = {}
  
  const CONFIG = {
      key: 'koa:sess', /** (string) cookie key (default is koa:sess) */
      maxAge: 86400000,
      autoCommit: true, /** (boolean) automatically commit headers (default true) */
      overwrite: true, /** (boolean) can overwrite or not (default true) */
      httpOnly: true, /** (boolean) httpOnly or not (default true) */
      signed: true, /** (boolean) signed or not (default true) */
      rolling: false, /** (boolean) Force a session identifier cookie to be set on every response. The expiration is reset to the original maxAge, resetting the expiration countdown. (default is false) */
      renew: false, /** (boolean) renew session when session is nearly expired, so we can always keep user logged in. (default is false)*/
      store: {
          get(key, maxAge, { rolling }) {
              return sessionStore[key]
          },
          set(key, sess, maxAge, { rolling, changed }) {
              sessionStore[key] = sess
          },
          destroy(key) {
              delete sessionStore[key]
          }
      }
  }

  const flash = async (ctx, next) => {
	if (!ctx.session) throw new Error('flash message required session')
	ctx.flash = ctx.session.flash
	delete ctx.session.flash
	await next()
}
  
app.use(session(CONFIG, app))

app.use(kaoBody())

render(app, {
    root: path.join(process.cwd(), "view"),
    layout: "template",
    viewExt: "ejs",
    cache: false
  });

router.get('/', async (ctx, next) => {
    const data = { title: "Login", flash: ctx.flash}
    await ctx.render('login', data)
    await next()
})

router.get('/login', async (ctx, next) => {
    const data = { title: "Login", flash: ctx.flash}
    await ctx.render('login', data)
    await next()
})

router.get('/student', async (ctx, next) => {
    const [results] = await pool.query(`SELECT * FROM users WHERE id = ?`, [ctx.session.userId])
    const [course] = await pool.query('SELECT * FROM course')
    const data = { title: "Student", results, course, userId: results[0].id}
    await ctx.render('student', data)
    await next()
})

router.get('/instructor', async (ctx, next) => {
    const [results] = await pool.query(`SELECT * FROM users WHERE id = ?`, [ctx.session.userId])
    const [course] = await pool.query('SELECT * FROM course')
    const data = { title: "Instructor", results, course}
    await ctx.render('instructor', data)
    await next()
})


router.post('/login_completed', async (ctx, next) => {
    const [results] = await pool.query(`SELECT id, password, status FROM users WHERE username = ?`, [ctx.request.body.user])
    if (results[0].password === ctx.request.body.pass) {
        ctx.session.userId = results[0].id
        if (results[0].status == "student") {
            await ctx.redirect('/student')
            await next()
        } else {
            await ctx.redirect('/instructor')
            await next()
        }
    } else {
        ctx.session.flash = { error: 'Login fail!' }
        await ctx.redirect('/login')
    }
})

router.post('/signup_completed', async (ctx, next) => {
    const {
        firstname,
        lastname,
        nickname,
        birthday,
        gender,
        username,
        pass,
        status
    } = ctx.request.body
    await pool.query(`INSERT INTO users (username, password, firstname, lastname, nickname, birthday, gender, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `, [username, pass, firstname, lastname, nickname, birthday, gender, status])
    await ctx.redirect('/login')
    await next()
})

router.post('/create_completed', async (ctx, next) => {
    const {
        coursename,
        description,
        category,
        subject,
        start,
        end,
        teach_by,
        student
    } = ctx.request.body
    await pool.query(`INSERT INTO course (name, description, category, subject, start, end, teach_by, student) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `, [coursename, description, category, subject, start, end, teach_by, student])
    await ctx.redirect('/instructor')
    await next()
})


router.get('/logout', async (ctx, next) => {
    ctx.session = null
    await ctx.redirect('/')
    await next()
})

app.use(async (ctx, next) => {
    if (ctx.path == '/student' || ctx.path == '/instructor') {
        if (ctx.session && ctx.session.userId) {
            await next()
        } else {
            const data = {title: "Document"}
            await ctx.redirect('login', data)
        }
    } else {
        await next()
    }
})

app.use(serve(path.join(process.cwd(), "public")))
app.use(router.routes())
app.use(router.allowedMethods())

app.listen(3000)