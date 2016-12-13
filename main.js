/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This is the main script for the Node.js server.  It receives
*   requests and sends them on to the WordPress handler or
*   elsewhere.
*
*   Written by Cody M Leff <cody@leftgoat.com>
*   
*/

'use strict';

//  Requires
const express = require('express');
const compression = require('compression');
const wordpressAdmin = require('./components/wordpress.js').admin;
const routes = require('./components/routes.js')

//  Set the Promise API to throw errors in all cases
const bluebird = require('bluebird');
bluebird.onPossiblyUnhandledRejection(function(error){
    throw error;
});

//  Set server to receive all HTTP traffic
const SERVER_PORT = process.env.PORT || 80;

//  Create server
const app = express();

//  Enable compression
app.use(compression());

//  Set Pug as the view engine
app.set('view engine', 'pug');

//  Handle WordPress admin requests
app.use(wordpressAdmin);

//  Handle public requests
app.use(routes);

//  Handle anything else
app.all('*', (req, res) => { res.status(404).end(); });

//  Start server
app.listen(SERVER_PORT, function () {

    console.log(`Node server listening on port ${SERVER_PORT}!`);

});
