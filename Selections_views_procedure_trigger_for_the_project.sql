-- ВЫБОРКИ
USE wiki;

-- Выборка показывает в каком обсуждении пользователи оставили наибольшее количетсво сообщений
SELECT 
	from_user_id AS 'Отправитель', d.name AS 'Обсуждение', COUNT(m.id) AS 'Количество сообщений'
FROM messages m 
JOIN discussions d ON d.id=m.discussion_id 
GROUP BY from_user_id
ORDER BY COUNT(m.id) DESC;

-- Выборка показывает количество статей, написанных первыми 3-мя зарегестрироавнными пользователями
SELECT 
	t.user_id AS 'Пользователи',
	count(t.id) AS 'Количество статей'
FROM topics t
JOIN users u ON u.id = t.user_id
GROUP BY user_id
ORDER BY YEAR(CURDATE()) - YEAR(u.created_at) desc
LIMIT  3;

-- ПРЕДСТАВЛЕНИЯ
USE wiki;

-- Представление показыват, сколько было написанно статей каждым пользователем, используя вложенный запрос
CREATE OR REPLACE VIEW user_topics (users, topics) AS
SELECT 
	first_name AS 'Пользователи',
  (SELECT count(*) FROM topics WHERE user_id = users.id) AS 'Количество статей'
FROM users;

SELECT * FROM user_topics;

-- Представление показывает, кем были загружены медиа
CREATE OR REPLACE VIEW user_media (users, media) AS
SELECT 
	u.id, 
	mt.media_id 
FROM media_topics mt 
JOIN topics t ON t.id = mt.topic_id 
JOIN users u ON u.id = t.user_id;

SELECT * FROM user_media;

-- ПРОЦЕДУРА И ТРИГГЕР
USE wiki;

-- Процедура показывает появились ли новые пользователи за прошедшую неделю
DROP PROCEDURE IF EXISTS Activity_Check;
delimiter //
CREATE PROCEDURE Activity_Check()
BEGIN
	SELECT datediff(curdate(),date(max(created_at))) FROM users INTO @a;
	IF(@a < 7) THEN
		SELECT 'Нет новых пользователей за прошедшую неделю';
		ELSE
		SELECT 'Есть новые пользователи за прошедшую неделю';
	END IF;
END //
delimiter ;

CALL Activity_Check();

-- Тригер останавливает добавление новой статьи, если в ней нет ссылок на источники
DROP TRIGGER IF EXISTS nullRefTrigger;
delimiter //
CREATE TRIGGER nullRefTrigger BEFORE INSERT ON refs_topics
FOR EACH ROW
BEGIN
	IF(ISNULL(NEW.refs_id)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Trigger Warning! The topic without reference';
	END IF;
END //
delimiter ;
