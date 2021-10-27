-- ДЗ
-- Задание 1
-- Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.

USE shops;

SELECT 
	users.id AS user_id, 
    users.name,
    
	orders.id AS order_id
FROM 
	users
RIGHT JOIN
	orders
ON
	users.id = orders.user_id;
    
-- Задание 2
-- Выведите список товаров products и разделов catalogs, который соответствует товару.

USE shops;

SELECT 
	products.id, 
    products.name, 
    products.price,
    
	catalogs.id AS catalog_id,
	catalogs.name AS catalog
FROM
	products
JOIN
	catalogs
ON 
	products.catalog_id = catalogs.id;

-- Задание 3
-- (по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. Выведите список рейсов flights с русскими названиями городов.

USE EX3;

CREATE TABLE IF NOT EXISTS flights(
id SERIAL PRIMARY KEY,
`from` VARCHAR(50) NOT NULL, 
`to` VARCHAR(50) NOT NULL
);

CREATE TABLE  IF NOT EXISTS cities(
label VARCHAR(50) PRIMARY KEY, 
name VARCHAR(50)
);

ALTER TABLE flights ADD CONSTRAINT fk_from_label FOREIGN KEY(`from`) REFERENCES cities(label);
ALTER TABLE flights ADD CONSTRAINT fk_to_label FOREIGN KEY(`to`) REFERENCES cities(label);

INSERT INTO cities VALUES
('moscow', 'Москва'),
('irkutsk', 'Иркутск'),
('novgorod', 'Новгород'),
('kazan', 'Казань'),
('omsk', 'Омск');

INSERT INTO flights VALUES
(NULL, 'moscow', 'omsk'),
(NULL, 'novgorod', 'kazan'),
(NULL, 'irkutsk', 'moscow'),
(NULL, 'omsk', 'irkutsk'),
(NULL, 'moscow', 'kazan');

-- Запрос

SELECT
	id AS flight_id,
	(SELECT name FROM cities WHERE label = `from`) AS `from`,
	(SELECT name FROM cities WHERE label = `to`) AS `to`
FROM
	flights
ORDER BY
	flight_id;
