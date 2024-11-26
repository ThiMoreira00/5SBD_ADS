const express = require('express');
const { Voo, Aeronave, Porto } = require('../models'); // Importar os modelos relacionados
const router = express.Router();

// Listar todos os voos
router.get('/', async (req, res) => {
  try {
    const voos = await Voo.findAll({
      include: [
        { model: Aeronave, attributes: ['matricula', 'modelo'] },
        { model: Porto, attributes: ['numero', 'status'] },
      ],
    });
    res.status(200).json(voos);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao listar os voos.' });
  }
});

// Criar um novo voo
router.post('/', async (req, res) => {
  const { codigo_voo, origem, destino, horario_partida, horario_chegada, status, aeronave_id, porto_id } = req.body;

  try {
    const novoVoo = await Voo.create({
      codigo_voo,
      origem,
      destino,
      horario_partida,
      horario_chegada,
      status,
      aeronave_id,
      porto_id,
    });
    res.status(201).json(novoVoo);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao criar o voo.' });
  }
});

// Alterar algum dado de um voo
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { origem, destino, horario_partida, horario_chegada, status } = req.body;

  try {
    const voo = await Voo.findByPk(id);

    if (!voo) {
      return res.status(404).json({ error: 'Voo não encontrado.' });
    }

    await voo.update({ origem, destino, horario_partida, horario_chegada, status });
    res.status(200).json(voo);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao atualizar o voo.' });
  }
});

// Alterar o status do voo
router.patch('/:id/status', async (req, res) => {
  const { id } = req.params;
  const { status } = req.body;

  try {
    const voo = await Voo.findByPk(id);

    if (!voo) {
      return res.status(404).json({ error: 'Voo não encontrado.' });
    }

    await voo.update({ status });
    res.status(200).json({ message: `Status do voo atualizado para ${status}.`, voo });
  } catch (error) {
    res.status(500).json({ error: 'Erro ao alterar o status do voo.' });
  }
});

// Buscar detalhes de um voo específico
router.get('/:id', async (req, res) => {
  const { id } = req.params;

  try {
    const voo = await Voo.findByPk(id, {
      include: [
        { model: Aeronave, attributes: ['matricula', 'modelo'] },
        { model: Porto, attributes: ['numero', 'status'] },
      ],
    });

    if (!voo) {
      return res.status(404).json({ error: 'Voo não encontrado.' });
    }

    res.status(200).json(voo);
  } catch (error) {
    res.status(500).json({ error: 'Erro ao buscar detalhes do voo.' });
  }
});

// Deletar um voo
router.delete('/:id', async (req, res) => {
  const { id } = req.params;

  try {
    const voo = await Voo.findByPk(id);

    if (!voo) {
      return res.status(404).json({ error: 'Voo não encontrado.' });
    }

    await voo.destroy();
    res.status(200).json({ message: 'Voo deletado com sucesso.' });
  } catch (error) {
    res.status(500).json({ error: 'Erro ao deletar o voo.' });
  }
});

module.exports = router;
