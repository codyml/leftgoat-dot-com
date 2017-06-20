/*
*   Sets up the mobile nav menu.
*/

import Overlay from './overlay'

export default () => {

    const element = document.querySelector('#nav-menu .mobile')
    const overlay = new Overlay(element)
    
    const openLink = element.querySelector('.open-button')
    openLink.addEventListener('click', overlay.open)
    
    const closeLinks = [ ...element.querySelectorAll('.close-button, ul a') ]
    closeLinks.forEach(link => link.addEventListener('click', e => {

        e.stopPropagation()
        overlay.close()

    }))

}
