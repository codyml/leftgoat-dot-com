/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component allows the large-screen navbar to
*   float at the top of the screen when the scroll position would
*   normally have it out of sight.  It's written in ES6, intended
*   for Webpack bundling.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/

//  Creates a throttling helper.
import Throttler from './throttler.js'
const INTERVAL = 100
const throttler = new Throttler(INTERVAL)

//  Y-offset from viewport top for the floating navbar
const FLOATING_OFFSET = 30

//  Offset from bottom of viewport to top of non-floating navbar at top scroll
const NON_FLOATING_OFFSET = 110

//  Saves references to relevant DOM nodes
const floatingNavbar = document.querySelector('#navbar')

//  Variables for the current state of the floating navbar.
let floating = false



/*  
*   Function: scrollHandler
*   ----------------------
*   Listens to the scroll position and positions the navbar accordingly.
*   It uses a timer to throttle event callback execution.
*/
const scrollHandler = function() {

    throttler.execute(() => {

        const floatingThreshold = window.innerHeight - (NON_FLOATING_OFFSET + FLOATING_OFFSET)

        if (floating) {

            if (window.pageYOffset <= floatingThreshold) {

                floatingNavbar.classList.remove('floating')
                floating = false

            }

        } else {

            if (window.pageYOffset > floatingThreshold) {

                floatingNavbar.classList.add('floating')
                floating = true

            }

        }

    })

}


/*
*   Exported Function: enable
*   -------------------------
*   Registers the scroll handler.
*/
export function enable() {

    window.addEventListener('scroll', scrollHandler)
    scrollHandler()

}


/*
*   Exported Function: disable
*   --------------------------
*   Unregisters the scroll handler.
*/
export function disable() {

    window.removeEventListener('scroll', scrollHandler)
    floatingNavbar.classList.remove('floating')
    floating = false

}
