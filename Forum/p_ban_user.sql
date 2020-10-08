 DELIMITER $$
$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `forum`.`p_ban_user`(mauthor INTEGER, muser INTEGER)
    DETERMINISTIC
BEGIN
	-- Процедура для блокировки пользователя
	-- Забанить пользователя. Могут только модераторы и администраторы
	Declare user_role INTEGER;

	SELECT id_role
      INTO user_role
      FROM user
      WHERE id_user = mauthor;

	IF (user_role = 1 OR user_role = 2) THEN

		UPDATE user_info
		   SET is_banned = TRUE
		WHERE muser = id_user;

	END IF;

END$$
DELIMITER ;