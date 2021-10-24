'use strict';
// 用户表
module.exports = app => {
    const { STRING, INTEGER, DATE, TEXT } = app.Sequelize;

    const model = app.model.define('user_role', {
        id: { type: INTEGER, primaryKey: true, autoIncrement: true },
        userId: INTEGER,
        roleId: INTEGER,
    });

    return model;
};