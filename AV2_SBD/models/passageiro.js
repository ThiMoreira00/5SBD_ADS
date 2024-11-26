'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class Passageiro extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
      Passageiro.belongsTo(models.Voo, { foreignKey: 'voo_id' });
      Passageiro.hasMany(models.Passagem, { foreignKey: 'passageiro_id' });
    }
  }
  Passageiro.init({
    nome: DataTypes.STRING,
    cpf: DataTypes.STRING,
    passaporte: DataTypes.STRING,
    numero_assento: DataTypes.STRING,
    status_checkin: DataTypes.BOOLEAN
  }, {
    sequelize,
    modelName: 'Passageiro',
  });
  return Passageiro;
};