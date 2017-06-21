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
import enableMobileDefinitionCard from './scripts/mobile-definition-card'
import enableLazyLoading, { enableTypewriterEffect } from './scripts/lazy-loading'


/*
*   Stores and updates whether the screen size is mobile or not.
*/

import throttle from 'lodash.throttle'
const windowState = { isMobile: false }
const handleResize = () => {
    
    windowState.isMobile = (window.innerWidth <= 768)
    const navMenuDesktop = document.querySelector('#nav-menu-desktop')
    navMenuDesktop.classList.remove('floating')
    windowState.floatingScrollY = navMenuDesktop.offsetTop

}

window.addEventListener('resize', throttle(handleResize, { trailing: true }))


/*
*   Enables interactivity on DOM load completion.
*/

window.addEventListener('DOMContentLoaded', () => {

    handleResize()
    enableContactFormInteractivity()
    enableTeamBioInteractivity()
    enableMobileNavMenu()
    enableSmoothScrolling(windowState)
    enableFloatingNavMenu(windowState)
    enableMobileDefinitionCard(windowState)
    enableTypewriterEffect()
    enableLazyLoading()

})
