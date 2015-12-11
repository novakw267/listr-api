module.exports = function(req, res, render) {

  req.models.item
  .findAll()
  .then(function(items) {
    render(items);
  })
  .catch(function(err) {
    render(err);
  });

};