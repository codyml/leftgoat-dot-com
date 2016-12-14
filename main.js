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
const fs = require('fs');
const http = require('http');
const https = require('https');
const express = require('express');
const enforce = require('express-sslify');
const compression = require('compression');
const wordpress = require('./components/wordpress.js');
const routes = require('./components/routes.js')

//  Set the Promise API to throw errors in all cases
const bluebird = require('bluebird');
bluebird.onPossiblyUnhandledRejection(function(error){
    throw error;
});

//  Create server
const app = express();

//  Enforce SSL
app.use(enforce.HTTPS({ trustProtoHeader: true }));

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

//  Accept all HTTP traffic from Heroku load balancers (includes HTTPS)
if (app.get('env') === 'production') {

    app.listen(process.env.PORT, () => console.log(`Development Node server listening on port ${process.env.PORT}.`))

}

//  Accept all HTTP and HTTPS traffic on dev environments
else {

    http.createServer(app).listen(80, () => console.log('Dev Node server listening on port 80.'))
    https.createServer({

        cert: fs.readFileSync('dev-ssl.cert'),
        key: fs.readFileSync('dev-ssl.key'),

    }, app).listen(443, () => console.log('Dev Node server listening on port 443.'))

}
