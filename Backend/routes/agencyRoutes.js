const express = require("express");
const router = express.Router();
const {
  register,
  login,
  logout,
  deleteAgency,
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
  .get(getAllAgency);
router.route("/showMe").get(authenticateUser, showCurrentAgency);
router.route("/updateAgency").patch(authenticateUser, updateAgency);
router
  .route("/updateAgencyPassword")
  .patch(authenticateUser, updateAgencyPassword);

router.route("/:id").get(authenticateUser, getSingleAgency);

router.post("/register", authenticateUser,register);
router.post("/login", authenticateUser, login);
router.get("/logout", authenticateUser, logout);
router.get("/delete/:id", authenticateUser, deleteAgency);

module.exports = router;
