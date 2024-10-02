DELIMITER //
CREATE PROCEDURE sbd_processar_estoque()
BEGIN

    DECLARE v_SKU VARCHAR(20);
    DECLARE v_quantidade INT;
    DECLARE pronto INT DEFAULT 0;
    DECLARE cursor_estoque CURSOR FOR SELECT SKU, quantidade FROM sbd_tempdata_estoque;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;

    -- Abrindo cursor
    OPEN cursor_estoque;

    -- Loop para processar se houver estoque
    read_loop: LOOP

        -- Buscar os dados do estoque
        FETCH cursor_estoque INTO v_SKU, v_quantidade;

        -- Se não houver mais linhas, saia do loop
        IF pronto THEN
            LEAVE read_loop;
        END IF;

        -- Atualizar a quantidade de produtos em estoque
        UPDATE sbd_estoque SET quantidade = quantidade + v_quantidade WHERE SKU = v_SKU;

        -- Subtrair a quantidade de compras
        UPDATE sbd_compras SET quantidade = quantidade - v_quantidade WHERE SKU = v_SKU;
        
    END LOOP;

    DELETE FROM sbd_compras WHERE quantidade <= 0;

END//
DELIMITER ;