// app/controller/users.js
const Controller = require('egg').Controller;
const jwt = require('jsonwebtoken')
const fs = require('fs')
const path = require('path')

class UserController extends Controller {

    async login(ctx) {
        let { name, password } = ctx.request.body
        let user = await ctx.model.User.findOne({
            where: {
                name
            }
        })
        if (user) {
            if (user.password !== password) {
                ctx.return400({}, '密码不正确')
                return
            }
        } else {
            ctx.return400({}, '用户不存在')
            return
        }
        // 校验密码，相同则获取token
        let created = Math.floor(Date.now() / 1000);
        let cert = fs.readFileSync(path.join(__dirname, '../public/rsa_private_key.pem'));//私钥 可以自己生成
        let token = jwt.sign({
            data: {
                name,
            },
            exp: created + 60 * 60 * 6,
        }, cert, { algorithm: 'RS256' });
        let myRedis = this.app.redis
        myRedis.set('loginToken' + name, token)
        ctx.return200({
            id: user.id,
            name: user.name,
            nick: user.nick,
            createdAt: user.createdAt,
            token,
        })
    }

    async register(ctx) {
        let { name, nick, password } = ctx.request.body
        let user = await ctx.model.User.findOne({
            where: {
                name
            }
        })
        if (user) {
            ctx.return400({}, '该用户已存在')
            return
        }
        let transaction
        try {
            transaction = await ctx.model.transaction()
            console.log(transaction)
            await ctx.model.User.create({
                name,
                password,
                nick,
            }, { transaction })
            await transaction.commit()
            ctx.return200({
                name,
                nick,
            })
        } catch (error) {
            await transaction.rollback()
            ctx.return400(error, '创建失败')
        }
    }

    async list(ctx) {
        const { status, isAdmin } = ctx.request.body
        let res = await ctx.model.User.findAndCountAll({
            include: [
                {
                    model: ctx.model.Role,
                },
            ]
        })
        ctx.return200(res)
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