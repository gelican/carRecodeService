'use strict';
// 用户表
module.exports = app => {
    console.log(app)
    const { STRING, INTEGER, DATE } = app.Sequelize;

    const model = app.model.define('user', {
        id: { type: INTEGER, primaryKey: true, autoIncrement: true },
        name: STRING(255),
        nick: STRING(255),
        password: STRING(255),
    });

    return model;
};