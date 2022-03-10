-- Задание 1
-- Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах users, catalogs и 
-- products в таблицу logs помещается время и дата создания записи, название таблицы, идентификатор 
-- первичного ключа и содержимое поля name.

use shops;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	created_at DATETIME NOT NULL,
	tables_name VARCHAR(45) NOT NULL,
	pr_key_id BIGINT(20) NOT NULL,
	names_value VARCHAR(45) NOT NULL
) ENGINE = ARCHIVE;

DROP TRIGGER IF EXISTS log_users;
delimiter //
CREATE TRIGGER log_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, tables_name, pr_key_id, names_value)
	VALUES (NOW(), 'users', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS log_catalogs;
delimiter //
CREATE TRIGGER log_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, tables_name, pr_key_id, names_value)
	VALUES (NOW(), 'catalogs', NEW.id, NEW.name);
END //
delimiter ;

DROP TRIGGER IF EXISTS log_products;
delimiter //
CREATE TRIGGER log_products  AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs (created_at, tables_name, pr_key_id, names_value)
	VALUES (NOW(), 'products', NEW.id, NEW.name);
END //
delimiter ;

-- Задание 2
-- (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.

DROP TABLE IF EXISTS test_users; 
CREATE TABLE test_users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	birthday_at DATE,
	`created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
 	`updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


DROP PROCEDURE IF EXISTS insert_into_users ;
delimiter //
CREATE PROCEDURE insert_into_users ()
BEGIN
	DECLARE i INT DEFAULT 100;
	DECLARE j INT DEFAULT 0;
	WHILE i > 0 DO
		INSERT INTO test_users(name, birthday_at) VALUES (CONCAT('user_', j), NOW());
		SET j = j + 1;
		SET i = i - 1;
	END WHILE;
END //
delimiter ;