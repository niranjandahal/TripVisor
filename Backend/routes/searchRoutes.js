const express = require("express");
const router = express.Router();
const Package = require("../models/Package");

// Route for searching the best matches in the entire table schema
router.get("/search", async (req, res) => {
  try {
    const { searchString } = req.body;
    if (!searchString) {
      return res.status(400).json({ msg: "Please provide a search string" });
    }
    const regexPattern = new RegExp(searchString, "i");

    const packages = await Package.find({
      $or: [
        { name: { $regex: regexPattern } },
        { description: { $regex: regexPattern } },
        { agency: { $regex: regexPattern } },
      ]
    });

    res.json({ success: true, data: packages });
  } catch (err) {
    console.error(err);
    res.status(500).json({ success: false, error: "Server Error" });
  }
});

module.exports = router;
