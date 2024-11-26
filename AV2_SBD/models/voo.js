'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Voo extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Voo.belongsTo(models.Aeronave, { foreignKey: 'aeronave_id' });
      Voo.belongsTo(models.Porto, { foreignKey: 'porto_id' });
      Voo.hasOne(models.Tripulacao, { foreignKey: 'voo_id' });
      Voo.hasMany(models.Passageiro, { foreignKey: 'voo_id' });
    }
  }
  Voo.init({
    codigo_voo: DataTypes.STRING,
    origem: DataTypes.STRING,
    destino: DataTypes.STRING,
    horario_partida: DataTypes.DATE,
    horario_chegada: DataTypes.DATE,
    status: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Voo',
  });
  return Voo;
};