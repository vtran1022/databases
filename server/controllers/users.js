var models = require('../models');

module.exports = {
  get: function (req, res) {
    models.users.getAll((err, results) => {
      if (err) {
        res.status(418).send(err);
      } else {
        res.status(200).json(results);
      }
    });
  },

  post: function (req, res) {
    var params = [ req.body[username] ];
    models.users.create(params, (err, results) => {
      if (err) {
        res.status(418).send(err);
      } else {
        res.status(200).json(results);
      }
    });
  }
};
