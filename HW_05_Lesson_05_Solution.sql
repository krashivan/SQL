-- Тема Операции, задание 1
-- Пусть в таблице users поля created_at и updated_at оказались незаполненными.
-- Заполните их текущими датой и временем.
  
UPDATE users SET created_at = CURRENT_TIMESTAMP WHERE ID < 7;
UPDATE users SET updated_at = CURRENT_TIMESTAMP WHERE ID < 7;

-- Тема Операции, задание 2
-- Таблица users была неудачно спроектирована.
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались
-- значения в формате "20.10.2017 8:10".
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

UPDATE users SET created_at = STR_TO_DATE(created_at,'%d %M %Y %H:%i') WHERE id is null;
UPDATE users SET updated_at = STR_TO_DATE(updated_at,'%d %M %Y %H:%i') WHERE id is null;

-- Тема Операции, задание 3
-- В таблице складских запасов storehouses_products в поле value могут встречаться самые
-- разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы.
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения
-- значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

SELECT id, storehouse_id, product_id, `value`, created_at, updated_at FROM storehouses_products ORDER BY `value` = 0, `value` asc;

-- Тема Операции, задание 4
-- (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий (may, august)

SELECT name, birthday_at, CASE WHEN DATE_FORMAT(birthday_at, '%m') = 05 THEN 'May' WHEN DATE_FORMAT(birthday_at, '%m') = 08 THEN 'August' END as mounth 
FROM users WHERE DATE_FORMAT(birthday_at, '%m') = 05 OR DATE_FORMAT(birthday_at, '%m') = 08;

-- Тема Операции, задание 5
-- (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. 
-- SELECT * FROM catalogs WHERE id IN (5, 1, 2); Отсортируйте записи в порядке, заданном в списке IN.

SELECT * FROM catalogs WHERE id IN(5, 1, 2) ORDER BY CASE WHEN id = 5 THEN 0 WHEN id = 1 THEN 1 WHEN id = 2 THEN 2 END;

-- Тема Агрегация, задание 1
-- Подсчитайте средний возраст пользователей в таблице users
-- Таблица users создана для задания 2 темы Операции

SELECT ceiling(AVG((TO_DAYS(NOW()) - TO_DAYS(birthday_at)))/365.25) as average_age FROM users;

-- Тема Агрегация, задание 2
-- Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
-- Таблица users создана для задания 2 темы Операции

SELECT DAYNAME(CONCAT(YEAR(NOW()), '-', SUBSTRING(birthday_at, 6, 10))) AS days_of_week, COUNT(*) AS amount_of_birthdays FROM users GROUP BY days_of_week ORDER BY amount_of_birthdays DESC;

-- Тема Агрегация, задание 3
-- (по желанию) Подсчитайте произведение чисел в столбце таблицы.

SELECT ROUND(EXP(SUM(LOG(value))),0) as multiplier_product FROM integers;