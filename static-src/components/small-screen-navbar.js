/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component enables the small-screen version
*   of the navbar.  It's written in ES6, intended for Webpack
*   bundling.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/

//  Imports the overlay coordinator
import overlayCoordinator from './overlay-coordinator.js'

//  Saves references to relevant DOM nodes
const navbar = document.querySelector('#navbar')
const openButton = navbar.querySelector('.small-screen-open-button')
const closeButton = navbar.querySelector('.small-screen-close-button')
const links = navbar.querySelectorAll('li a')


/*  
*   Function: clickHandler
*   ----------------------
*   Delegates a click to open, close or visit a link depending on
*   the event target.
*/
const clickHandler = (event) => {

    //  Opens the navbar
    if (openButton.contains(event.target)) {

        overlayCoordinator.show(navbar)

    }

    //  Closes the navbar
    else if (closeButton.contains(event.target)) {

        overlayCoordinator.hide(navbar)

    }

    //  Closes the navbar if a link was clicked
    else {

        const index = Array.prototype.indexOf.call(links, event.target)
        if (index !== -1) overlayCoordinator.hide(navbar)

    }

}


/*
*   Exported Function: enable
*   -------------------------
*   Registers the small-screen click handler, making sure the
*   overlay is hidden first.
*/
export function enable() {

    navbar.addEventListener('click', clickHandler)

}


/*
*   Exported Function: disable
*   --------------------------
*   Unregisters the small-screen click ahndler, making sure the
*   overlay is hidden first.
*/
export function disable() {

    overlayCoordinator.hide(navbar)
    navbar.removeEventListener('click', clickHandler)

}
