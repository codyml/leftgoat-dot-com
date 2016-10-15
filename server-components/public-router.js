/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This script routes requests to publicly-accessible pages to
*   their respective handlers.  
*
*   Written by Cody M Leff <cody@leftgoat.com>
*   
*/

'use strict';

//  Requires
const express = require('express');
const contentRequest = require('./wordpress-router.js').contentRequest;

//  Creates middleware
const publicRouter = express.Router();

//  Routes to index page
publicRouter.get('/', function(req, res) {

    contentRequest('sample-page').then((response) => {
        
        const page = JSON.parse(response);

        console.log('response: ', page);

        res.render('index', { title: page.title });

    });

});

//  Exports
module.exports = publicRouter;