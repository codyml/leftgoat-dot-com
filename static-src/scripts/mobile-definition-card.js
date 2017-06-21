/*
*   Sets up the mobile definition card.
*/

import Overlay from './overlay'

export default windowState => {

    if (windowState.isMobile) {

        const element = document.querySelector('#first-look .definition-card')
        const overlay = new Overlay(element, 'fade')

        const closeLink = element.querySelector('.continue-button')
        closeLink.addEventListener('click', overlay.close)

        overlay.open()

    }

}
