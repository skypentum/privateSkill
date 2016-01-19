DELIMITER $$

USE `pdr_meta`$$

DROP PROCEDURE IF EXISTS `proc_test_dongil`$$

CREATE DEFINER=`ktuser`@`%` PROCEDURE `proc_test_dongil`(
    IN i_data_id VARCHAR(20)
)
BEGIN
        
        DECLARE v_stmt VARCHAR(2000);
	DECLARE v_cnt INT;
	DECLARE v_table_name VARCHAR(50);	
	DECLARE v_not_found,v_err INT DEFAULT 0;
	DECLARE v1,v2,v3,v4 VARCHAR(50);
	
	DECLARE c1 CURSOR FOR 
	SELECT a.data_id, b.field_id, b.field_name, b.field_alias 
	FROM tb_mng_data_field a, tb_mng_tab_field b
	WHERE a.field_id = b.field_id
	AND a.data_id = i_data_id
	AND a.list_yn = 'Y';	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_not_found = 1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET v_err = -1;
	
	
	OPEN c1;
	
	
	SET v_cnt = 0;
	
	
	read_loop : LOOP
	    
	    FETCH c1 INTO v1,v2,v3,v4;
	    
	    IF v_not_found = 1 THEN 
	        LEAVE read_loop;
	    ELSE 
		SET v_stmt = CONCAT(v_stmt,", ");
	    END IF;
	
	    SET v_cnt = v_cnt + 1;
	    IF v_cnt = 1 THEN
	        SET v_stmt = CONCAT('SELECT ');
	    END IF;
	    SET v_stmt = CONCAT(v_stmt, v3, " as '", v4 , "'");
	END LOOP;
	
	SELECT table_name INTO v_table_name FROM tb_mng_tab
	WHERE table_id = i_data_id;
	
	SET v_stmt = CONCAT(v_stmt, " FROM ", v_table_name);
	
	SELECT v_stmt;
	
    END$$

DELIMITER ;