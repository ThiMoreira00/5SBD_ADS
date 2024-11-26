'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Aeronave extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Aeronave.hasMany(models.Voo, { foreignKey: 'aeronave_id' });
      Aeronave.belongsTo(models.CompanhiaAerea, { foreignKey: 'companhia_aerea_id' });
    }
  }
  Aeronave.init({
    matricula: DataTypes.STRING,
    modelo: DataTypes.STRING,
    capacidade_passageiros: DataTypes.INTEGER,
    companhia_aerea: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Aeronave',
  });
  return Aeronave;
};