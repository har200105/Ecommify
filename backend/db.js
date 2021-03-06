const mongoose = require("mongoose");
const DB = process.env.DB_URL;
const db = () => {
  mongoose
    .connect(DB)
    .then(() => {
      console.log("Connection Successful");
    })
    .catch((e) => {
      console.log(e);
    });
}

module.exports = db;

