"use strict";

const cds = require("@sap/cds");
const helmet = require("helmet");
const proxy = require("@sap/cds-odata-v2-adapter-proxy");
const cdsSwagger = require("cds-swagger-ui-express");
var passport = require('passport');
var xsenv = require('@sap/xsenv');
var JWTStrategy = require('@sap/xssec').JWTStrategy;

var services = xsenv.getServices({ uaa: { tag: 'xsuaa' } }); //Get the XSUAA service
passport.use(new JWTStrategy(services.uaa));

cds.on("bootstrap", (app) =>
    app.use(
        proxy(),
        cdsSwagger({
            //Exposing the service as a Swagger api
            basePath: "/swagger",
            diagram: "true",
        }),
        passport.initialize(),
        passport.authenticate('JWT', { session: false })
    )
);

module.exports = cds.server;
