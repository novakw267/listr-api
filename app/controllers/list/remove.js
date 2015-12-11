module.exports = function(req, res, render) {

  req.models.list.find({
    where: {
      id: req.params.list_id 
    } 
  })
  .then(function(list) {
    return list.destroy();
  })
  .then(function() {
    res.json({});
  })
  .catch(function(err) {
    render(err);
  });

};