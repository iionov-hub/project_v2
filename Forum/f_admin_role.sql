DELIMITER $$
$$
CREATE FUNCTION f_admin_role(user_id INTEGER)

RETURNS INT
 DETERMINISTIC
BEGIN
	-- Функция для определения роли пользователя
	Declare user_role INTEGER;

    SELECT id_role
      INTO user_role
      FROM user
      WHERE id_user = user_id;

   RETURN user_role;

END $$

DELIMITER ;