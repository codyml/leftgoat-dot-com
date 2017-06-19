/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component enables the contact form.  It's written
*   in ES6, intended for Webpack bundling.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/

//  Imports the overlay coordinator
import overlayCoordinator from './overlay-coordinator.js'

//  Constants
const SUBMIT_DELAY = 1000

//  Saves references to relevant DOM nodes
const contactForm = document.querySelector('#contact-form')
const openButtons = [ document.querySelector('#navbar .contact a'), document.querySelector('#our-work .contact') ]
const fields = [...contactForm.querySelectorAll('input, textarea')]
const closeButton = contactForm.querySelector('.close')
const submitButton = contactForm.querySelector('.submit')


/*
*   Function: openForm
*   ------------------
*   This function opens the contact form, clearing any
*   previously-set fields.
*/
function openForm() {

    //  Clears previously-set fields
    fields.forEach(function(field) {

        if (field.type === 'text' || field.type === 'textarea') field.value = ''
        else field.checked = false

    });

    //  Resets Submit button text
    submitButton.classList.remove('submitting')
    submitButton.classList.remove('submitted')

    //  Shows the overlay
    overlayCoordinator.show(contactForm)

}


/*
*   Function: handleSubmit
*   -------------------
*   This function collects the responses to the contact form, then
*   sends the results to the server.
*/
function handleSubmit() {

    //  Sets the Submit button text
    submitButton.classList.remove('submitted')
    submitButton.classList.add('submitting')

    //  Collects responses
    const responses = {};
    fields.forEach(field => {

        if (field.value && (field.type !== 'radio' || field.checked === true)) {
            responses[field.dataset.fieldName] = field.value;
        }
        
    });

    uploadSubmission(responses).then(response => {
        
        submitButton.classList.remove('submitting')
        submitButton.classList.add('submitted')

        setTimeout(function() {

            overlayCoordinator.hide(contactForm)
            submitButton.classList.remove('submitting')
            submitButton.classList.remove('submitted')

        }, SUBMIT_DELAY)

    })

}


/*
*   Function: uploadSubmission
*   --------------------------
*   This function returns a Promise for sending a POST request to
*   the server with the form submissions.
*/
function uploadSubmission(responses) {

    return new Promise((resolve, reject) => {

        //  Creates request
        const request = new XMLHttpRequest()
        request.open('POST', '/ajax/submit-form', true)

        //  Sets response behavior
        request.onreadystatechange = () => {

            if (request.readyState === XMLHttpRequest.DONE) {

                if (request.status === 200) console.log('Form submitted successfully!')
                else console.log('Form submission unsuccessful!', request)
                
                resolve()

            }

        }

        request.setRequestHeader('Content-Type', 'application/json');
        request.send(JSON.stringify(responses));

    })

}


/*
*   ExportedFunction: enable
*   -----------------------
*   This function adds listeners to open, close and submit the contact
*   form.
*/
export default function enable() {

    openButtons.forEach(el => el.addEventListener('click', openForm))
    closeButton.addEventListener('click', () => { overlayCoordinator.hide(contactForm) });
    submitButton.addEventListener('click', handleSubmit);

};
