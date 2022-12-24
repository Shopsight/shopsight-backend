const express = require("express");
const router = express.Router();

const { getAllCategories, getSubCategoryProducts } = require("../controllers/category.controller");

router.get("/", getAllCategories);
router.get("/:subCategoryId", getSubCategoryProducts);

module.exports = router;
