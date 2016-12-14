/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This script submits an AJAX-posted contact form.
*
*   Written by Cody M Leff <cody@leftgoat.com>
*   
*/

'use strict';

//  Requires
const express = require('express');
const bodyParser = require('body-parser');
const helper = require('sendgrid').mail;

//  Creates the middleware for submitting the form
const formSubmitHandler = express.Router();

//  Parses the form, then submits it to Sendgrid
formSubmitHandler.use(bodyParser.json());
formSubmitHandler.use((req, res) => {

    let textContent = '';
    for (let field in req.body) {
        textContent += field + ': ' + req.body[field] + '<br>';
    }

    const from_email = new helper.Email('visitor@leftgoat.com');
    const to_email = new helper.Email('hello@leftgoat.com');
    const subject = 'A leftgoat.com visitor left a message!';
    const content = new helper.Content('text/html', textContent);
    const mail = new helper.Mail(from_email, subject, to_email, content);

    const sg = require('sendgrid')(process.env.SENDGRID_API_KEY);
    const request = sg.emptyRequest({

      method: 'POST',
      path: '/v3/mail/send',
      body: mail.toJSON(),

    });

    sg.API(request, function(error, response) {

        //  Returns the response from Sendgrid
        res.send(response);

    });

});

//  Exports
module.exports = formSubmitHandler;