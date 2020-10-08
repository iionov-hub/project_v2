DELIMITER $$
$$
CREATE PROCEDURE p_create_topic (mforum INTEGER,mauthor INTEGER, mtitle VARCHAR(255), mtext TEXT)
    DETERMINISTIC
BEGIN

	-- Процедура создании топика
	-- Создать топик, могут все
	Declare time_now DATETIME;
	Declare id_new_topic INTEGER;
	Declare is_banned_var BOOLEAN;


	  select now()
	  into time_now;
-- 	проверяем, забанен ли пользователь

	IF not  f_is_baned(mauthor)  THEN
    	-- 	Новый топик
		INSERT INTO topic (id_author, title, text, is_important, is_active, is_approved, date_of_creation)
		VALUES (mauthor, mtitle, mtext, FALSE, TRUE, FALSE, time_now);
	-- 	id нового топика
	    select LAST_INSERT_ID()
	      into id_new_topic;
	-- 	делаем пометку, что топик прикреплен к нужному форуму
		INSERT INTO forum_topic (id_forum, id_topic)
	    VALUES (mforum, id_new_topic);
	-- 	Добавляем topic_info
		INSERT INTO topic_info (id_topic, num_posts, last_post_author_id, last_post_timestamp)
		VALUES (id_new_topic, 1, mauthor, time_now);
	-- 	Увеличиваем счетчик нужного форума
		UPDATE forum_info
	       SET num_posts = num_posts + 1
	      WHERE forum_info.id_forum = mforum;
	-- 	Увеличиваем счетчик сообщений пользователя
		UPDATE user_info
		   SET num_message = num_message + 1
		WHERE mauthor = user_info.id_user;

    END IF;



END$$
DELIMITER ;