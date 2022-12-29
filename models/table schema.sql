-- DROP DATABASE shopsight;
CREATE DATABASE shopsight;
use shopsight;

-- DROP TABLE user;

CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    favourites json DEFAULT NULL,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE mall (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

-- DROP TABLE category;

CREATE TABLE category (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

-- DROP TABLE subCategory;

CREATE TABLE subCategory (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    categoryId INT NOT NULL,
    imageLink VARCHAR(255) DEFAULT NULL,
    type INT NOT NULL DEFAULT 1,
    PRIMARY KEY (id),
    FOREIGN KEY (categoryId) REFERENCES category(id)
);

CREATE TABLE brand (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    logo VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
);
-- DROP TABLE product;

CREATE TABLE product (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    color JSON DEFAULT NULL,
    size JSON DEFAULT NULL,
    price INT NOT NULL,
    brandId INT NOT NULL,
    mallId INT NOT NULL,
    subCategoryId INT NOT NULL,
    imageLink VARCHAR(255),
    description VARCHAR(255),
    PRIMARY KEY (id),
    FOREIGN KEY (brandId) REFERENCES brand(id),
    FOREIGN KEY (mallId) REFERENCES mall(id),
    FOREIGN KEY (subCategoryId) REFERENCES subCategory(id)
);

-- inserting values 

INSERT INTO category (name)
VALUES ('Clothes'), ('Footwear'), ('Watches');

INSERT INTO brand (name, logo)
VALUES ('Raymond','https://i.ibb.co/SPXGxgq/Raymond.jpg'),
('Puma','https://i.ibb.co/CJdcqx0/Puma.png'),
('Nike','https://i.ibb.co/xMBcvv1/Nike.jpg'),
('Allen Solly','https://i.ibb.co/QQQYhhC/Allen-Solly.png'),
('Titan','https://i.ibb.co/ncSLyLt/Titan.png'),
('Tommy Hilfiger','https://i.ibb.co/hCVTbcX/Tommy-Hilfiger-logo.jpg'),
('Park Avenue','https://i.ibb.co/JyFwzcL/park-avenue.png'),
('Calvin Kelin','https://i.ibb.co/q5ZyNk5/calvin.png'),
('Allen Cooper','https://i.ibb.co/QnKvQCN/allen-cooper.png');

INSERT INTO subCategory (name, categoryId, imageLink, type)
VALUES 
-- Clothes
('Formal Shirt',1,'https://i.ibb.co/gwN9GWW/Formalshirt-male.jpg',1),
('Casual Shirt',1,'https://i.ibb.co/prCQPVM/Casualshirt-male.jpg',1),
('Kurta',1,'https://i.ibb.co/yP86Kvt/Kurta-male.jpg',1),
('Suit',1,'https://i.ibb.co/dG510BV/Suit-male.jpg',1),
('Jeans',1,'https://i.ibb.co/bPFyZMM/Jeans-male.jpg',1),
('T-Shirt',1,'https://i.ibb.co/r34J1WY/Tshirt-women.jpg',0),
('Top',1,'https://i.ibb.co/tJWkK3w/Top-women.webp',0),
('Jeans',1,'https://i.ibb.co/g96Vn0T/Jeans-women.jpg',0),
('Jacket',1,'https://i.ibb.co/fY0yFZ2/Jacket-women.jpg',0),
('Saree',1,'https://i.ibb.co/M1ypmHj/Saree-women.jpg',0),
-- Footwear
('Sports',2,'https://i.ibb.co/yqH7J3z/Sports-men.jpg',1),
('Sneakers',2,'https://i.ibb.co/wY0zNQY/Sneakers-men.jpg',1),
('Sandals',2,'https://i.ibb.co/5FFzx2c/Sandals-men.jpg',1),
('Formal Shoes',2,'https://i.ibb.co/30TxVMS/Formal-men.jpg',1),
('Casual',2,'https://i.ibb.co/qB5hkdW/Casual-men.jpg',1),
('Sports',2,'https://i.ibb.co/Sd4Qfwn/Sportsshoes-women.jpg',0),
('Heels',2,'https://i.ibb.co/fXDYBS6/Heels-women.webp',0),
('Flats',2,'https://i.ibb.co/FxGzwZt/Flats-women.jpg',0),
('Casual Shoes',2,'https://i.ibb.co/mHwr2Dd/Casual-women.jpg',0),
('Boots',2,'https://i.ibb.co/kqnbVvx/Boots-women.jpg',0),
-- Watches
('Digital',3,'https://i.ibb.co/jZMChNd/Digital-men.jpg',1),
('Formal',3,'https://i.ibb.co/w7jTkzw/Formal-men.jpg',1),
('Band',3,'https://i.ibb.co/vQjYFRK/Band-male.jpg',1),
('Digital',3,'https://i.ibb.co/XLdnJXJ/Digital-women.jpg',0),
('Formal',3,'https://i.ibb.co/SJSpGSF/Formal-women.jpg',0),
('Band',3,'https://i.ibb.co/wwNMKRV/Band-women.jpg',0);

INSERT INTO mall (name, location)
VALUES ('Shop 12 Ambuja Mall','Vidhan Sabha'),
('Shop 9 36 City Mall','Vip Road'),
('Shop 4 City Center Mall','Pandri'),
('Sumeet','Devendra Nagar'),
('Kishore Mall','Rajendra Nagar');

-- DROP DATABASE shopsight;

INSERT INTO product (name, color, size, price, brandId, mallId, subCategoryId, imageLink, description)
VALUES
('Men slim fit formal shirt', '["Black"]', '["S", "M", "L"]', 1150, 7, 1, 1, 'https://i.ibb.co/yWwfwjs/men-slim-fit-formal-Park-Avenue-shirt-blue.jpg','Black solid formal shirt, has a spread collar, long sleeves, button placket, and straight hem'),
('Men formal shirt', '["Black"]', '["XL", "M", "L"]', 1899, 8, 3, 1, 'https://i.ibb.co/vQM8WNK/men-slim-fit-formal-raymond-shirt-black.jpg', 'Black solid formal shirt, has a spread collar, button placket, a patch pocket, long sleeves, curved hem'),
('Men slim fit formal shirt', '["Red"]', '["S", "M", "L"]', 1150, 7, 1, 1, 'https://i.ibb.co/5Whh0Wh/men-slim-fit-formal-Park-Avenue-shirt-ewd.webp','Red solid formal shirt, has a spread collar, long sleeves, button placket, and straight hem'),
('Men slim fit formal shirt', '["Red"]', '["S", "M", "L"]', 1150, 1, 4, 1, 'https://i.ibb.co/SNsfSW7/men-slim-fit-formal-Raymond-shirt-red.webp','Red solid formal shirt, has a spread collar, long sleeves, button placket, and straight hem'),
('Winter Red Jacket', '["Red"]', '["S", "M", "L"]', 1550, 8, 1, 9, 'https://i.ibb.co/4FYDRQZ/Women-jacket-red.webp','This is the best jeans you will ever encounter'),
('Winter Black Jacket', '["Black"]', '["XL", "M", "L"]', 1600, 1, 3, 9, 'https://i.ibb.co/JzBVqjk/Women-jacket-Black.jpg', 'One of the finest product you will ever see'),
('Winter Blue Jacket', '["Blue"]', '["XL", "M", "L"]', 1100, 1, 1, 9, 'https://i.ibb.co/HV5CkXS/Women-jacket-blue.jpg', 'One of the finest product you will ever see'),
('Sport Shoe Red', '["Red"]', '["XL", "M", "L"]', 1500, 2, 3, 11, 'https://i.ibb.co/9h7SBTS/Sportsshoe-red.jpg%22', 'One of the finest product you will ever see'),
('Sport Shoe Blue', '["Blue"]', '["M", "L"]', 500, 3, 1, 11, 'https://i.ibb.co/GJ8B36W/Sports-shoe-blue.jpg', 'One of the finest product you will ever see'),
('Sport Shoe Black', '["Black"]', '["S", "M", "L"]', 900, 1, 2, 11, 'https://i.ibb.co/5GQmx8b/Sports-shoes-black.jpg', 'One of the finest product you will ever see'),
('Men slim fit formal Jeams', '["Black"]', '["S", "M", "L"]', 1550, 1, 5, 5, 'https://i.ibb.co/8rY6qbV/men-slim-fit-jeans-raymond-jeans-blue.jpg','5-pocket mid-rise jeans, clean look, light fade, has a button and zip closure, and waistband with belt loops'),
('Men slim fit formal Jeams', '["Red"]', '["S", "M", "L"]', 1690, 7,4, 5, 'https://i.ibb.co/2ZLH2wq/men-slim-fit-jeans-Park-Avenue-jeans-blue.jpg','5-pocket mid-rise jeans, clean look, light fade, has a button and zip closure, and waistband with belt loops'),
('Men slim fit formal Jeams', '["Blue"]', '["S", "M", "L"]', 1550, 9,3, 5, 'https://i.ibb.co/QK9dJ7v/men-slim-fit-jeans-allen-jeans-blue.webp','5-pocket mid-rise jeans, clean look, light fade, has a button and zip closure, and waistband with belt loops'),
('Men slim fit formal Jeams', '["Blue"]', '["S", "M", "L"]', 1950, 8, 2, 5, 'https://i.ibb.co/tqSgxSh/men-slim-fit-jeans-calvin-jeans-blue.jpg','5-pocket mid-rise jeans, clean look, light fade, has a button and zip closure, and waistband with belt loops');
