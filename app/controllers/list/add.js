module.exports = function(req, res, render) {

  req.models.list
  .create(req.body.list)
  .then(function(list) {
    render(list);
  })
  .catch(function(err) {
    render(err);
  });

};