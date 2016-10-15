/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This script routes requests to the WordPress REST API or to
*   the admin pages to the nginx/php-fpm WordPress instance.
*
*   Written by Cody M Leff <cody@leftgoat.com>
*   
*/

'use strict';

//  Requires
const express = require('express');
const http = require('http');
const request = require('request-promise-native');

//  WP access
const WP_PORT = '8000';
const WP_API_PATH = '/';

//  Creates middleware
const adminRouter = express.Router();

//  WP admin request handler
function handleWP(req, res) {

    const wpRequest = http.request({

        method: req.method,
        port: WP_PORT,
        path: req.url,
        headers: req.headers,

    });

    wpRequest.on('response', (wpResponse) => {

        res.status(wpResponse.statusCode);
        res.set(wpResponse.headers);
        wpResponse.pipe(res);

    });

    req.pipe(wpRequest);

};

//  Forwards WordPress admin requests to nginx
adminRouter.all('/wp-admin*', handleWP);
adminRouter.all('/wp-content*', handleWP);
adminRouter.all('/wp-includes*', handleWP);
adminRouter.all('/wp-activate.php', handleWP);
adminRouter.all('/wp-blog-header.php', handleWP);
adminRouter.all('/wp-comments-post.php', handleWP);
adminRouter.all('/wp-config-sample.php', handleWP);
adminRouter.all('/wp-cron.php', handleWP);
adminRouter.all('/wp-links-opml.php', handleWP);
adminRouter.all('/wp-load.php', handleWP);
adminRouter.all('/wp-login.php', handleWP);
adminRouter.all('/wp-mail.php', handleWP);
adminRouter.all('/wp-settings.php', handleWP);
adminRouter.all('/wp-signup.php', handleWP);
adminRouter.all('/wp-trackback.php', handleWP);

//  Performs JSON requests to REST API
function contentRequest(slugName) {

    const options = {

        method: 'get',
        url: `http://localhost:${WP_PORT}${WP_API_PATH}${slugName}`,

    };

    return request(options);

};

//  Exports
module.exports.admin = adminRouter;
module.exports.contentRequest = contentRequest;