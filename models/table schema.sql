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
    imageLink VARCHAR(255) NOT NULL,
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
    FOREIGN KEY (subCategoryId) REFERENCES category(id)
);

-- inserting values 

INSERT INTO category (name)
VALUES ('Clothes'), ('Footwear'), ('Watches');

INSERT INTO brand (name, logo)
VALUES ('Raymond','https://i.ibb.co/SPXGxgq/Raymond.jpg'),
('Puma','https://i.ibb.co/CJdcqx0/Puma.png'),
('Nike','https://i.ibb.co/xMBcvv1/Nike.jpg'),
('Allen Solly','https://i.ibb.co/QQQYhhC/Allen-Solly.png'),
('Titan','https://i.ibb.co/ncSLyLt/Titan.png');

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

INSERT INTO mall (name, imageLink, location)
VALUES ('Ambuja','https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png','Raipur');

INSERT INTO product (name, color, size, price, brandId, mallId, subCategoryId, imageLink, description)
VALUES
('Collet Pants', '["Red", "Black", "Yellow"]', '["S", "M", "L"]', 150, 1, 1, 1, 'https://i.ibb.co/C7WGVr0/1.png','This is the best jeans you will ever encounter'),
('Shirt', '["Red", "Blue", "White", "Black"]', '["XL", "M", "L"]', 500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see'),
('Shirt', '["Yellow", "Blue", "White", "Black"]', '["XL", "M", "L"]', 100, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see'),
('Shirt', '["Blue", "White", "Black"]', '["XL", "M", "L"]', 1500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see'),
('Shirt', '["Blue", "White", "Black"]', '["M", "L"]', 500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see'),
('Shirt', '["Blue", "White", "Black"]', '["S", "M", "L"]', 500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see');
