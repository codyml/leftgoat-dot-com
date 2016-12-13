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
const wordpress = require('./components/wordpress.js');
const routes = require('./components/routes.js')

//  Set the Promise API to throw errors in all cases
const bluebird = require('bluebird');
bluebird.onPossiblyUnhandledRejection(function(error){
    throw error;
});

//  Set server to receive HTTP traffic from the outside world
const SERVER_PORT = process.env.PORT || 80;

//  Create server
const app = express();

//  Enable compression
app.use(compression());

//  Set Pug as the view engine
app.set('view engine', 'pug');

//  Handle WordPress admin requests
app.use(wordpress.admin);

//  Intercepts requests, for error handling
app.use(wordpress.intercept)

//  Handle public requests
app.use(routes);

//  Handle anything else
app.all('*', (req, res) => { res.status(404).render('404'); });

//  Start server
app.listen(SERVER_PORT, function () {

    console.log(`Node server listening on port ${SERVER_PORT}!`);

});
