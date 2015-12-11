var controllers = require('./controllers/.index');
var actions = require('./actions/.index');

module.exports = function(app) {
  
  // List
  app.route('/lists')
    .get(controllers.list.list)
    .post(controllers.list.add);
  app.route('/lists/:list_id')
    .get(controllers.list.load)
    .put(controllers.list.update)
    .delete(controllers.list.remove);

  // Item
  app.route('/items')
    .get(controllers.item.list)
    .post(controllers.item.add);
  app.route('/items/:item_id')
    .get(controllers.item.load)
    .put(controllers.item.update)
    .delete(controllers.item.remove);

};