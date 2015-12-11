module.exports = function(req, res, render) {

  req.models.list.find({
    where: {
      id: req.params.list_id 
    }
  })
  .then(function(list) {
    render({
      model: list
    });
  })
  .catch(function(err) {
    render(err);
  });

};