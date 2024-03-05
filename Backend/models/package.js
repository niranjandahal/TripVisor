const mongoose = require("mongoose");

const PackageSchema = new mongoose.Schema(
  {
    // name: {
    //   type: String,
    //   trim: true,
    //   required: [true, "Please provide package name"],
    //   maxlength: [100, "Name can not be more than 100 characters"],
    // },
    // price: {
    //   type: Number,
    //   required: [true, "Please provide package price"],
    //   default: 0,
    // },
    // description: {
    //   type: String,
    //   required: [true, "Please provide package description"],
    //   maxlength: [1000, "Description is more than 1000 charcters"],
    // },
    // image: {
    //   type: String,
    //   default: "",
    // },
    // sponsored: {
    //   type: Boolean,
    //   default: false,
    // },
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
    trek_details: {
      name: String,
      region: String,
      duration: Number,
      difficulty: String,
      highlights: [String],
      price: Number,
      image: String,
      description: String
    },
    itinerary: {
      type: Map,
      of: String
    },
    what_to_pack: {
      clothing: [String],
      gear: [String]
    },
    accommodation: String,
    guide_and_porter: {
      guide: {
        name: String,
        experience: String,
        knowledge: String,
        responsibilities: [String]
      },
      porter: {
        name: String,
        role: String,
        strength: String,
        responsibilities: [String]
      }
    },
    safety_and_health: {
      altitude_sickness: {
        symptoms: [String],
        prevention: String
      },
      medical_facilities: String,
      travel_insurance: String
    },
    additional_information: {
      permits: [String],
      weather: String,
      communication: String
    },
    trek_overview: {
      distance: String,
      days_required: String,
      total_ascent: String,
      total_descent: String,
      highest_point: String,
      difficulty: String,
      permits: String,
      cost_per_day: String,
      guide: String,
      accommodation: String,
      best_time: String,
      tips: String
    }
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
