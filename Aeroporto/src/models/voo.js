module.exports = (sequelize, DataTypes) => {
    const Voo = sequelize.define('Voo', {
      codigo_voo: {
        type: DataTypes.STRING,
        primaryKey: true,
        allowNull: false
      },
      aeronave: {
        type: DataTypes.STRING,
        allowNull: false
      },
      origem: {
        type: DataTypes.STRING,
        allowNull: false
      },
      destino: {
        type: DataTypes.STRING,
        allowNull: false
      },
      horario_partida: {
        type: DataTypes.DATE,
        allowNull: false
      },
      horario_chegada: {
        type: DataTypes.DATE,
        allowNull: false
      },
      status: {
        type: DataTypes.STRING,
        allowNull: false
      }
    });
  
    return Voo;
  };
  