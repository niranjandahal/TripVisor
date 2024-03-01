const Book = require("../models/Book");
const Package = require("../models/Package");

const { StatusCodes } = require("http-status-codes");
const CustomError = require("../errors");
const { checkPermissions } = require("../utils");

const fakeStripeAPI = async ({ amount, currency }) => {
  const client_secret = "someRandomValue";
  return { client_secret, amount };
};

const createBook = async (req, res) => {
  const { items: cartItems, tax, shippingFee } = req.body;

  if (!cartItems || cartItems.length < 1) {
    throw new CustomError.BadRequestError("No cart items provided");
  }
  if (!tax || !shippingFee) {
    throw new CustomError.BadRequestError(
      "Please provide tax and shipping fee"
    );
  }

  let bookItems = [];
  let subtotal = 0;

  for (const item of cartItems) {
    const dbPackage = await Package.findOne({ _id: item.package });
    if (!dbPackage) {
      throw new CustomError.NotFoundError(
        `No package with id : ${item.package}`
      );
    }
    const { name, price, image, _id } = dbPackage;
    const singleBookItem = {
      amount: item.amount,
      name,
      price,
      image,
      package: _id,
    };
    // add item to book
    bookItems = [...bookItems, singleBookItem];
    // calculate subtotal
    subtotal += item.amount * price;
  }
  // calculate total
  const total = tax + shippingFee + subtotal;
  // get client secret
  const paymentIntent = await fakeStripeAPI({
    amount: total,
    currency: "usd",
  });

  const book = await Book.create({
    bookItems,
    total,
    subtotal,
    tax,
    shippingFee,
    clientSecret: paymentIntent.client_secret,
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
  checkPermissions(req.user, book.user);
  res.status(StatusCodes.OK).json({ book });
};
const getCurrentUserBooks = async (req, res) => {
  const books = await Book.find({ user: req.user.userId });
  res.status(StatusCodes.OK).json({ books, count: books.length });
};
const updateBook = async (req, res) => {
  const { id: bookId } = req.params;
  const { paymentIntentId } = req.body;

  const book = await Book.findOne({ _id: bookId });
  if (!book) {
    throw new CustomError.NotFoundError(`No book with id : ${bookId}`);
  }
  checkPermissions(req.user, book.user);

  book.paymentIntentId = paymentIntentId;
  book.status = "paid";
  await book.save();

  res.status(StatusCodes.OK).json({ book });
};

module.exports = {
  getAllBooks,
  getSingleBook,
  getCurrentUserBooks,
  createBook,
  updateBook,
};
