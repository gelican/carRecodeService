// app/controller/users.js
const Controller = require('egg').Controller;
const jwt = require('jsonwebtoken')
const fs = require('fs')
const path = require('path')

class UserController extends Controller {

    async info(ctx) {
        let {name, password} = ctx.request.body
        ctx.return400({
            name, password
        })
    }

    async login(ctx) {
        let {userName, password} = ctx.request.body
        // 用户名唯一
        let user = await ctx.model.User.findOne({
            where: {
                userName
            }
        })
        if (!user) {
            ctx.body = {
                code: 0,
                msg: '用户不存在'
            }
            return
        }
        // 校验密码，相同则获取token
        if (user.password === password) {
            let created = Math.floor(Date.now() / 1000);
            let cert = fs.readFileSync(path.join(__dirname, '../public/rsa_private_key.pem'));//私钥 可以自己生成
            let token = jwt.sign({
                data: {
                    userName
                },
                exp: created + 20,
            }, cert, { algorithm: 'RS256' });
            let myRedis = this.app.redis
            myRedis.set('loginToken' + userName, token)
            ctx.body = {
                code: 1,
                userName,
                token,
                id: user.id,
                name: user.name,
            }
        } else {
            ctx.body = {
                code: 0,
                msg: '密码错误'
            }
            return
        }
        
    }

    async show() {
        const ctx = this.ctx;
        ctx.body = await ctx.model.User.findByPk(toInt(ctx.params.id));
    }

    async create() {
        const ctx = this.ctx;
        const { name, age } = ctx.request.body;
        const user = await ctx.model.User.create({ name, age });
        ctx.status = 201;
        ctx.body = user;
    }

    async update() {
        const ctx = this.ctx;
        const id = toInt(ctx.params.id);
        const user = await ctx.model.User.findByPk(id);
        if (!user) {
            ctx.status = 404;
            return;
        }

        const { name, age } = ctx.request.body;
        await user.update({ name, age });
        ctx.body = user;
    }

    async destroy() {
        const ctx = this.ctx;
        const id = toInt(ctx.params.id);
        const user = await ctx.model.User.findByPk(id);
        if (!user) {
            ctx.status = 404;
            return;
        }

        await user.destroy();
        ctx.status = 200;
    }
}

module.exports = UserController;