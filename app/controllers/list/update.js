module.exports = function(req, res, render) {

  req.models.list.find({
    where: {
      id: req.params.list_id 
    }
  })
  .then(function(list) {
    
    /*
     * Set new values like this:
     * list.some_field_name = req.body.list.someFieldName;
     */
     
    return list.save();
  })
  .then(function(list) {
    render(list);
  })
  .catch(function(err) {
    render(err);
  });

};