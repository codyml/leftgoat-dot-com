/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component enables lazy-loading of page sections.  
*   It's written in ES6, intended for Webpack bundling.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/

//  Creates a throttling helper.
import Throttler from './throttler.js'
const INTERVAL = 500
const throttler = new Throttler(INTERVAL)

/*  The lazy-loading will occur once the user has scrolled this
*   much into an element.  */
const TRIGGER_OFFSET = 100


/*
*   Function: scrollHandler
*   -----------------------
*   Triggered when the user scrolls, this function checks if the
*   new scroll position warrants lazy-loading a certain page section.
*   It throttles the check to once every TIMER_INTERVAL.
*/
function scrollHandler() {

    throttler.execute(() => {

        //  Creates Array of elements not already lazily loaded
        const nodesToLoad = [...document.querySelectorAll('.lazily-load:not(.loaded)')]

        if (nodesToLoad.length > 0) nodesToLoad.forEach(node => {

            const top = node.getBoundingClientRect().top
            if (top < window.innerHeight - TRIGGER_OFFSET) node.classList.add('loaded')

        })

        else window.removeEventListener('scroll', scrollHandler)

    })

}


/*
*   Exported Function: enable
*   -------------------------
*   This function attaches the scroll handler to the Window object.
*/
export default function enable() {

    scrollHandler()
    window.addEventListener('scroll', scrollHandler)

}
