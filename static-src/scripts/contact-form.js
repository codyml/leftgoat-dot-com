/*
*   Sets up interactivity for the contact form.
*/

import Overlay from './overlay'

export default () => {

    const element = document.querySelector('#contact')
    const overlay = new Overlay(element)
    
    const openLinks = [ ...document.querySelectorAll('[href="#contact"]') ]
    openLinks.forEach(link => link.addEventListener('click', overlay.open))
    
    const closeLink = element.querySelector('.close-button')
    closeLink.addEventListener('click', overlay.close)

}
