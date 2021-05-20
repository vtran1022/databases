var db = require('../db');

module.exports = {
  getAll: function (callback) {
    var queryStr = 'SELECT * FROM users';
    db.query(queryStr, (err, results) => {
      if (err) {
        callback(err);
      } else {
        callback(null, results);
      }
    });
  },
  create: function (params, callback) {
    var queryStr = 'INSERT INTO users(username) VALUES (?)';
    db.query(queryStr, params, (err, results) => {
      if (err) {
        callback(err);
      } else {
        callback(null, results);
      }
    });
  }
};