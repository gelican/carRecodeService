'use strict';

exports.sequelize = {
  dialect: 'mysql',
  host: 'localhost',
  username: 'root',
  password: '123456',
  port: 3306,
  database: 'car_record',
  timezone: '+08:00',

  logging: console.log,
  define: {
    // 禁用修改表名; 默认情况下，sequelize将自动将所有传递的模型名称（define的第一个参数）转换为复数。 如果你不想这样，请设置以下内容
    freezeTableName: true,
    // 不删除数据库条目，但将新添加的属性deletedAt设置为当前日期（删除完成时）。 
    // paranoid 只有在启用时间戳时才能工作(也就是timestamps为true或默认的时候)
    paranoid: true,
  },
};

exports.cluster = {
  listen: {
    port: 6819,
    hostname: '0.0.0.0',
  },
};