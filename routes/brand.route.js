const express = require("express");
const router = express.Router();

const { getTopBrands, getAllBrands, getBrandProducts } = require("../controllers/brand.controller");

router.get("/top/:count", getTopBrands);
router.get("/all", getAllBrands);
router.get("/products/:brandId", getBrandProducts);

module.exports = router;
