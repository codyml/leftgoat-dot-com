/*
*   Sets up interactivity for the team bios
*/

import Overlay from './overlay'

export default () => {

    const elements = [ ...document.querySelectorAll('.bio-overlay') ]
    elements.forEach((element) => {

        const overlay = new Overlay(element)
        
        const openLink = element.parentElement
        openLink.addEventListener('click', overlay.open)
        
        const closeLink = element.querySelector('.close-button')
        closeLink.addEventListener('click', (e) => {

            e.stopPropagation()
            overlay.close()

        })

    })

}
