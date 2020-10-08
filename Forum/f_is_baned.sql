DELIMITER $$
$$
CREATE FUNCTION f_is_baned(user_id INTEGER)

RETURNS INT
 DETERMINISTIC
BEGIN
	-- Функция для определения заблокирован ли пользователь
	Declare is_banned_var BOOLEAN;

	SELECT is_banned
      INTO is_banned_var
      FROM user_info
     WHERE id_user = user_id;

   RETURN is_banned_var;

END $$

DELIMITER ;