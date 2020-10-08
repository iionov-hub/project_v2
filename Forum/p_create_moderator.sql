DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `forum`.`p_create_moderator`(mauthor INTEGER, muser INTEGER, mforum INTEGER)
    DETERMINISTIC
BEGIN 
	-- Назначить модератором. Только администратор
	 Declare user_role INTEGER;
	 Declare num INTEGER;
	SELECT id_role INTO user_role FROM user WHERE id_user = mauthor;
     -- проверяем на администратора
    IF  (user_role = 1) THEN
    
		SELECT id_role INTO user_role FROM user WHERE id_user = muser;
		-- Можем выдать только админу либо модератору
		IF  (user_role = 1 OR user_role = 2) THEN
			SELECT count(*) INTO num FROM moderator_forum WHERE muser = id_user AND mforum = id_forum;
		        
			if num =  0 THEN 
	        	INSERT INTO moderator_forum (id_forum, id_user) 
	        	VALUES (mforum, muser);
	    	END IF;
	    
		END IF;


	
    END IF;

END$$
DELIMITER ;