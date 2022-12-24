const db = require("../config/db");

const getProductInfo = async (req, res) => {
    try {
        const productId = req.params.productId;
        const productInfo =
            "SELECT product.name, product.imageLink AS imageLink, color, size, price, description, mall.name AS mallName, mall.location, brand.name AS brandName FROM product LEFT JOIN mall ON product.mallId = mall.id LEFT JOIN brand ON product.brandId = brand.id WHERE product.id = ?";
        db.query(productInfo, [productId], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            if (data.length === 0) {
                return res.status(404).json({ error: "Product not found" });
            }
            res.status(200).json({ product: data[0] });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

module.exports.getProductInfo = getProductInfo;
