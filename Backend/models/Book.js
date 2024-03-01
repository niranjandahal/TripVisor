const mongoose = require("mongoose");

const SingleBookItemSchema = mongoose.Schema({
  name: { type: String, required: true },
  image: { type: String, required: true },
  price: { type: Number, required: true },
  amount: { type: Number, required: true },
  package: {
    type: mongoose.Schema.ObjectId,
    ref: "Package",
    required: true,
  },
});

const BookSchema = mongoose.Schema(
  {
    total: {
      type: Number,
      required: true,
    },
    bookItems: [SingleBookItemSchema],
    status: {
      type: String,
      enum: ["pending", "failed", "paid", "booked", "canceled"],
      default: "pending",
    },
    user: {
      type: mongoose.Schema.ObjectId,
      ref: "User",
      required: true,
    },
    clientSecret: {
      type: String,
      required: true,
    },
    paymentIntentId: {
      type: String,
    },
  },
  { timestamps: true }
);

module.exports = mongoose.model("Book", BookSchema);
