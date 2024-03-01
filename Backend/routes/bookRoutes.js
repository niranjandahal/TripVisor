const express = require("express");
const router = express.Router();
const {
  authenticateUser,
  authorizePermissions,
} = require("../middleware/authentication");

const {
  getAllBooks,
  getSingleBook,
  getCurrentUserBooks,
  createBook,
  updateBook,
} = require("../controllers/bookController");

router
  .route("/")
  .post(authenticateUser, createBook)
  .get(authenticateUser, authorizePermissions("admin"), getAllBooks);

router.route("/showAllMyBooks").get(authenticateUser, getCurrentUserBooks);

router
  .route("/:id")
  .get(authenticateUser, getSingleBook)
  .patch(authenticateUser, updateBook);

module.exports = router;
