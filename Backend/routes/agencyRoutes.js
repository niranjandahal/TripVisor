const express = require("express");
const router = express.Router();
const {
  register,
  login,
  logout,
} = require("../controllers/agencyAuthController");
const {
  authenticateUser,
  authorizePermissions,
} = require("../middleware/authentication");
const {
  getAllAgency,
  getSingleAgency,
  showCurrentAgency,
  updateAgency,
  updateAgencyPassword,
} = require("../controllers/agencyController");

router
  .route("/")
  .get(authenticateUser, authorizePermissions("admin"), getAllAgency);
router.route("/showMe").get(authenticateUser, showCurrentAgency);
router.route("/updateAgency").patch(authenticateUser, updateAgency);
router
  .route("/updateAgencyPassword")
  .patch(authenticateUser, updateAgencyPassword);

router.route("/:id").get(authenticateUser, getSingleAgency);

router.post("/register", register);
router.post("/login", login);
router.get("/logout", logout);

module.exports = router;
