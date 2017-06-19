/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component enables scrolling to anchor links,
*   using Velocity.js.  It's written in ES6, intended for Webpack
*   bundling.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/

//  Imports Velocity.js
import Velocity from 'velocity-animate'

//  Constants
const DURATION = 1000
const EASING = 'ease-in-out'
const LARGE_SCREEN_OFFSET = -110

//  Creates an array of all anchor links
const anchorLinks = [...document.querySelectorAll('a[href^="#"]')]

//  Saves whether the display is a small screen or not
let smallScreen = false

/*
*   Exported Function: enable
*   -------------------------
*   This function enables smooth scrolling by intercepting clicks
*   to anchor links, animating the scroll to their position.
*/
export function enable() {

    anchorLinks.forEach(anchorLink => {

        const anchor = anchorLink.href.match(/#.+$/)[0]
        anchorLink.addEventListener('click', event => {

            //  Prevents the normal, instantaneous scrolling
            event.preventDefault()

            /*  Calculates whether the desired scroll position is below
            *   the bottom of the document.  */
            const target = document.querySelector(anchor)
            const bodyHeight = document.body.offsetHeight
            const maxScrollPosition = bodyHeight - window.innerHeight
            
            /*  Scrolls smoothly to either the top of the target element
            *   or the bottom of the document.  */
            if (target.offsetTop + (smallScreen ? 0 : LARGE_SCREEN_OFFSET) < maxScrollPosition) {

                Velocity(target, 'scroll', {

                    offset: smallScreen ? 0 : LARGE_SCREEN_OFFSET,
                    duration: DURATION,
                    easing: EASING,

                })

            } else Velocity(document.body, 'scroll', {

                offset: maxScrollPosition,
                duration: DURATION,
                easing: EASING,

            })

        })

    });

}


/*
*   Exported Function: setSmallScreen
*   ---------------------------------
*   This function modifies the scrolling behavior to better fit
*   a small-screen view.
*/
export function setSmallScreen(smallScreenStatus) {

    smallScreen = smallScreenStatus

}
