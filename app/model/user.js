'use strict';
// 用户表
module.exports = app => {
    const { STRING, INTEGER, DATE } = app.Sequelize;

    const User = app.model.define('user', {
        id: { type: INTEGER, primaryKey: true, autoIncrement: true },
        name: STRING(255),
        nick: STRING(255),
        password: STRING(255),
    });

    return User;
};