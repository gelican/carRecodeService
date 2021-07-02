'use strict';

exports.nunjucks = {
  enable: true,
  package: 'egg-view-nunjucks'
};

exports.sequelize = {
  enable: true,
  package: 'egg-sequelize',
  freezeTableName: false,
};

exports.redis = {
  enable: true,
  package: 'egg-redis',
};