const mongoose = require("mongoose");

const PackageSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      trim: true,
      required: [true, "Please provide package name"],
      maxlength: [100, "Name can not be more than 100 characters"],
    },
    price: {
      type: Number,
      required: [true, "Please provide package price"],
      default: 0,
    },
    description: {
      type: String,
      required: [true, "Please provide package description"],
      maxlength: [1000, "Description is more than 1000 charcters"],
    },
    image: {
      type: String,
      default: "",
    },
    sponsored: {
      type: Boolean,
      default: false,
    },
    averageRating: {
      type: Number,
      default: 0,
    },
    numOfReviews: {
      type: Number,
      default: 0,
    },
    agency: {
      type: mongoose.Types.ObjectId,
      ref: "Agency",
      required: true,
    },
  },
  { timestamps: true, toJSON: { virtuals: true }, toObject: { virtuals: true } }
);

PackageSchema.virtual("reviews", {
  ref: "Review",
  localField: "_id",
  foreignField: "package",
  justOne: false,
});

PackageSchema.pre("remove", async function (next) {
  await this.model("Review").deleteMany({ package: this._id });
});

module.exports = mongoose.model("Package", PackageSchema);
