-- Carregando os dados de pedidos
LOAD DATA INFILE 'C:/xampp/htdocs/5SBD_AV1/arquivos/pedidos.csv'
INTO TABLE sbd_tempdata_pedidos
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Chamando o processamento de pedidos
CALL sbd_processar_pedidos();

-- Carregar o arquivo CSV na tabela temporária
LOAD DATA INFILE 'C:/xampp/htdocs/5SBD_AV1/arquivos/estoque.csv'
INTO TABLE sbd_tempdata_estoque
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Processar o estoque
CALL sbd_processar_estoque();