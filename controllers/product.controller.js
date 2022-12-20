const db = require("../config/db");

const getCategoryProducts = async (req, res) => {
    try {
        const category = req.params.category;
        const getProducts =
            "SELECT cat.name AS 'category_name', prod.name AS 'product_name' FROM category AS cat LEFT JOIN products AS prod WHERE category = ?";
        db.query(getProducts, [category], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            res.status(200).json({ data: data });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

module.exports.getCategoryProducts = getCategoryProducts;
