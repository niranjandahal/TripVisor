const User = require("../models/User");
const { StatusCodes } = require("http-status-codes");
const CustomError = require("../errors");
const { createTokenUser } = require("../utils");
const Agency = require("../models/Agency");
const Package = require("../models/Package");

const register = async (req, res) => {
  const { email, name, password, address } = req.body;

  const emailAlreadyExists = await Agency.findOne({ email });
  if (emailAlreadyExists) {
    throw new CustomError.BadRequestError("Email already exists");
  }

  const user = await Agency.create({ name, email, password, address});
  const tokenUser = createTokenUser(user);
  // attachCookiesToResponse({ res, user: tokenUser });
  res.status(StatusCodes.CREATED).json({ user: tokenUser });
};

const deleteAgency = async (req, res) => {
  const { id: userId } = req.params;
  const use = await Package.findManyAndDelete({ agency: userId });
  const user = await Agency.findOneAndDelete({ _id: userId });
}

const login = async (req, res) => {
  const { email, password } = req.body;

  if (!email || !password) {
    throw new CustomError.BadRequestError("Please provide email and password");
  }
  const user = await Agency.findOne({ email });

  if (!user) {
    throw new CustomError.UnauthenticatedError("Invalid Credentials");
  }
  const isPasswordCorrect = await user.comparePassword(password);
  if (!isPasswordCorrect) {
    throw new CustomError.UnauthenticatedError("Invalid Credentials");
  }
  const tokenUser = createTokenUser(user);
  // attachCookiesToResponse({ res, user: tokenUser });

  res.status(StatusCodes.OK).json({ user: tokenUser });
};

const logout = async (req, res) => {
  //res.cookie("token", "logout", {
    //httpOnly: true,
    //expires: new Date(Date.now() + 1000),
  //});
  res.status(StatusCodes.OK).json({ msg: "user logged out!" });
};

module.exports = {
  register,
  login,
  logout,
  deleteAgency,
};
