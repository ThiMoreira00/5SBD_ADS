'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Passagem extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Passagem.belongsTo(models.Passageiro, { foreignKey: 'passageiro_id' });
      Passagem.belongsTo(models.Voo, { foreignKey: 'voo_id' });
    }
  }
  Passagem.init({
    codigo_passagem: DataTypes.STRING,
    classe: DataTypes.STRING,
    preco: DataTypes.FLOAT,
    data_compra: DataTypes.DATE,
    status: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'Passagem',
  });
  return Passagem;
};