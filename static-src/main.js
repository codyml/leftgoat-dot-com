/*
*   Imports CSS for processing and export to file.
*/

import './styles/main.css'


/*
*   Imports JS components for bundling.
*/

// import beginLoadingSequence from './scripts/loading'
import enableContactFormInteractivity from './scripts/contact-form'
import enableTeamBioInteractivity from './scripts/team-bios'
import enableMobileNavMenu from './scripts/mobile-nav-menu'


/*
*   Enables interactivity on DOM load completion.
*/

window.addEventListener('DOMContentLoaded', () => {

    // beginLoadingSequence()
    enableContactFormInteractivity()
    enableTeamBioInteractivity()
    enableMobileNavMenu()

})
