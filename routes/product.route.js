const express = require("express");
const router = express.Router();

const { getProductInfo } = require("../controllers/product.controller");

router.get("/:productId", getProductInfo);

module.exports = router;
