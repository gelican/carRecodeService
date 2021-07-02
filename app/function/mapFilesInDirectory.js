//requiring path and fs modules
const path = require("path");
const fs = require("fs");

module.exports = (relativePath, success, failure) => {
  //joining path of directory
  const directoryPath = path.join(__dirname, `../${relativePath}`);
  //passing directoryPath and callback function
  fs.readdir(directoryPath, function(err, fileNames) {
    //handling error
    if (err) {
      return failure(err);
    }
    //listing all files using forEach
    fileNames.forEach(function(filename) {
      // Do whatever you want to do with the file
      success(filename);
    });
  });
};
