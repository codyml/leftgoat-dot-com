/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This script routes requests to the WordPress REST API or to
*   the admin pages to the nginx/php-fpm WordPress instance.
*
*   Written by Cody M Leff <cody@leftgoat.com>
*   
*/

//  Requires
const express = require('express');
const http = require('http');
const request = require('request-promise-native');
const cache = require('memory-cache');

//  Cache expiration time
const CACHE_EXPIRE = 2 /* days */
    * 24 /* hours */
    * 60 /* minutes */
    * 60 /* seconds */
    * 1000 /* milliseconds */

//  WP access
const WP_PORT = '8000';

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

    //  Accessing the admin panel clears the cache
    cache.clear()

};

//  Forwards WordPress admin requests to nginx
adminRouter.all('/wp-*', handleWP);

//  Performs JSON requests to REST API
function contentRequest(slug) {

    const hit = cache.get(slug)

    if (hit) return Promise.resolve(hit)
    else return new Promise((resolve, reject) => {

        const options = {

            method: 'get',
            url: `http://localhost:${WP_PORT}/${slug}`,

        };

        resolve(request(options).then(response => {

            const decodedResponse = JSON.parse(response)
            cache.put(slug, decodedResponse)
            return decodedResponse

        }))

    })

};

//  Exports
module.exports.admin = adminRouter;
module.exports.contentRequest = contentRequest;
