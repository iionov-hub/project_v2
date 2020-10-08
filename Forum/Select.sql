-- Отобразить все форумы в какой-то категории
SELECT * FROM forum as f JOIN forum_info as fi ON f.id = fi.id_forum WHERE id_category = 1;


-- Отобразить все топики в форуме, отображая сначала все важные
SELECT t.id, id_author, title, text, is_important, is_active, is_approved, date_of_creation
  FROM forum_topic as ft JOIN topic as t ON ft.id_topic = t.id
  WHERE id_forum = 3 ORDER BY is_important DESC;



-- Отобразить все посты из топика.
SELECT id_author, title, text, subtext, date_of_creation, date_last_edit
  FROM post as p JOIN topic_post as tp ON (p.id = tp.id_post)
   WHERE tp.id_topic = 4
  ORDER BY p.id;


-- Отобразить топик и все посты после по времени создания
SELECT * FROM (
  SELECT id_author, title, text, null, date_of_creation as dc, date_of_creation FROM topic t WHERE t.id = 5
    UNION
  SELECT id_author, title, text, subtext, date_of_creation as dc, date_last_edit
    FROM post as p JOIN topic_post as tp ON (p.id = tp.id_post)
    WHERE tp.id_topic = 4) as l ORDER BY dc;