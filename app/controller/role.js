// app/controller/users.js
const Controller = require('egg').Controller;
const jwt = require('jsonwebtoken')
const fs = require('fs')
const path = require('path')

class UserController extends Controller {

    async index(ctx) {
        const { } = ctx.request.body
        let res = await ctx.model.Role.findAndCountAll()
        ctx.return200(res)
    }

    async info(ctx) {
        let id = ctx.params.id
        let res = await ctx.model.Role.findByPk(id)
        if (res) {
            ctx.return200(res)
        } else {
            ctx.return400({}, '角色不存在')
        }
    }

    async add(ctx) {
        let { name, status } = ctx.request.body
        let res = await ctx.model.Role.create({
            name, status
        })
        console.log(res.toJSON())
        if (res.id) {
            ctx.return200(res)
        } else {
            ctx.return400(res, '创建角色失败')
        }
    }

    async edit(ctx) {
        let { id, name, status } = ctx.request.body
        let role = await ctx.model.Role.findByPk(id)
        let res = await role.update({
            id, name, status,
        })
        if (res) {
            ctx.return200(res)
        } else {
            ctx.return400(res, '修改角色失败')
        }
    }

    async delete(ctx) {
        let id = ctx.params.id
        let role = await ctx.model.Role.findByPk(id)
        if (!role) {
            ctx.return400({}, '当前角色不存在')
            return
        }
        await role.destroy()
        ctx.return200()
    }
}

module.exports = UserController;