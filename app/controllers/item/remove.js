module.exports = function(req, res, render) {

  req.models.item.find({
    where: {
      id: req.params.item_id 
    } 
  })
  .then(function(item) {
    return item.destroy();
  })
  .then(function() {
    res.json({});
  })
  .catch(function(err) {
    render(err);
  });

};