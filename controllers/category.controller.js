const db = require("../config/db");

const getAllCategories = async (req, res) => {
    try {
        const allCategories =
            "SELECT subCat.id, cat.name AS catName, subCat.name AS subCatName, subCat.imageLink FROM category AS cat RIGHT JOIN subCategory AS subCat ON cat.id = subCat.categoryId";
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

module.exports.getAllCategories = getAllCategories;
