const db = require("../config/db");

const getAllCategories = async (req, res) => {
    try {
        const allCategories =
            "SELECT subCat.id, cat.name AS catName, subCat.name AS subCatName, subCat.id, imageLink, subCat.type FROM category AS cat RIGHT JOIN subCategory AS subCat ON cat.id = subCat.categoryId";
        db.query(allCategories, [], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong! Please try again" });
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
        res.status(500).json({ error: "Internal Server Error" });
    }
};

const getSubCategoryProducts = async (req, res) => {
    try {
        const subCategoryId = req.params.subCategoryId;
        const getSubCategory = "SELECT * FROM subCategory WHERE id = ?";
        db.query(getSubCategory, [subCategoryId], (e, d) => {
            if (e) {
                return res.status(401).json({ error: "Something went wrong! Please try again" });
            }
            if (d.length === 0) {
                return res.status(404).json({ error: "Category does not exists" });
            }
            const allSubCategoryProducts =
                "SELECT subCat.name AS subCatName, product.imageLink, product.name, product.id, color, size, price FROM subCategory AS subCat RIGHT JOIN product ON subCat.id = product.subCategoryId WHERE subCat.id = ?";
            db.query(allSubCategoryProducts, [subCategoryId], async (err, data) => {
                if (err) {
                    return res
                        .status(401)
                        .json({ error: "Something went wrong!! Please try again" });
                }
                return res.status(200).json({ categoryName: d[0].name, products: data });
            });
        });
    } catch (err) {
        res.status(500).json({ error: "Internal Server Error" });
    }
};

module.exports.getAllCategories = getAllCategories;
module.exports.getSubCategoryProducts = getSubCategoryProducts;
