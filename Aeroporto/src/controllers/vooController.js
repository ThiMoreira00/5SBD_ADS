const db = require("../models"); // Importa o modelo Voo

// Função para listar todos os voos
exports.listarVoos = async (req, res) => {
  try {
    const voos = await db.Voo.findAll();
    res.status(200).json(voos);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao listar os voos", error });
  }
};

// Função para criar um novo voo
exports.criarVoo = async (req, res) => {
  try {
    const {
      codigo_voo,
      aeronave,
      origem,
      destino,
      horario_partida,
      horario_chegada,
      status,
    } = req.body;

    // Verificar se já existe um voo com o mesmo código
    const vooExistente = await db.Voo.findOne({ where: { codigo_voo } });
    if (vooExistente) {
      return res
        .status(400)
        .json({ message: "Já existe um voo com o código informado" });
    }

    const novoVoo = await db.Voo.create({
      codigo_voo,
      aeronave,
      origem,
      destino,
      horario_partida,
      horario_chegada,
      status,
    });
    res.status(201).json(novoVoo);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao criar voo", error });
  }
};

// Função para visualizar um voo específico
exports.visualizarVoo = async (req, res) => {
  try {
    const voo = await db.Voo.findOne({
      where: { codigo_voo: req.params.codigo_voo },
    });
    if (voo) {
      res.status(200).json(voo);
    } else {
      res.status(404).json({ message: "Voo não encontrado" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao buscar voo", error });
  }
};

// Função para atualizar um voo específico
exports.atualizarVoo = async (req, res) => {
  try {

    // Captura o código do voo da URL (usando req.params)
    const { codigo_voo } = req.params;

    // Procura o voo pelo código informado na URL
    const voo = await db.Voo.findOne({ where: { codigo_voo } });

    // Verifica se o voo foi encontrado
    if (voo) {

      // Desestrutura os campos do corpo da requisição (JSON enviado)
      const {
        aeronave,
        origem,
        destino,
        horario_partida,
        horario_chegada,
        status,
      } = req.body;

      // Atualiza o voo com os novos dados, se fornecidos
      await voo.update({
        aeronave,
        origem,
        destino,
        horario_partida,
        horario_chegada,
        status,
      });

      // Retorna o voo atualizado com status 200
      res.status(200).json(voo);
    } else {
      
      // Caso o voo não seja encontrado, retorna erro 404
      res.status(404).json({ message: "Voo não encontrado" });
    }
  } catch (error) {
    // Caso ocorra algum erro, retorna status 500 com a mensagem de erro
    console.error(error);
    res.status(500).json({ message: "Erro ao atualizar voo", error });
  }
};

// Função para excluir um voo específico
exports.excluirVoo = async (req, res) => {
  try {
    // Capturar codigo_voo
    const { codigo_voo } = req.params;

    const voo = await db.Voo.findOne({
      where: { codigo_voo: req.params.codigo_voo },
    });

    if (voo) {
      await voo.destroy();
      res.status(200).json({ message: "Voo excluído com sucesso" });
    } else {
      res.status(404).json({ message: "Voo não encontrado" });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao excluir voo", error });
  }
};
