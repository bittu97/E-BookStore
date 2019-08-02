show databases;
use ebook;

drop table users;
CREATE TABLE IF NOT EXISTS users (
  userId INT AUTO_INCREMENT,
  firstName VARCHAR(80),
  lastName VARCHAR(80),
  emailId VARCHAR(100),
  username VARCHAR(80) NOT NULL ,
  password VARCHAR(20) NOT NULL ,
  mobileNumber VARCHAR(10),
  createdDate TIMESTAMP,
  createdBy VARCHAR(80),
  updatedDate TIMESTAMP,
  updatedBy VARCHAR(80),
  status VARCHAR(45),
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (userId),
  UNIQUE (username));
  
  INSERT INTO users(userId,firstName,lastName,emailId,username,
  password,mobileNumber,createdDate,createdBy,updatedDate,
  updatedBy,status,enabled) VALUES(1,'Shubhanshu','Shukla',
  'shubhanshushukla123@gmail.com','shubh','123456','6264322368','2019-01-01 00:00:01',
  'Shubhanshu','2008-01-01 00:00:01','Shubhanshu','active',true);
  
  SELECT * FROM users;
  
  DROP TABLE users;
  DROP TABLE user_roles;
  
  CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));
  
  CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
  
  CREATE TABLE user_roles (
  user_role_id int(11) NOT NULL AUTO_INCREMENT,
  user_id int(45) NOT NULL,
  role varchar(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (role,user_id),
  KEY fk_username_idx (user_id),
  CONSTRAINT fk_userid FOREIGN KEY (user_id) REFERENCES users (userId));
  
  INSERT INTO users(username,password,enabled)
VALUES ('mkyong','123456', true);
INSERT INTO users(username,password,enabled)
VALUES ('alex','123456', true);
INSERT INTO users(username,password,enabled)
VALUES ('shubh','123456', true);

INSERT INTO user_roles (username, role)
VALUES ('mkyong', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('mkyong', 'ROLE_ADMIN');
INSERT INTO user_roles (username, role)
VALUES ('alex', 'ROLE_USER');
INSERT INTO user_roles (username, role)
VALUES ('shubh', 'ROLE_ADMIN');

INSERT INTO user_roles (user_id, role)
VALUES (10, 'ROLE_USER');

select * from user_roles;
update user_roles set role='ROLE_ADMIN' where user_id=6;

select * from users ;

update users set username='admin' where userId=6;

delete from users where userId=13;
truncate table users;

alter table user_roles; 

CREATE TABLE IF NOT EXISTS books (
  bookId INT AUTO_INCREMENT,
  categoryId INT,
  title VARCHAR(80),
  author VARCHAR(80),
  publisher VARCHAR(80),
  description VARCHAR(500),
  language VARCHAR(80),
  addition VARCHAR(80) NOT NULL ,
  pages INT NOT NULL ,
  isbn VARCHAR(80),
  price DECIMAL(6,2),
  quantity INT,
  createdDate TIMESTAMP,
  createdBy VARCHAR(80),
  updatedDate TIMESTAMP,
  updatedBy VARCHAR(80),
  KEY fk_categoryId_idx (categoryId),
  CONSTRAINT fk_categoryId FOREIGN KEY (categoryId) REFERENCES category (categoryId),
  PRIMARY KEY (bookId));
  
  CREATE TABLE upload (
  uploadId INT NOT NULL AUTO_INCREMENT,
  bookId INT,
  fileName varchar(45) NOT NULL,
  status varchar(45),
  filePath varchar(100),
  createdDate TIMESTAMP,
  createdBy VARCHAR(80),
  updatedDate TIMESTAMP,
  updatedBy VARCHAR(80),
  PRIMARY KEY (uploadId),
  KEY fk_bookId_i (bookId),
  CONSTRAINT fk_bookId_i FOREIGN KEY (bookId) REFERENCES books (bookId));
  
  CREATE TABLE category (
  categoryId INT NOT NULL AUTO_INCREMENT,
  categoryName varchar(80) NOT NULL,
  status varchar(80),
  description VARCHAR(500),
  createdDate TIMESTAMP,
  createdBy VARCHAR(80),
  updatedDate TIMESTAMP,
  updatedBy VARCHAR(80),
  PRIMARY KEY (categoryId));
  
    select * from books;
  select * from category;
  delete from category where categoryName='XYZ';
  
  INSERT INTO books(categoryId,title,author,publisher,description,
  language,addition,pages,isbn,price,quantity,createdDate,createdBy,updatedDate,
  updatedBy) VALUES(7,'JAVA','Rahul','publisher1','abc abc xyz','english','1st addition',
  50,'541-65-065',50.50,5,'2019-01-01 00:00:01','Shubhanshu','2008-01-01 00:00:01','Shubhanshu');
  
  INSERT INTO category(categoryName,status,description,
  createdDate,createdBy,updatedDate,updatedBy) VALUES('Engineering','ACTIVE','Engineering',
  '2019-01-01 00:00:01','Shubhanshu','2008-01-01 00:00:01','Shubhanshu');
  
  
  
  CREATE TABLE cart(
  cartId INT NOT NULL AUTO_INCREMENT,
  username varchar(80),
  bookId INT,
  price DECIMAL(6,2),
  quantity INT,
  totalPrice DECIMAL(6,2),
  createdDate TIMESTAMP,
  createdBy VARCHAR(80),
  updatedDate TIMESTAMP,
  updatedBy VARCHAR(80),
  KEY fk_userId_idx (username),
  CONSTRAINT fk_bookId FOREIGN KEY (bookId) REFERENCES books (bookId),
  PRIMARY KEY (cartId));
 
 SELECT SUM(quantity) AS cartItems FROM cart where username = 'admin';
  select * from cart;
  drop table cart;
  
  select * from books;
  
  select * from books,cart where cart.bookId = books.bookId and username='admin';
  
  create table orders (
	orderId INT NOT NULL AUTO_INCREMENT,
    userId int,
    fullName VARCHAR(80),
	emailId VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    zip int,
    createdDate TIMESTAMP,
	createdBy VARCHAR(80),
	updatedDate TIMESTAMP,
	updatedBy VARCHAR(80),
    KEY fk_userId_idx (userId),
	CONSTRAINT fk_userId_order FOREIGN KEY (userId) REFERENCES users (userId),
    PRIMARY KEY(orderId));
  
  select * from orders;
    select * from upload;
    
    select * from books where uuid='b1690539-cbbc-46ca-a59d-b85583be02d6';
  select userId from users where username = 'admin';
  truncate table books;
  select * from orders;
    select * from books;
    
    SET FOREIGN_KEY_CHECKS=1;
  
  UPDATE books b,cart c SET b.quantity = b.quantity-c.quantity where b.bookId = ?
  select b.bookId from books b,cart c where c.bookId = b.bookId and c.username = 'shantanu';
  
  ALTER TABLE books ADD COLUMN uuid VARCHAR(50);
  
  alter table upload modify filePath varchar(255);
  desc upload;
  select * from users;
  show databases;
  use ebook;