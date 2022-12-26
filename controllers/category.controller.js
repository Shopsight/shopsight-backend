const db = require("../config/db");

const getAllCategories = async (req, res) => {
    try {
        const allCategories =
            "SELECT subCat.id, cat.name AS catName, subCat.name AS subCatName, subCat.id, imageLink, subCat.type FROM category AS cat RIGHT JOIN subCategory AS subCat ON cat.id = subCat.categoryId";
        db.query(allCategories, [], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            const cat = {};
            data.forEach((category) => {
                if (cat[category.catName]) {
                    cat[category.catName].push(category);
                } else {
                    cat[category.catName] = [category];
                }
            });
            return res.status(200).json({ categories: cat });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

const getSubCategoryProducts = async (req, res) => {
    try {
        const subCategoryId = req.params.subCategoryId;
        const allSubCategoryProducts =
            "SELECT subCat.name AS subCatName, product.imageLink, product.name, product.id, color, size, price FROM subCategory AS subCat RIGHT JOIN product ON subCat.id = product.subCategoryId WHERE subCat.id = ?";
        db.query(allSubCategoryProducts, [subCategoryId], async (err, data) => {
            if (err) {
                console.log(err);
                return res.status(401).json({ error: "Something went wrong" });
            }
            return res.status(200).json({ products: data });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

module.exports.getAllCategories = getAllCategories;
module.exports.getSubCategoryProducts = getSubCategoryProducts;
