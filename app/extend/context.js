const return200 = function (data) {
  this.status = 200
  this.body = {
    code: 200,
    data
  }
}

const return400 = function (data, msg = '异常') {
  this.status = 200
  this.body = {
    code: 400,
    msg,
    data,
  }
}


module.exports.return200 = return200
module.exports.return400 = return400