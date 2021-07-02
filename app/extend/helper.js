const { app } = require('egg-mock');
const fs = require('fs')
const path = require('path')

module.exports = {
    loginToken(data, expires = 7200) {
        const exp = Math.floor(Date.now() / 1000) + expires
        // 私钥
        const cert = fs.readFileSync(path.join(__dirname, '../public/rsa_private_key.pem'))
        const token = jwt.sign({ data, exp }, cert, { algorithm: 'RS256' })
        return token
    }
};