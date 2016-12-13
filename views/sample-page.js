/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This is a sample view handler.
*
*   Written by Cody M Leff <cody@leftgoat.com>
*   
*/

//  Requires
const contentRequest = require('../components/wordpress.js').contentRequest;

//  Slug for post to download
const slug = 'sample-page'

module.exports = (req, res) => {

    //  Fetches post and renders page
    contentRequest('sample-page').then(response => {

        res.render('sample-page', response['sample-page'])

    }, error => console.log(error))
    
};