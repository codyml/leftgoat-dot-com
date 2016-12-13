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
const sampleHandler = require('../views/sample-page.js');

//  Creates middleware
const publicRouter = express.Router();

//  Renders sample page
publicRouter.get('/sample', sampleHandler);

//  Routes to sample page
publicRouter.get('/', (req, res) => res.redirect('/sample'));

//  Exports
module.exports = publicRouter;