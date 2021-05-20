var db = require('../db');

module.exports = {
  getAll: function (callback) {
    // FIX ME - use a left outer join and select from messages.*
    var queryStr = 'SELECT messages.message, users.username, rooms.roomname \
                    FROM messages LEFT OUTER JOIN users ON (messages.id_user = users.id) \
                    LEFT OUTER JOIN rooms ON (messages.id_room = rooms.id) ORDER BY message.id DESC;';
    db.query(queryStr, (err, results) => {
      if (err) {
        callback(err);
      } else {
        callback(null, results);
      }
    });
  }, // a function which produces all the messages
  create: function (params, callback) { // a function which can be used to insert a message into the database
    var queryStr = 'INSERT INTO messages (message, id_user, id_room) \
                    VALUES (?, (SELECT id FROM users WHERE username = ? LIMIT 1), \
                    (SELECT id FROM rooms WHERE roomname = ? LIMIT 1));';
    db.query(queryStr, params, (err, results) => {
      if (err) {
        callback(err);
      } else {
        callback(null, results);
      }
    });
  }
};

