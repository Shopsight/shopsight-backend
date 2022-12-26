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

module.exports.userInfo = userInfo;
module.exports.updateFavourites = updateFavourites;
