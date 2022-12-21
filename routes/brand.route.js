const express = require("express");
const router = express.Router();

const { getTopBrands, getBrandProducts } = require("../controllers/brand.controller");

router.get("/top/:count", getTopBrands);
router.get("/products/:brandId", getBrandProducts);

module.exports = router;
