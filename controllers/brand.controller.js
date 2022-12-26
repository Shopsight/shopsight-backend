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

const getAllBrands = async (req, res) => {
    try {
        const getBrands = "SELECT * FROM brand";
        db.query(getBrands, [], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            console.log(data);
            return res.status(200).json({ brands: data });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

const getBrandProducts = async (req, res) => {
    try {
        const brandId = req.params.brandId;
        const getProducts =
            "SELECT brand.name AS brandName, product.imageLink, product.name, product.id, color, size, price FROM brand RIGHT JOIN product ON brand.id = product.brandId WHERE brand.id = ? ORDER BY id DESC";
        db.query(getProducts, [brandId], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            const products = data.map((product) => {
                return {
                    ...product,
                    color: JSON.parse(product.color),
                    size: JSON.parse(product.size),
                };
            });
            res.status(200).json({ products: products });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

module.exports.getTopBrands = getTopBrands;
module.exports.getAllBrands = getAllBrands;
module.exports.getBrandProducts = getBrandProducts;
