// const express = require('express');
// const router = express.Router();
// const { authenticateUser } = require('../middleware/authentication');

// const {
//   createReview,
//   getAllReviews,
//   getSingleReview,
//   updateReview,
//   deleteReview,
// } = require('../controllers/reviewController');

// router.route('/').post(authenticateUser, createReview).get(getAllReviews);

// router
//   .route('/:id')
//   .get(getSingleReview)
//   .patch(authenticateUser, updateReview)
//   .delete(authenticateUser, deleteReview);

// module.exports = router;

const express = require('express');
const router = express.Router();

const {
  createReview,
  getAllReviews,
  getSingleReview,
  updateReview,
  deleteReview,
} = require('../controllers/reviewController');

router.route('/').post(createReview).get(getAllReviews);

router
  .route('/:id')
  .get(getSingleReview)
  .patch(updateReview)
  .delete(deleteReview);

module.exports = router;
