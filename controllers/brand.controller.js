const db = require("../config/db");

const getAllBrands = async (req, res) => {
    try {
        const getBrands = "SELECT * FROM brand";
        db.query(getBrands, [], async (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong!! Please try again" });
            }
            return res.status(200).json({ brands: data });
        });
    } catch (err) {
        res.status(500).json({ error: "Internal Server Error" });
    }
};

const getBrandProducts = async (req, res) => {
    try {
        const brandId = req.params.brandId;
        const getBrand = "SELECT * FROM brand WHERE id = ?";
        db.query(getBrand, [brandId], async (e, d) => {
            if (e) {
                return res.status(401).json({ error: "Something went wrong!! Please try again" });
            }
            if (d.length === 0) {
                return res.status(404).json({ error: "Brand does not exists" });
            }
            const getProducts =
                "SELECT brand.name AS brandName, product.imageLink, product.name, product.id, color, size, price FROM brand RIGHT JOIN product ON brand.id = product.brandId WHERE brand.id = ? ORDER BY id DESC";
            db.query(getProducts, [brandId], async (err, data) => {
                if (err) {
                    return res
                        .status(401)
                        .json({ error: "Something went wrong!! Please try again" });
                }
                const products = data.map((product) => {
                    return {
                        ...product,
                        color: JSON.parse(product.color),
                        size: JSON.parse(product.size),
                    };
                });
                return res.status(200).json({ brandName: d[0].name, products: products });
            });
        });
    } catch (err) {
        res.status(500).json({ error: "Internal Server Error" });
    }
};

module.exports.getAllBrands = getAllBrands;
module.exports.getBrandProducts = getBrandProducts;
