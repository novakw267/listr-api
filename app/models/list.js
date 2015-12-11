'use strict';

var ssaclAttributeRoles = require('ssacl-attribute-roles');

module.exports = function(sequelize, DataTypes) {
  var List = sequelize.define('lists', {
    title: DataTypes.STRING,
    hidden: DataTypes.BOOLEAN
  }, {
    classMethods: {
      associate: function(models) {
        models.list.hasMany(models.item, {
          foreignKey: {
            as: 'list_id',
            allowNull: false
          }
        });
      }
    },

    underscored: true,
    underscoredAll: true
  });

  ssaclAttributeRoles(List);

  return List;
};
