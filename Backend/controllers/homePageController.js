//import package model
const Package = require('../models/Package');
//import http status codes
const { StatusCodes } = require('http-status-codes');
//import custom error
const CustomError = require('../errors');

// send json response for home page by selecting all images from all packages
const getHomePageImages = async (req, res) => {
    const treks = await Package.find({}, '_id trek_details.image');
    // const image_url = treks.trek_details.image;
    // console.log(treks[0].trek_details.image);
    res.status(200).json({ image_url: treks[0].trek_details.image, id: treks[0]._id});
};

module.exports = {
    getHomePageImages,
};