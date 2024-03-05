const express = require('express');
const router = express.Router();
const {
  authenticateUser,
  authorizePermissions,
} = require('../middleware/authentication');

const { getSinglePackageReviews } = require('../controllers/reviewController');
const {
  createPackage,
  getAllPackages,
  getSinglePackage,
  updatePackage,
  deletePackage,
  // uploadImage,
} = require('../controllers/packageController');

// const { getSinglePackageReviews } = require('../controllers/reviewController');

router
  .route('/')
  .post(authenticateUser, createPackage)
  .get(getAllPackages);

// router
//   .route('/uploadImage')
//   .post([authenticateUser, authorizePermissions('admin')], uploadImage);

router
  .route('/:id')
  .get(getSinglePackage)
  .patch(updatePackage)
  .delete(authenticateUser,deletePackage);

router.route('/:id/reviews').get(getSinglePackageReviews);

module.exports = router;
