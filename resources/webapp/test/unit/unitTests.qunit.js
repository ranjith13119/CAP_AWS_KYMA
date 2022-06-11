/* global QUnit */
QUnit.config.autostart = false;

sap.ui.getCore().attachInit(function () {
	"use strict";

	sap.ui.require([
		"awskyma/fiori_aws_kyma/test/unit/AllTests"
	], function () {
		QUnit.start();
	});
});
