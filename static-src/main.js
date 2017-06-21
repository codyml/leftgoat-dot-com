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
*   Enables interactivity on DOM load completion.
*/

window.addEventListener('DOMContentLoaded', () => {

    enableContactFormInteractivity()
    enableTeamBioInteractivity()
    enableMobileNavMenu()
    enableSmoothScrolling()
    enableFloatingNavMenu()

})
