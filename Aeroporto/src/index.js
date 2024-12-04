const express = require('express');
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./swagger/swagger.json');
const bodyParser = require('body-parser');
const db = require('./models'); 
const vooRoutes = require('./routes/vooRoutes'); // Importa as rotas dos voos

const app = express();


app.use(bodyParser.json());

// Configuração do Swagger
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Rotas da API
app.use('/api', vooRoutes);

// Sincronizar o banco de dados e iniciar o servidor
const PORT = 3000;
db.sequelize.sync({ force: false }) // Sincronização do banco de dados
  .then(() => {
    console.log('Conexão com o banco de dados estabelecida com sucesso.');
    app.listen(PORT, () => {
      console.log(`Servidor rodando em http://localhost:${PORT}`);
      console.log(`Documentação disponível em http://localhost:${PORT}/api-docs`);
    });
  })
  .catch((err) => {
    console.error('Erro ao conectar com o banco de dados:', err);
  });


  