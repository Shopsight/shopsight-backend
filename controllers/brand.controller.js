const db = require("../config/db");

const getTopBrands = async (req, res) => {
    try {
        const totalBrands = parseInt(req.params.count);
        const topBrands = "SELECT * FROM brand ORDER BY sold DESC LIMIT ?";
        db.query(topBrands, [totalBrands], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            return res.status(200).json({ topBrands: data });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

const getBrandProducts = async (req, res) => {
    try {
        const brandId = req.params.brandId;
        const getProducts =
            "SELECT brand.name AS brandName, product.imageLink, product.name, product.id FROM brand RIGHT JOIN product ON brand.id = product.brandId WHERE brand.id = ?";
        db.query(getProducts, [brandId], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            res.status(200).json({ products: data });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

module.exports.getTopBrands = getTopBrands;
module.exports.getBrandProducts = getBrandProducts;
