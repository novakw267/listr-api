module.exports = function(req, res, render) {

  req.models.list
  .findAll()
  .then(function(lists) {
    render(lists);
  })
  .catch(function(err) {
    render(err);
  });

};
