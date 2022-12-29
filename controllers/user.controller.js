const db = require("../config/db");

const userInfo = (req, res) => {
    try {
        const id = req.user.id;
        const findUser = "SELECT * FROM user WHERE id = ?";
        db.query(findUser, [id], (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            if (data.length === 0) {
                return res.status(401).json({ error: "No user found" });
            }
            const { password, ...user } = data[0];
            res.status(200).json({ user: user });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

const updateFavourites = async (req, res) => {
    try {
        const id = req.user.id;
        const { fav } = req.body;
        const updateFavourites = "UPDATE user SET favourites = ? WHERE id = ?";
        db.query(updateFavourites, [fav, id], (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            res.status(200).json({ msg: "Updated favourites" });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

const getFavourites = async (req, res) => {
    try {
        const id = req.user.id;
        const findUser = "SELECT * FROM user WHERE id = ?";
        const products =
            "SELECT product.id, product.name, price, product.imageLink, brand.name AS brandName FROM product LEFT JOIN brand ON product.brandId = brand.id";
        db.query(findUser, [id], (err, data) => {
            if (err) {
                return res.status(401).json({ error: "Something went wrong" });
            }
            if (data.length === 0) {
                return res.status(401).json({ error: "No user found" });
            }
            if (data[0].favourites === null) {
                return res
                    .status(200)
                    .json({ name: data[0].name, email: data[0].email, favourites: null });
            }
            let favs = new Set(JSON.parse(data[0].favourites));
            db.query(products, [], (e, d) => {
                if (e) {
                    return res.status(401).json({ error: "Something went wrong" });
                }
                const favProducts = d.filter((prod) => {
                    return favs.has(String(prod.id));
                });
                return res
                    .status(200)
                    .json({ name: data[0].name, email: data[0].email, favourites: favProducts });
            });
        });
    } catch (err) {
        res.status(500).json({ error: "Something went wrong" });
    }
};

module.exports.userInfo = userInfo;
module.exports.updateFavourites = updateFavourites;
module.exports.getFavourites = getFavourites;
