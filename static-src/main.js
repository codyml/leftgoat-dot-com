/*
*   Imports CSS for processing and export to file.
*/

import './styles/main.css'


/*
*   Imports JS components for bundling.
*/

import enableContactFormInteractivity from './scripts/contact'
import enableTeamBioInteractivity from './scripts/team-bios'
import enableMobileNavMenu from './scripts/mobile-nav-menu'
import enableSmoothScrolling from './scripts/smooth-scrolling'
import enableFloatingNavMenu from './scripts/floating-nav-menu'


/*
*   Stores and updates whether the screen size is mobile or not.
*/

import throttle from 'lodash.throttle'
const mobileState = { isMobile: false }
const handleResize = () => {
    
    mobileState.isMobile = (window.innerWidth <= 768)

}

window.addEventListener('resize', throttle(handleResize, { trailing: true }))
handleResize()


/*
*   Enables interactivity on DOM load completion.
*/

window.addEventListener('DOMContentLoaded', () => {

    enableContactFormInteractivity()
    enableTeamBioInteractivity()
    enableMobileNavMenu()
    enableSmoothScrolling(mobileState)
    enableFloatingNavMenu()

})
