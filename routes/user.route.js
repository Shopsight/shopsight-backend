const express = require("express");
const router = express.Router();

const { userInfo, updateFavourites } = require("../controllers/user.controller");
const authenticateToken = require("../middleware/verifyJWT.middleware");

router.get("/info", authenticateToken, userInfo);
router.put("/favourites", authenticateToken, updateFavourites);

module.exports = router;
