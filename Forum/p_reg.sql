DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `forum`.`p_reg`(nick VARCHAR(32), email VARCHAR(128), password VARCHAR(64))
    DETERMINISTIC
BEGIN
	 -- процедура для регистрации пользователя
	 Declare id_new_user INTEGER;
    IF not EXISTS (SELECT * FROM user WHERE nick = nickname OR email = e_mail) THEN
	  INSERT INTO user (nickname, e_mail, password, date_of_registration, id_role)
      VALUES (nick, email, password, now(), 3);

      SELECT id_user INTO id_new_user FROM user WHERE nick = nickname AND email = e_mail;

        SELECT id_new_user; -- 12

         INSERT INTO user_info (id_user, num_message, date_last_visit, is_banned)
         VALUES (id_new_user,  0, now(), FALSE);
	END IF;

END$$
DELIMITER ;