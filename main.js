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
const wordpressAdmin = require('./server-components/wordpress-router.js').admin;
const publicRouter = require('./server-components/public-router.js');

//  Set server to receive all HTTP traffic
const SERVER_PORT = process.env.PORT || 80;

//  Create server
const app = express();

//  Enforce HTTPS if on production server
app.set('trust proxy', true);
if (process.env.NODE_ENV === 'production') app.use((req, res, next) => {

    if (req.protocol === 'http') {

        res.redirect(`https://${req.hostname}${req.url}`);

    } else next();

});

//	Set Pug as the view engine
app.set('view engine', 'pug');

//  Handle WordPress admin requests
app.use(wordpressAdmin);

//	Handle public requests
app.use(publicRouter);

//	Handle anything else
app.all('*', (req, res) => { res.status(404).end(); });

//  Start server
app.listen(SERVER_PORT, function () {

    console.log(`Node server listening on port ${SERVER_PORT}!`);

});
