CREATE DATABASE shopsight;
use shopsight;

CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE category (
	id  INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);
DROP TABLE product;

INSERT INTO category (name)
VALUES ('wear');

CREATE TABLE product (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    color JSON,
    size JSON,
    brand VARCHAR(255),
    price INT NOT NULL,
    discount INT,
    categoryId INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoryId) REFERENCES category(id)
);

INSERT INTO product (name, color, size, brand, price, discount, categoryId)
VALUE ('Jeans', '["R", "G", "B"]', '["S", "M"]', 'Raymond', 200, 2, 1);

SELECT * FROM product;