const mongoose = require('mongoose');
const { Schema } = mongoose;

const homePackageSchema = new Schema({
    //refrence package in homePackage
    agency: { type: mongoose.Types.ObjectId, ref: 'Agency', required: true },
    package: { type: mongoose.Types.ObjectId, ref: 'Package', required: true },
  name: { type: String, required: true },
  region: { type: String, required: true },
  duration: { type: Number, required: true },
  difficulty: { type: String, required: true },
  highlights: [{ type: String, required: true }],
  price: { type: Number, required: true },
  image: { type: String, required: true },
  description: { type: String, required: true },
},
  { timestamps: true, toJSON: { virtuals: true }, toObject: { virtuals: true } }
);

const homePackage = mongoose.model('homePackage', homePackageSchema);

module.exports = homePackage;
