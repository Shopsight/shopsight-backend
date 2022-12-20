const express = require("express");
const router = express.Router();

const { getCategoryProducts } = require("../controllers/auth.controller");

router.get("/:category", getCategoryProducts);

module.exports = router;
