const express = require("express");
const router = express.Router();

const { getTopBrands } = require("../controllers/brand.controller");

router.get("/top/:count", getTopBrands);

module.exports = router;
