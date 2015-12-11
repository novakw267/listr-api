module.exports = function(req, res, render) {

  req.models.item
  .create(req.body.item)
  .then(function(item) {
    render(item);
  })
  .catch(function(err) {
    render(err);
  });

};