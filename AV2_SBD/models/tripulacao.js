'use strict';
module.exports = (sequelize, DataTypes) => {
  const Tripulacao = sequelize.define('Tripulacao', {}, {});

  Tripulacao.associate = function (models) {
    Tripulacao.belongsTo(models.Voo, { foreignKey: 'voo_id' });
  Tripulacao.hasMany(models.Tripulante, { foreignKey: 'tripulacao_id' });
  };

  return Tripulacao;
};