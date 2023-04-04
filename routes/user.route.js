const express = require("express");
const router = express.Router();

const {
    userInfo,
    updateFavourites,
    getFavourites,
    getFavouritesBrand,
} = require("../controllers/user.controller");
const authenticateToken = require("../middleware/verifyJWT.middleware");

router.get("/info", authenticateToken, userInfo);
router.put("/favourites", authenticateToken, updateFavourites);
router.get("/favourites", authenticateToken, getFavourites);
router.get("/favourites-brand", authenticateToken, getFavouritesBrand);

module.exports = router;
