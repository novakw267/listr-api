module.exports = function(req, res, render) {

  req.models.item.find({
    where: {
      id: req.params.item_id 
    }
  })
  .then(function(item) {
    render({
      model: item
    });
  })
  .catch(function(err) {
    render(err);
  });

};