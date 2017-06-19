/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This script Webpack-bundles client-side functionality scripts,
*   styles and other assets for front-end interaction and appearance.
*   It's written in ES6 and intended to be consumed by Webpack.
*
*   Written by Cody M Leff <cody@leftgoat.com>
*
*/

//  Favicons
import '!file?name=icon32.png!./images/icon32.png'
import '!file?name=icon512.png!./images/icon512.png'

//  Styles
import './styles/main.scss'

//  Components
// import * as smallScreenGoatNoun from './components/small-screen-goat-noun.js'
// import * as smallScreenNavbar from './components/small-screen-navbar.js'
// import * as floatingNavbar from './components/floating-navbar.js'
// import * as anchorLinkScrolling from './components/anchor-link-scrolling.js'
// import enableContactForm from './components/contact-form.js'
// import enableBioOverlays from './components/bio-overlays.js'
import enableLazyLoading from './components/lazy-loading.js'
// import enableResizeToFit from './components/resize-to-fit.js'

//  Fonts
import WebFont from 'webfontloader'
WebFont.load({ typekit: { id: 'lpq7mwc' } })

//  Constants
const SMALL_SCREEN_THRESHOLD = 900

//  Handler for when the window is resized
function resizeHandler() {

    if (document.body.offsetWidth < SMALL_SCREEN_THRESHOLD) {

        smallScreenNavbar.enable()
        floatingNavbar.disable()
        anchorLinkScrolling.setSmallScreen(true)

    } else {

        smallScreenNavbar.disable()
        floatingNavbar.enable()
        smallScreenGoatNoun.hide()
        anchorLinkScrolling.setSmallScreen(false)

    }

}

//  Executed once DOM is loaded
function enableInteractivity() {

    /*  Resizes once, then listens for resize event to enable
    *   small-screen navbar if indicated.  */
    // resizeHandler()
    // window.addEventListener('resize', resizeHandler)

    /*  Enables the small-screen goat noun overlay if the device
    *   initially loads the page with a width below the threshold.  */
    // if (document.body.offsetWidth < SMALL_SCREEN_THRESHOLD) smallScreenGoatNoun.show()

    //  Enables other interactive features
    // anchorLinkScrolling.enable()
    // enableContactForm()
    // enableBioOverlays()
    enableLazyLoading()
    // enableResizeToFit()

}

document.addEventListener('DOMContentLoaded', enableInteractivity)
