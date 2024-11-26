'use strict';
module.exports = (sequelize, DataTypes) => {
  const ControleDeTrafego = sequelize.define('ControleDeTrafego', {}, {});

  ControleDeTrafego.associate = function (models) {
    ControleDeTrafego.hasMany(models.Aeronave, { as: 'aeronaves_ativos', foreignKey: 'aeronave_ativa_id' });
    ControleDeTrafego.hasMany(models.Aeronave, { as: 'aeronaves_esperando', foreignKey: 'aeronave_esperando_id' });
  };

  return ControleDeTrafego;
};
