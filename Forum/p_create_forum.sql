DELIMITER $$
$$
CREATE PROCEDURE p_create_forum (mcategory INTEGER, mauthor INTEGER, mtitle VARCHAR(255), mdescription TEXT)
    DETERMINISTIC
BEGIN
	-- Процедура создании форума
	-- Создать форум могут только администраторы

	Declare id_new_forum INTEGER;

	IF  (f_admin_role(mauthor) = 1) THEN
	-- 	Новый форум
		INSERT INTO forum (id_category, title, description)
	    VALUES (mcategory, mtitle, mdescription);
		-- SET @id_new_forum := LAST_INSERT_ID();

	    select LAST_INSERT_ID() into id_new_forum;

		INSERT INTO forum_info (id_forum, num_posts, last_post_id, last_post_author_id, last_post_timestamp)
		VALUES (id_new_forum, 0, NULL, NULL, NULL);
	END IF;

END$$
DELIMITER ;