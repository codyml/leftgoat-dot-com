/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component shows and hides the small-screen
*   version of the First Look's goat noun element, using the overlay
*   coordinator to manage the overlay.  It's written in ES6, intended
*   for Webpack bundling.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/

//  Imports the overlay coordinator
import overlayCoordinator from './overlay-coordinator.js'

//  Saves references to relevant DOM nodes
const goatNoun = document.querySelector('#first-look .goat-noun')
const button = document.querySelector('#first-look .goat-noun .continue-button')

/*  Defines variable indicating whether overlay has been permanently
*   hidden, because it wasn't visible at the beginning, was hidden
*   when the screen width changed or was dismissed by a click to the
*   'Continue' button  */
let hidden = true


/*
*   Exported Function: show
*   -----------------------
*   Called only once at page load if the screen width is below
*   the small-screen threshold, this function displays the overlay
*   and adds a listener to its 'Continue' button.
*/
export function show() {
    
    //  Displays overlay
    overlayCoordinator.show(goatNoun)
    hidden = false

    //  Dismisses overlay on button click
    button.addEventListener('click', function() {

        overlayCoordinator.hide(goatNoun)
        hidden = true

    })

}


/*
*   Exported Function: hide
*   -----------------------
*   If the overlay hasn't already been hidden, this function permanently
*   hides it.
*/
export function hide() {

    if (!hidden) {

        overlayCoordinator.hide(goatNoun)
        hidden = true

    }

}
