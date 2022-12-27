const express = require("express");
const router = express.Router();

const { getAllBrands, getBrandProducts } = require("../controllers/brand.controller");

router.get("/all", getAllBrands);
router.get("/products/:brandId", getBrandProducts);

module.exports = router;
