const Book = require("../models/Book");
const Package = require("../models/Package");

const { StatusCodes } = require("http-status-codes");
const CustomError = require("../errors");
// const { checkPermissions } = require("../utils");

// const fakeStripeAPI = async ({ amount, currency }) => {
//   const client_secret = "someRandomValue";
//   return { client_secret, amount };
// };

const createBook = async (req, res) => {
  const {packageId} = req.body;
  const dbPackage = await Package.findOne({ _id: packageId });
    if (!dbPackage) {
      throw new CustomError.NotFoundError(
        `No package with id : ${item.package}`
      );
    }
    const { name, price, _id } = dbPackage;

  const book = await Book.create({
    name,
    price,
    package: _id,
    user: req.user.userId,
  });

  res
    .status(StatusCodes.CREATED)
    .json({ book, clientSecret: book.clientSecret });
};
const getAllBooks = async (req, res) => {
  const books = await Book.find({});
  res.status(StatusCodes.OK).json({ books, count: books.length });
};
const getSingleBook = async (req, res) => {
  const { id: bookId } = req.params;
  const book = await Book.findOne({ _id: bookId });
  if (!book) {
    throw new CustomError.NotFoundError(`No book with id : ${bookId}`);
  }
  // checkPermissions(req.user, book.user);
  res.status(StatusCodes.OK).json({ book });
};
const getCurrentUserBooks = async (req, res) => {
  const books = await Book.find({ user: req.user.userId });
  res.status(StatusCodes.OK).json({ books, count: books.length });
};
// const updateBook = async (req, res) => {
//   const { bookId } = req.params;

//   const book = await Book.findOne({ _id: bookId });
//   if (!book) {
//     throw new CustomError.NotFoundError(`No book with id : ${bookId}`);
//   }
//   // checkPermissions(req.user, book.user);

//   book.status = req.body.status;
//   await book.save();

//   res.status(StatusCodes.OK).json({ book });
// };

module.exports = {
  getAllBooks,
  getSingleBook,
  getCurrentUserBooks,
  createBook,
  // updateBook,
};
