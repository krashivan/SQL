DROP DATABASE vk;
CREATE DATABASE vk;
USE vk;

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT 'Идентификатор строки', -- искуственный ключ
  first_name VARCHAR(100) NOT NULL COMMENT 'Имя пользователя',
    last_name VARCHAR(100) NOT NULL COMMENT 'Фамилия пользователя',
    birthday DATE NOT NULL COMMENT 'Дата рождения',
    gender ENUM('M', 'F') NOT NULL COMMENT 'Пол',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'Email пользователя',  -- email + phone - натуральный ключ
    phone VARCHAR(12) NOT NULL UNIQUE COMMENT 'Номер телефона пользователя',    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки'
) COMMENT 'Таблица пользователей';

CREATE TABLE profiles (
    user_id INT UNSIGNED NOT NULL PRIMARY KEY COMMENT 'Идентификатор строки',
  city VARCHAR(100) COMMENT 'Город проживания',
    country VARCHAR(100) COMMENT 'Старана проживания',    
    status ENUM('Online', 'Offline', 'Inactive') NOT NULL,
  created_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',    
    updated_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки'
) COMMENT "Таблица профилей";
 
ALTER TABLE profiles ADD CONSTRAINT profiles_user_id FOREIGN KEY (user_id) REFERENCES users(id); -- 1:1

CREATE TABLE friendship (
  user_id INT UNSIGNED NOT NULL COMMENT 'Ссылка на инициатора дружеских отношений',
    friend_id INT UNSIGNED NOT NULL COMMENT 'Ссылка на получателя запроса о дружбе',
    request_type_id INT UNSIGNED NOT NULL COMMENT 'Тип запроса',
    requested_at DATETIME NOT NULL COMMENT 'Время отправки приглашения',
    confirmed_at DATETIME NOT NULL COMMENT 'Время подтверждения приглашения',
    created_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время создания строки',    
    updated_at  DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Дата и время обновленния строки',
    PRIMARY KEY (user_id, friend_id) COMMENT 'Составной первичный ключ'
); 

ALTER TABLE friendship ADD CONSTRAINT friendship_user_id FOREIGN KEY (user_id) REFERENCES users(id); -- 1:n
ALTER TABLE friendship ADD CONSTRAINT friendship_friend_id FOREIGN KEY (friend_id) REFERENCES users(id); -- 1:n

CREATE TABLE friendship_request_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название статуса",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"  
) COMMENT "Типы запроса на дружбы";

ALTER TABLE friendship ADD CONSTRAINT friendship_request_type_id FOREIGN KEY (request_type_id) REFERENCES friendship_request_types(id); 

CREATE TABLE communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор сроки",
  name VARCHAR(150) NOT NULL UNIQUE COMMENT "Название группы",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Группы";

CREATE TABLE communities_users (
  community_id INT UNSIGNED NOT NULL COMMENT "Ссылка на группу",
  user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  PRIMARY KEY (community_id, user_id) COMMENT "Составной первичный ключ",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки", 
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Участники групп, связь между пользователями и группами";

Ivan Krashchenko, [16.09.21 15:53]
ALTER TABLE communities_users ADD CONSTRAINT communities_community_id FOREIGN KEY (community_id) REFERENCES communities(id); 
ALTER TABLE communities_users ADD CONSTRAINT communities_user_id FOREIGN KEY (user_id) REFERENCES users(id); 

CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки", 
  from_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на отправителя сообщения",
  to_user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на получателя сообщения",
  body TEXT NOT NULL COMMENT "Текст сообщения",
  is_important BOOLEAN COMMENT "Признак важности",
  is_delivered BOOLEAN COMMENT "Признак доставки",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Сообщения";

ALTER TABLE messages ADD CONSTRAINT messages_from_user_id FOREIGN KEY (from_user_id) REFERENCES users(id); 
ALTER TABLE messages ADD CONSTRAINT messages_to_user_id FOREIGN KEY (to_user_id) REFERENCES users(id); 

CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  filename VARCHAR(255) NOT NULL COMMENT "Полный путь к файлу",
    media_type_id INT UNSIGNED NOT NULL COMMENT "Ссылка на тип файла",
    metadata JSON NOT NULL COMMENT "Метаданные файла (дополнительные параметры, переменного числа в вазисимости от типа файла)",
    user_id INT UNSIGNED NOT NULL COMMENT "Ссылка на пользователя",
  created_at DATETIME DEFAULT NOW() COMMENT "Время создания строки",
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Медиафайлы";

CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT "Идентификатор строки",
  name VARCHAR(255) NOT NULL UNIQUE COMMENT "Название типа",
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT "Время создания строки",  
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "Время обновления строки"
) COMMENT "Типы медиафайлов";

ALTER TABLE media ADD CONSTRAINT media_media_type_id FOREIGN KEY (media_type_id) REFERENCES media_types(id); 
ALTER TABLE media ADD CONSTRAINT media_user_id FOREIGN KEY (user_id) REFERENCES users(id);