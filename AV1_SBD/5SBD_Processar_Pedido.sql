DELIMITER //
CREATE PROCEDURE sbd_processar_pedidos()
BEGIN

    DECLARE v_codigoPedido INT;
    DECLARE v_statusPedido VARCHAR(20);
    DECLARE v_codigoProduto VARCHAR(20);
    DECLARE v_quantidade INT;
    DECLARE pronto INT DEFAULT 0;
    DECLARE cursor_pedidos CURSOR FOR SELECT codigoPedido, status FROM sbd_pedidos;
    DECLARE cursor_itens CURSOR FOR SELECT SKU, quantidade FROM sbd_itens_pedidos;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;

    -- 02.1. Inserir os clientes na tabela de clientes (sbd_clientes)
    INSERT INTO sbd_clientes (codigoComprador, nomeComprador, email) 
    SELECT DISTINCT codigoComprador, nomeComprador, email 
    FROM sbd_tempdata_pedidos 
    WHERE codigoComprador NOT IN (SELECT codigoComprador FROM sbd_clientes) 
    GROUP BY codigoComprador;

    -- 02.2. Inserir os produtos na tabela de pedidos (sbd_pedidos)
    INSERT INTO sbd_pedidos (codigoPedido, codigoComprador, dataPedido, valor, status) 
    SELECT DISTINCT codigoPedido, codigoComprador, dataPedido, valor, 'pendente' 
    FROM sbd_tempdata_pedidos 
    WHERE codigoPedido NOT IN (SELECT codigoPedido FROM sbd_pedidos) 
    GROUP BY codigoPedido; 

    -- 02.3. Inserir os dados na tabela de produtos (sbd_produtos)
    INSERT INTO sbd_produtos (SKU, UPC, nomeProduto, valor) 
    SELECT DISTINCT SKU, UPC, nomeProduto, ROUND(valor / qtd, 2) 
    FROM sbd_tempdata_pedidos 
    WHERE SKU NOT IN (SELECT SKU FROM sbd_produtos) 
    GROUP BY SKU;

    -- 02.4. Inserir os dados na tabela de itens de pedido (sbd_itens_pedido)
    INSERT INTO sbd_itens_pedidos (codigoPedido, SKU, quantidade, valor_unitario) 
    SELECT DISTINCT codigoPedido, SKU, qtd, ROUND(valor / qtd, 2) 
    FROM sbd_tempdata_pedidos 
    WHERE codigoPedido NOT IN (SELECT codigoPedido FROM sbd_itens_pedidos) 
    GROUP BY codigoPedido, SKU;

    -- 02.5. Inserir os dados na tabela de entregas (sbd_entregas)
    INSERT INTO sbd_entregas (codigoPedido, endereco, CEP, UF, pais, valor) 
    SELECT DISTINCT codigoPedido, endereco, CEP, UF, pais, frete 
    FROM sbd_tempdata_pedidos 
    WHERE codigoPedido NOT IN (SELECT codigoPedido FROM sbd_entregas) 
    GROUP BY codigoPedido;

    -- 02.6. Inserir os dados na tabela de estoque (sbd_estoque)
    INSERT INTO sbd_estoque (SKU) SELECT SKU FROM sbd_tempdata_pedidos GROUP BY SKU;


    -- 03. Limpar a tabela `tempdata`
    TRUNCATE TABLE sbd_tempdata_pedidos;

    OPEN cursor_pedidos;

    -- Loop para processar os pedidos pendentes
    pedidos_loop: LOOP

        -- 
        FETCH cursor_pedidos INTO v_codigoPedido, v_statusPedido;
        
        -- Se não houver mais linhas, saia do loop
        IF pronto THEN
            LEAVE pedidos_loop;
        END IF;

        -- Verificar se o pedido está em análise ou pendente
        IF v_statusPedido = 'pendente' THEN

            OPEN cursor_itens;

            itens_loop: LOOP

                FETCH cursor_itens INTO v_codigoProduto, v_quantidade;

                -- Se não houver mais linhas, saia do loop
                IF pronto THEN
                    LEAVE itens_loop;
                END IF;

                -- Para cada item do pedido, verificar se há estoque
                IF (SELECT quantidade FROM sbd_estoque WHERE SKU = v_codigoProduto) >= v_quantidade THEN

                    -- Atualizar o status do pedido
                    UPDATE sbd_itens_pedidos SET status = 'aprovado' WHERE codigoPedido = v_codigoPedido AND SKU = v_codigoProduto;

                    -- Atualizar a quantidade do SKU na tabela de estoque
                    UPDATE sbd_estoque SET quantidade = quantidade - v_quantidade WHERE SKU = v_codigoProduto;

                ELSE
                    
                        -- Se não estiver disponível, atualizar o status do pedido para "pendente"
                        UPDATE sbd_pedidos SET status = 'pendente' WHERE codigoPedido = v_codigoPedido;

                        -- Atualizar o status do item do pedido para "pendente"
                        UPDATE sbd_itens_pedidos SET status = 'pendente' WHERE codigoPedido = v_codigoPedido AND SKU = v_codigoProduto;

                        -- Solicitar compra
                        -- Se tiver na lista de compras, atualizar a quantidade
                        IF EXISTS (SELECT 1 FROM sbd_compras WHERE SKU = v_codigoProduto) THEN
                            UPDATE sbd_compras SET quantidade = quantidade + v_quantidade WHERE SKU = v_codigoProduto;
                        ELSE
                            
                            INSERT INTO sbd_compras (SKU, quantidade) VALUES (v_codigoProduto, v_quantidade - (SELECT quantidade FROM sbd_estoque WHERE SKU = v_codigoProduto));
                        
                        END IF;
    
                    END IF;



            END LOOP;

            CLOSE cursor_itens;

            -- Se todos os itens do pedido foram aprovados, atualizar o status do pedido
            IF NOT EXISTS (SELECT 1 FROM sbd_itens_pedidos WHERE codigoPedido = v_codigoPedido AND status = 'pendente') THEN
                UPDATE sbd_pedidos SET status = 'aprovado' WHERE codigoPedido = v_codigoPedido;
            END IF;

        END IF;

    END LOOP;

    CLOSE cursor_pedidos;

END//
DELIMITER ;