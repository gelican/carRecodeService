'use strict';
// 用户表
module.exports = app => {
    console.log(app)
    const { STRING, INTEGER, DATE, TEXT } = app.Sequelize;

    const model = app.model.define('menu', {
        id: { type: INTEGER, primaryKey: true, autoIncrement: true },
        parentId: INTEGER,
        title: STRING(255),
        code: STRING(255),
        index: INTEGER,
        remark: TEXT,
    });

    return model;
};