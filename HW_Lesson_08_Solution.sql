-- Домашнее задание
-- Задание 1
-- Пусть задан некоторый пользователь. Из всех пользователей соц. сети найдите человека, 
-- который больше всех общался с выбранным пользователем (написал ему сообщений).

USE vk;

SELECT 
	from_user_id AS 'Отправитель',
	COUNT(users.id) AS 'Количество сообщений'
FROM messages
JOIN users ON users.id = messages.from_user_id
WHERE to_user_id = 19
GROUP BY from_user_id
ORDER BY count(users.id) DESC
LIMIT 1;

-- Задание 2
-- Подсчитать общее количество лайков, которые получили пользователи младше 10 лет..

USE vk;

SELECT COUNT(*) AS 'Количество лайков'
FROM likes
JOIN media on likes.target_id = media.id
JOIN users on users.id = media.user_id
WHERE  YEAR(CURDATE()) - YEAR(birthday) < 10;

-- Задание 3
-- Определить кто больше поставил лайков (всего): мужчины или женщины.

USE vk;

SELECT  gender AS 'Пол',
		COUNT(likes.id) AS 'Количество лайков'
FROM likes
JOIN users ON likes.user_id = users.id 
GROUP BY gender;