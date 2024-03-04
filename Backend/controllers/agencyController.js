const Agency = require('../models/Agency');
const { StatusCodes } = require('http-status-codes');
const CustomError = require('../errors');
// const {
//   createTokenAgency,
//   attachCookiesToResponse,
//   checkPermissions,
// } = require('../utils');

const getAllAgency = async (req, res) => {
  // console.log(req.agency);
  const agency = await Agency.find({ role: 'agency' }).select('-password');
  res.status(StatusCodes.OK).json({ agency });
};

const getSingleAgency = async (req, res) => {
  const agency = await Agency.findOne({ _id: req.params.id }).select('-password');
  if (!agency) {
    throw new CustomError.NotFoundError(`No agency with id : ${req.params.id}`);
  }
  // checkPermissions(req.user, agency._id);
  res.status(StatusCodes.OK).json({ agency });
};

const showCurrentAgency = async (req, res) => {
  res.status(StatusCodes.OK).json({ agency: req.user});
};
// update agency with agency.save()
const updateAgency = async (req, res) => {
  const { email, name } = req.body;
  if (!email || !name) {
    throw new CustomError.BadRequestError('Please provide all values');
  }
  const agency = await Agency.findOne({ _id: req.user.userId });

  agency.email = email;
  agency.name = name;

  await agency.save();

  // const tokenAgency = createTokenUser(agency);
  // attachCookiesToResponse({ res, agency: tokenAgency });
  res.status(StatusCodes.OK).json({ agency: tokenAgency });
};
const updateAgencyPassword = async (req, res) => {
  const { oldPassword, newPassword } = req.body;
  if (!oldPassword || !newPassword) {
    throw new CustomError.BadRequestError('Please provide both values');
  }
  const agency = await Agency.findOne({ _id: req.user.userId });

  const isPasswordCorrect = await agency.comparePassword(oldPassword);
  if (!isPasswordCorrect) {
    throw new CustomError.UnauthenticatedError('Invalid Credentials');
  }
  agency.password = newPassword;

  await agency.save();
  res.status(StatusCodes.OK).json({ msg: 'Success! Password Updated.' });
};

module.exports = {
  getAllAgency,
  getSingleAgency,
  showCurrentAgency,
  updateAgency,
  updateAgencyPassword,
};

// update agency with findOneAndUpdate
// const updateAgency = async (req, res) => {
//   const { email, name } = req.body;
//   if (!email || !name) {
//     throw new CustomError.BadRequestError('Please provide all values');
//   }
//   const agency = await Agency.findOneAndUpdate(
//     { _id: req.agency.agencyId },
//     { email, name },
//     { new: true, runValidators: true }
//   );
//   const tokenAgency = createTokenAgency(agency);
//   attachCookiesToResponse({ res, agency: tokenAgency });
//   res.status(StatusCodes.OK).json({ agency: tokenAgency });
// };
