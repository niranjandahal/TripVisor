const Package = require('../models/Package');
const { StatusCodes } = require('http-status-codes');
const CustomError = require('../errors');
const path = require('path');

const createPackage = async (req, res) => {
  req.body.user = req.user.userId;
  const Package = await Package.create(req.body);
  res.status(StatusCodes.CREATED).json({ Package });
};
const getAllPackages = async (req, res) => {
  const Packages = await Package.find({});

  res.status(StatusCodes.OK).json({ Packages, count: Packages.length });
};
const getSinglePackage = async (req, res) => {
  const { id: PackageId } = req.params;

  const Package = await Package.findOne({ _id: PackageId }).populate('reviews');

  if (!Package) {
    throw new CustomError.NotFoundError(`No Package with id : ${PackageId}`);
  }

  res.status(StatusCodes.OK).json({ Package });
};
const updatePackage = async (req, res) => {
  const { id: PackageId } = req.params;

  const Package = await Package.findOneAndUpdate({ _id: PackageId }, req.body, {
    new: true,
    runValidators: true,
  });

  if (!Package) {
    throw new CustomError.NotFoundError(`No Package with id : ${PackageId}`);
  }

  res.status(StatusCodes.OK).json({ Package });
};
const deletePackage = async (req, res) => {
  const { id: PackageId } = req.params;

  const Package = await Package.findOne({ _id: PackageId });

  if (!Package) {
    throw new CustomError.NotFoundError(`No Package with id : ${PackageId}`);
  }

  await Package.remove();
  res.status(StatusCodes.OK).json({ msg: 'Success! Package removed.' });
};
const uploadImage = async (req, res) => {
  if (!req.files) {
    throw new CustomError.BadRequestError('No File Uploaded');
  }
  const PackageImage = req.files.image;

  if (!PackageImage.mimetype.startsWith('image')) {
    throw new CustomError.BadRequestError('Please Upload Image');
  }

  const maxSize = 1024 * 1024;

  if (PackageImage.size > maxSize) {
    throw new CustomError.BadRequestError(
      'Please upload image smaller than 1MB'
    );
  }

  const imagePath = path.join(
    __dirname,
    '../public/uploads/' + `${PackageImage.name}`
  );
  await PackageImage.mv(imagePath);
  res.status(StatusCodes.OK).json({ image: `/uploads/${PackageImage.name}` });
};

module.exports = {
  createPackage,
  getAllPackages,
  getSinglePackage,
  updatePackage,
  deletePackage,
  uploadImage,
};
