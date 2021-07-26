'use strict'
const fs = require('fs')
const path = require('path')
const jwt = require('jsonwebtoken') //引入jsonwebtoken
module.exports = (options, app) => {
    return async function userInterceptor(ctx, next) {
        let authToken = ctx.header.authorization // 获取header里的authorization
        if (authToken) {
            const res = verifyToken(authToken) // 解密获取的Token
            // ctx.body = res
            if (res.name) {
                // 如果需要限制单端登陆或者使用过程中废止某个token，或者更改token的权限。也就是说，一旦JWT 签发了，在到期之前就会始终有效
                // 此处使用redis进行保存
                let redis_token = await app.redis.get('loginToken' + res.name)
                // 获取保存的token
                if (authToken === redis_token) {
                    await next()
                } else {
                    ctx.body = { code: 50012, msg: '您的账号已在其他地方登录' }
                }
            } else {
                ctx.body = { code: 50012, msg: '登录状态已过期，请重新登录' }
            }
        } else {
            ctx.body = { code: 50008, msg: '请登陆后再进行操作' }
        }
    }
}
// 解密，验证
function verifyToken(token) {
    let cert = fs.readFileSync(path.join(__dirname, '../public/rsa_public_key.pem'));//公钥 可以自己生成
    let res;
    try {
        let result = jwt.verify(token, cert, { algorithms: ['RS256'] }) || {};
        let { exp = 0 } = result, current = Math.floor(Date.now() / 1000);
        if (current <= exp) {
            res = result.data || {};
        }
    } catch (e) {
        res = 'err';
    }
    return res;
}