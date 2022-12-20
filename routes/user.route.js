const express = require("express");
const router = express.Router();

const { userInfo } = require("../controllers/user.controller");
const authenticateToken = require("../middleware/verifyJWT.middleware");

router.get("/info", authenticateToken, userInfo);

module.exports = router;
