const Package = require('../models/Package');
const homePackage = require('../models/homePackage');
const { StatusCodes } = require('http-status-codes');
const CustomError = require('../errors');
const path = require('path');

const createPackage = async (req, res) => {
  req.body.user = req.user.userId;
  const packageInstance = await Package.create(req.body);
  // const homePackageInstance = await homePackage.create({
  //   agency: packageInstance.agency,
  //   name: packageInstance.name,
  //   region: packageInstance.region,
  //   duration: packageInstance.duration,
  //   difficulty: packageInstance.difficulty,
  //   highlights: packageInstance.highlights,
  //   price: packageInstance.price,
  //   image: packageInstance.image,
  //   description: packageInstance.description,
  //   package: packageInstance._id,
  const { name, region, duration, difficulty, highlights, price, image, description } = packageInstance.trek_details;

  const homePackageInstance = await homePackage.create({
    agency: packageInstance.agency,
    name,
    region,
    duration,
    difficulty,
    highlights,
    price,
    image,
    description,
    package: packageInstance._id,
  });
  res.status(StatusCodes.CREATED).json({ packageInstance });
};
const getAllPackages = async (req, res) => {
  const Packages = await Package.findAll({ _id: PackageId }).populate('reviews').select('_id trek_details.name trek_details.duration trek_details.region trek_details.highlights trek_details.difficulty trek_details.price trek_details.image trek_details.description');

  res.status(StatusCodes.OK).json({ Packages, count: Packages.length });
};
const getSinglePackage = async (req, res) => {
  const { id: PackageId } = req.params;

  const packageInstance = await Package.findOne({ _id: PackageId }).populate('reviews');

  if (!Package) {
    throw new CustomError.NotFoundError(`No Package with id : ${PackageId}`);
  }

  res.status(StatusCodes.OK).json({ packageInstance });
};
const updatePackage = async (req, res) => {
  const { id: PackageId } = req.params;

  const packageInstance = await Package.findOneAndUpdate({ _id: PackageId }, req.body, {
    new: true,
    runValidators: true,
  });

  if (!Package) {
    throw new CustomError.NotFoundError(`No Package with id : ${PackageId}`);
  }

  res.status(StatusCodes.OK).json({ packageInstance });
};
const deletePackage = async (req, res) => {
  const { id: PackageId } = req.params;

  const packageInstance = await Package.findOne({ _id: PackageId });

  if (!Package) {
    throw new CustomError.NotFoundError(`No Package with id : ${PackageId}`);
  }

  await Package.remove();
  res.status(StatusCodes.OK).json({ msg: 'Success! Package removed.' });
};
// const uploadImage = async (req, res) => {
//   if (!req.files) {
//     throw new CustomError.BadRequestError('No File Uploaded');
//   }
//   const PackageImage = req.files.image;

//   if (!PackageImage.mimetype.startsWith('image')) {
//     throw new CustomError.BadRequestError('Please Upload Image');
//   }

//   const maxSize = 1024 * 1024;

//   if (PackageImage.size > maxSize) {
//     throw new CustomError.BadRequestError(
//       'Please upload image smaller than 1MB'
//     );
//   }

//   const imagePath = path.join(
//     __dirname,
//     '../public/uploads/' + `${PackageImage.name}`
//   );
//   await PackageImage.mv(imagePath);
//   res.status(StatusCodes.OK).json({ image: `/uploads/${PackageImage.name}` });
// };

module.exports = {
  createPackage,
  getAllPackages,
  getSinglePackage,
  updatePackage,
  deletePackage,
  // uploadImage,
};
