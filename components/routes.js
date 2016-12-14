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
const indexHandler = require('../views/index.js');
const formSubmitHandler = require('./form-submit.js');

//  Creates middleware
const publicRouter = express.Router();

//  Routes form submission requests
publicRouter.post('/ajax/submit-form', formSubmitHandler);

//  Routes to index page
publicRouter.get('/', indexHandler);

//  Exports
module.exports = publicRouter;