'use strict';

var ssaclAttributeRoles = require('ssacl-attribute-roles');

module.exports = function(sequelize, DataTypes) {
  var Item = sequelize.define('items', {
    text: DataTypes.TEXT,
    done: DataTypes.BOOLEAN
  }, {
    classMethods: {
      associate: function(models) {
        models.item.belongsTo(models.list, {
          onDelete: 'cascade'
        });
      }
    },

    underscored: true,
    underscoredAll: true
  });

  ssaclAttributeRoles(Item);

  return Item;
};
