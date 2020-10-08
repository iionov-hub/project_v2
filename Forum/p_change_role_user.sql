DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `forum`.`p_change_role_user`(mauthor INTEGER, muser INTEGER, mrole INTEGER)
    DETERMINISTIC
BEGIN
	-- Изменить проль пользователя может только администратор
	Declare user_role INTEGER;

	SELECT id_role
      INTO user_role
      FROM user
     WHERE id_user = mauthor;

	IF  (user_role = 1) THEN

		UPDATE user
	       SET id_role = mrole
	    WHERE muser = id_user;

	END IF;

END$$
DELIMITER ;