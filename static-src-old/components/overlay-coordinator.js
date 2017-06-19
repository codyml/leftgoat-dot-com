/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component coordinates the various overlays
*   on the site, so they can be shown and hidden easily.  The actual
*   transitions are CSS-based and configured in './styles/overlays.scss'.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/

//  Constants
const VISIBLE_CLASSNAME = 'overlay-visible'


/*
*   Function: fixMobileScrolling
*   ----------------------------
*   This function intercepts touch events when an overlay is open,
*   modifying their behavior to prevent weird scrolling bugs.
*/
function fixMobileScrolling(event) {

    const openOverlay = document.querySelector('.overlay.overlay-visible')
    if (event.target === openOverlay || openOverlay.contains(event.target)) {

        const height = openOverlay.scrollHeight;
        const visibleHeight = openOverlay.getBoundingClientRect().height;
        if (height > visibleHeight) return

    }

    event.preventDefault()

}


/*
*   Class: OverlayCoordinator
*   -------------------------
*   This class manages the overlays, providing a simple show/hide
*   interface.
*/
class OverlayCoordinator {


    /*
    *   Constructor: OverlayCoordinator
    *   -------------------------------
    *   This function initializes the coordinator with the DOM nodes
    *   declared to be overlays, creating a store for their states.
    */
    constructor() {

        //  Collects the DOM nodes marked with the 'overlay' class
        this.overlayNodes = [...document.querySelectorAll('.overlay')]

        //  Saves the currently-visible overlay
        this.visibleOverlay = null

    }


    /*
    *   Function: show
    *   --------------
    *   This function hides the visible overlay, if there is one,
    *   then shows the passed overlay, if it's present in this.overlays.
    */
    show(node) {

        if (this.visibleOverlay) this.hide(this.visibleOverlay)
        if (this.overlayNodes.indexOf(node) !== -1) {
            
            node.classList.add(VISIBLE_CLASSNAME)
            this.visibleOverlay = node

            /*  Adds the .overlay-visible class and the transition-specific
            *   to the <body> element.  */
            document.body.classList.add(VISIBLE_CLASSNAME)
            document.body.classList.add(node.className.match(/overlay-transition-[a-z]+/)[0])

            //  Adds the mobile scroll interceptor
            window.addEventListener('touchmove', fixMobileScrolling)

        }

    }


    /*
    *   Function: hide
    *   --------------
    *   This function hides the passed overlay.
    */
    hide(node) {

        if (this.visibleOverlay === node) {

            node.classList.remove(VISIBLE_CLASSNAME)
            this.visibleOverlay = null

            /*  Adds the .overlay-visible class and the transition-specific
            *   to the <body> element.  */
            document.body.classList.remove(VISIBLE_CLASSNAME)
            document.body.classList.remove(node.className.match(/overlay-transition-[a-z]+/)[0])

            //  Removes the mobile scroll interceptor
            window.removeEventListener('touchmove', fixMobileScrolling)

        }

    }

}

//  Exports the coordinator
const coordinator = new OverlayCoordinator()
export default coordinator
