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

module.exports.getTopBrands = getTopBrands;
