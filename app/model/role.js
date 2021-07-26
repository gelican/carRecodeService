'use strict';
// 用户表
module.exports = app => {
    console.log(app)
    const { STRING, INTEGER, DATE, TEXT } = app.Sequelize;

    const model = app.model.define('role', {
        id: { type: INTEGER, primaryKey: true, autoIncrement: true },
        name: STRING(255),
        status: INTEGER,
    });
    model.associate = () => {
    }

    return model;
};