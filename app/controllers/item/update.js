module.exports = function(req, res, render) {

  req.models.item.find({
    where: {
      id: req.params.item_id 
    }
  })
  .then(function(item) {
    
    /*
     * Set new values like this:
     * item.some_field_name = req.body.item.someFieldName;
     */
     
    return item.save();
  })
  .then(function(item) {
    render(item);
  })
  .catch(function(err) {
    render(err);
  });

};