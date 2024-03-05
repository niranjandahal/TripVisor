const express = require("express");
const router = express.Router();
const Package = require('../models/Package');
const homePackage = require('../models/homePackage');
const { getHomePageImages } = require("../controllers/homePageController");

router.route("/images").get(getHomePageImages);

router.route("/").get(async (req, res) => {
    const treks = await Package.find({});
    const homeTreks = await homePackage.find({});
    // const image_url = treks.trek_details.image;
    // console.log(treks[0].trek_details.image);
    console.log(homeTreks)
    res.status(200).json(homeTreks);
});

module.exports = router;