-- Задание 2
-- Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, 
-- который больше всех общался с нашим пользователем.

use vk;
select 
	from_user_id, 
    concat(
		(select first_name from users where id = messages.from_user_id), ' ', 
		(select last_name from users where id = messages.from_user_id)
	) as name, 
    count(*) as cnt
from messages
where to_user_id = 1
group by from_user_id
order by cnt desc
limit 1;
    
-- Задание 3
-- Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.

SELECT 
 count(id) AS amount_of_likes,
 user_id 
FROM vk.likes
WHERE user_id 
IN (
	SELECT id
	FROM vk.users
	WHERE (YEAR(CURRENT_TIMESTAMP)-YEAR(birthday)) < 10
)
GROUP BY user_id
ORDER BY amount_of_likes DESC
LIMIT 10
;

-- Задание 4
-- Определить кто больше поставил лайков (всего) - мужчины или женщины?

SELECT 
  count(id) AS amount_of_likes,
  user_id 
FROM vk.likes
WHERE 
  user_id IN (
              SELECT id
              FROM vk.users
              WHERE gender = 'M'
              )
UNION
SELECT 
  count(id) AS amount_of_likes,
  user_id
FROM vk.likes
WHERE 
  user_id IN (
              SELECT id
              FROM vk.users
              WHERE gender = 'F'
              )
;

-- Задание 5
-- Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.
SELECT id,
(
(SELECT COUNT(id) FROM vk.likes WHERE user_id = users.id) +
(SELECT COUNT(id) FROM vk.messages WHERE from_user_id = users.id)
) AS cnt
FROM users
ORDER BY cnt DESC 
LIMIT 10
;