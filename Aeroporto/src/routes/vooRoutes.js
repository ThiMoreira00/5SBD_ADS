const express = require('express');
const router = express.Router();
const vooController = require('../controllers/vooController');

// Rota para listar todos os voos (GET)
router.get('/voos', vooController.listarVoos);

// Rota para criar um novo voo (POST)
router.post('/voos', vooController.criarVoo);

// Rota para visualizar um voo específico (GET)
router.get('/voos/:codigo_voo', vooController.visualizarVoo);

// Rota para atualizar um voo específico (PUT)
router.put('/voos/:codigo_voo', vooController.atualizarVoo);

// Rota para excluir um voo específico (DELETE)
router.delete('/voos/:codigo_voo', vooController.excluirVoo);

module.exports = router;
