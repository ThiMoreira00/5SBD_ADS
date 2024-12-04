const { Sequelize, DataTypes } = require('sequelize');

// Configure seu banco de dados aqui
const sequelize = new Sequelize('aeroporto_sbd', 'root', '', {
  host: 'localhost',
  dialect: 'sqlite',
});

const db = {};

// Importando os modelos
db.sequelize = sequelize;
db.Sequelize = Sequelize;


db.Voo = require('./voo')(sequelize, DataTypes);


// db.OutroModelo = require('./OutroModelo')(sequelize, DataTypes);

module.exports = db;