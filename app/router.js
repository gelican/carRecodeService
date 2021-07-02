"use strict";

/**
 * @param {Egg.Application} app - egg application
 */
const passport = require("passport");
const mapFilesInDirectory = require("./function/mapFilesInDirectory")
module.exports = app => {
	const { router } = app;

	/* const jwt = passport.authenticate("jwt", { session: false });
	const middlewares = {
		jwt,
	}; */

	mapFilesInDirectory(
		"route",
		fileName => {
			let prepareRoutes = require(`./route/${fileName}`);
			prepareRoutes(router);
		},
		err => {
			app.logger.error(err);
		}
	);
};
