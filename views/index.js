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
const contentRequest = require('../components/wordpress.js').contentRequest;

//  List of slugs of pages to download.
const slugs = [
    'main-view',
    'main-view/header',
    'main-view/who-we-are',
    'main-view/services',
    'main-view/the-left-goat-difference',
    'main-view/team/pieter-verhaar',
    'main-view/team/holly-mandarich',
    'main-view/team/cody-leff',
    'main-view/looking-for-our-work',
];

module.exports = (req, res) => {

    //  Fetches all slugs via array of Promises.
    const contentRequests = slugs.map(slug => contentRequest(slug));
    Promise.all(contentRequests).then(responses => {

        const content = Object.assign({}, ...responses);
        res.render('index', content);

    }, error => console.log(error));

};