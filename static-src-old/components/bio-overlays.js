/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component enables the Team section's bio overlays.
*   It's written in ES6, intended for Webpack bundling.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/

//  Imports the overlay coordinator
import overlayCoordinator from './overlay-coordinator.js'

//  Creates Array of relevant DOM nodes
const bios = [...document.querySelectorAll('#team ul li')]


/*
*   Function: clickHandler
*   ----------------------
*   This function delegates clicks received the bio section.
*/
function clickHandler(event) {

    //  Saves relevant DOM nodes
    const bio = event.currentTarget
    const openButton = bio.querySelector('.read-bio')
    const closeButton = bio.querySelector('.bio-close-button')
    const overlay = bio.querySelector('.overlay')

    //  Opens the overlay
    if (event.target === openButton || openButton.contains(event.target)) {

        overlayCoordinator.show(overlay)

    }

    //  Closes the overlay
    else if (event.target === closeButton || closeButton.contains(event.target)) {

        overlayCoordinator.hide(overlay)

    }

}


/*
*   Exported Function: enable
*   -------------------------
*   This function attaches the bio click handler, with a fix for
*   touch event issues.
*/
export default function enable() {

    //  Adds click handlers
    bios.forEach(bio => bio.addEventListener('click', clickHandler))

}

