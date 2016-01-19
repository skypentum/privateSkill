DELIMITER $$

USE `pdr_meta`$$

DROP PROCEDURE IF EXISTS `proc_save_tb_gui_rpt_list`$$

CREATE DEFINER=`pdruser`@`%` PROCEDURE `proc_save_tb_gui_rpt_list`(
    IN i_rptNo VARCHAR(20),
    IN i_rptGroup VARCHAR(20),
    IN i_rptName VARCHAR(600),
    IN i_stmt TEXT,
    OUT o_error INT
)
BEGIN
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET o_error = -1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET o_error = -1;
	IF i_rptNo = 'new' THEN
	    INSERT INTO tb_gui_rpt_list VALUES 
	    (i_rptNo,i_rptGroup,i_rptName,i_stmt,SYSDATE());
	ELSE
	    UPDATE tb_gui_rpt_list SET
	    rpt_name = i_rptName,
	    stmt = i_stmt,
	    savetime = SYSDATE()
	    WHERE rpt_no = i_rptNo;
	END IF;
	
	IF o_error = -1 THEN 
	   ROLLBACK;
	END IF;
    END$$

DELIMITER ;