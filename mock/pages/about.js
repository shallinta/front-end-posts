/**
 * 模版文件初始化数据模拟文件
 * 对应的模版为template/index
 * @module mock/pages/index
 * @param {object} req - HTTP request object
 * @param {object} res - HTTP response object
 * @return {object} Mock json data
 */

export default (req, res) => {
  return {
    me: '🐷🐷🐷'
  };

  // 也可以返回一个移步调用的结果
  // return new Promise(function(resolve, reject) {
  //   resolve({
  //     isLogin: false
  //   });
  // });

  // 也可以控制 http 头信息，如写cookie
  // res.cookie('userId', 'san.zhang')
};
