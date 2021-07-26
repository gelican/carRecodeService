/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
    /**
     * built-in config
     * @type {Egg.EggAppConfig}
     **/
    const config = exports = {};

    // use for cookie sign key, should change to your own and keep security
    config.keys = appInfo.name + '_1588900868743_6944';

    // add your middleware config here
    config.middleware = ['jwt'];
    config.jwt = {
        enable: true,
        // 哪些请求不需要认证
        ignore: [
            '/api/user/login',
        ],
        secret: 'nuo$er&8bao',
    }

    // add your user config here
    const userConfig = {
        // myAppName: 'egg',
    };

    // 添加view配置
    config.view = {
        defaultViewEngine: 'nunjucks',
        mapping: {
            '.tpl': 'nunjucks',
        }
    }

    // redis
    config.redis = {
        client: {
            /* port: 6379,          // Redis port
            host: '10.10.8.106',   // Redis host
            password: '123456',
            db: 0, */
            port: 6379,
            host: '127.0.0.1',
            password: '123456',
            db: 0,
        },
    }

    config.news = {
        pageSize: 5,
        serverUrl: 'https://hacker-news.firebaseio.com/v0',
    };

    config.security = {
        csrf: {
          enable: false,
        }
     }

    return {
        ...config,
        ...userConfig,
    };
};