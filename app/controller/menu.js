// app/controller/users.js
const Controller = require('egg').Controller;
const jwt = require('jsonwebtoken')
const fs = require('fs')
const path = require('path')

class UserController extends Controller {

    async index(ctx) {
        const { } = ctx.request.body
        let menu = await ctx.model.Menu.findAndCountAll({
            order: [
                ['parentId', 'ASC'],
                ['sort', 'ASC'],
            ],
            include: [
                {
                    model: ctx.model.Menu,
                    as: 'Parent',
                },
            ],
        })
        ctx.return200(menu)
    }

    async info(ctx) {
        let id = ctx.params.id
        let res = await ctx.model.Menu.findByPk(id, {
            include: [
                {
                    model: ctx.model.Menu,
                    as: 'Parent',
                },
            ],
        })
        if (res) {
            ctx.return200(res)
        } else {
            ctx.return400({}, '菜单不存在')
        }
    }

    async add(ctx) {
        let { parentId, title, sort, path } = ctx.request.body
        console.log(parentId, title, sort, path)
        let res = await ctx.model.Menu.create({
            parentId, title, sort, path
        })
        console.log(res.toJSON())
        if (res.id) {
            ctx.return200(res)
        } else {
            ctx.return400(res, '创建菜单失败')
        }
    }

    async edit(ctx) {
        let { id, parentId, title, sort, path } = ctx.request.body
        let menu = await ctx.model.Menu.findByPk(id)
        let res = await menu.update({
            parentId,
            title,
            sort,
            path,
        })
        if (res) {
            ctx.return200(res)
        } else {
            ctx.return400(res, '修改菜单失败')
        }
    }

    async delete(ctx) {
        let id = ctx.params.id
        let menu = await ctx.model.Menu.findByPk(id)
        if (!menu) {
            ctx.return400({}, '当前菜单不存在')
            return
        }
        let res = await ctx.model.Menu.findAll({
            where: {
                parentId: id,
            }
        })
        if (res.length > 0) {
            ctx.return400({}, '在删除当前菜单前请先删除对应子菜单')
            return
        }
        await menu.destroy()
        ctx.return200()
    }
}

module.exports = UserController;