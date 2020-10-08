DELIMITER $$
$$
CREATE PROCEDURE p_create_post (mtopic INTEGER, mauthor INTEGER, mtitle VARCHAR(255), mtext TEXT, msubtext TEXT)
    DETERMINISTIC
BEGIN

	-- Процедура создании топика
	-- Создать топик, могут все
    Declare id_new_post INTEGER;
	Declare id_new_forum INTEGER;
	Declare time_now DATETIME;
	Declare is_active_var BOOLEAN;

	  select now()
	  into time_now;
-- 	проверяем, забанен ли пользователь

	-- 	проверяем, забанен ли пользователь
    IF not  f_is_baned(mauthor)  THEN

	-- 	узнаем, активная ли тема
		SELECT is_active
	      INTO is_active_var
	      FROM topic
	     WHERE id = mtopic;


		IF is_active_var THEN
				-- 	Новый пост
			INSERT INTO post (id_author, title, text, subtext, date_of_creation, date_last_edit)
			VALUES (mauthor, mtitle, mtext, msubtext, time_now, time_now);
		-- 	id нового поста
            select LAST_INSERT_ID()
	          into id_new_post;
		-- 	делаем пометку, что пост прикреплен к нужному топику
			INSERT INTO topic_post (id_topic, id_post)
		         VALUES (mtopic, id_new_post);
		-- 	Увеличиваем счетчик нужной темы
			UPDATE topic_info
		      SET num_posts = num_posts + 1
		     WHERE id_topic = mtopic;
		-- 	Находим форум, в который мы добавили пост
			SELECT id_forum
			  INTO id_new_forum
			  FROM topic
			  JOIN forum_topic ON (topic.id = forum_topic.id_topic)
		     WHERE topic.id = mtopic;
		-- 	Обновляем информацию о форуме
			UPDATE forum_info
			SET num_posts = num_posts + 1, last_post_author_id = mauthor, last_post_id = id_new_post, last_post_timestamp = time_now
			WHERE id_forum = id_new_forum;
		-- 	Увеличиваем счетчик сообщений пользователю.
			UPDATE user_info
		       SET num_message = num_message + 1
		     WHERE id_user = mauthor;

	    END IF;

	END IF;



END$$
DELIMITER ;