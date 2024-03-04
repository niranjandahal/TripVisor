const mongoose = require("mongoose");

// const bookSchema = mongoose.Schema({
//   name: { type: String, required: true },
//   // image: { type: String, required: true },
//   // price: { type: Number, required: true },
//   amount: { type: Number, required: true },
//   package: {
//     type: mongoose.Schema.ObjectId,
//     ref: "Package",
//     required: true,
//   },
// });

const bookSchema = mongoose.Schema(
  {
    name: { type: String,
      required: true 
    },
    status: {
      type: String,
      enum: ["pending", "paid", "booked", "canceled"],
      default: "pending",
    },
    user: {
      type: mongoose.Schema.ObjectId,
      ref: "User",
      required: true,
    },
    package: {
      type: mongoose.Schema.ObjectId,
      ref: "Package",
      required: true,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Book", bookSchema);
