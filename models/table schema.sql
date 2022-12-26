CREATE DATABASE shopsight;
use shopsight;

CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT,
	email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
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

CREATE TABLE category (
	id  INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY (id)
);

CREATE TABLE subCategory (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    categoryId INT NOT NULL,
    imageLink VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoryId) REFERENCES category(id)
);

CREATE TABLE brand (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255),
    sold INT,
    logo VARCHAR(255) DEFAULT NULL,
    tagline VARCHAR(255) DEFAULT NULL,
    PRIMARY KEY (id)
);
DROP TABLE product;

CREATE TABLE product (
	id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    color JSON DEFAULT NULL,
    size JSON DEFAULT NULL,
    material JSON DEFAULT NULL,
    type INT NOT NULL,
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
VALUES ('Clothing'), ('Footwear'), ('Watches');

SELECT * FROM category;

INSERT INTO brand (name,sold,logo,tagline)
VALUES ('Raymond',2,'https://images.pexels.com/photos/5886041/pexels-photo-5886041.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','This is raymod'),
('Adidas',5,'https://images.pexels.com/photos/2983464/pexels-photo-2983464.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940','Buy from adidas'),
('Reebook',3,'https://images.pexels.com/photos/5480696/pexels-photo-5480696.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500','Reebook is best');

INSERT INTO subCategory (name,categoryId,imageLink)
VALUES ('Kurta',1,'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png'),
('Digital Watch',3,'https://www.prada.com/content/dam/pradanux_products/U/UCS/UCS319/1YOTF010O/UCS319_1YOT_F010O_S_182_SLF.png');

INSERT INTO mall (name,imageLink,location)
VALUES ('Ambuja','https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png','Raipur');

INSERT INTO product (name, color, size, price, brandId, mallId, subCategoryId, imageLink, description)
VALUES
('Collet Pants', '["Red", "Black", "Yellow"]', '["S", "M", "L"]', 1150, 1, 1, 1, 'https://i.ibb.co/C7WGVr0/1.png','This is the best jeans you will ever encounter'),
('Shirt', '["Green", "Blue", "White", "Black"]', '["XS", "M", "L"]', 500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see'),
('Shirt', '["Green", "Blue", "White", "Black"]', '["XS", "M", "L"]', 500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see'),
('Shirt', '["Green", "Blue", "White", "Black"]', '["XS", "M", "L"]', 500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see'),
('Shirt', '["Green", "Blue", "White", "Black"]', '["XS", "M", "L"]', 500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see'),
('Shirt', '["Green", "Blue", "White", "Black"]', '["XS", "M", "L"]', 500, 1, 1, 1, 'https://d3o2e4jr3mxnm3.cloudfront.net/Mens-Jake-Guitar-Vintage-Crusher-Tee_68382_1_lg.png', 'One of the finest product you will ever see');

SELECT * FROM product;

SELECT * FROM subCategory;
SELECT product.name, product.imageLink, color, size, mall.name AS mallName, mall.location FROM product LEFT JOIN mall ON product.mallId = mall.id WHERE product.id = 1;