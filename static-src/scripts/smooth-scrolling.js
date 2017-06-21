/*
*   Imports & constants
*/

import Velocity from 'velocity-animate'
const FLOATING_NAVBAR_SPACE = -80;


/*
*   Enables smooth scrolling by intercepting clicks to anchor links,
*   then animating the scroll to their position.
*/

export default windowState => {

    const anchorLinks = [ ...document.querySelectorAll('a[href^="#"]:not([href="#contact"])') ]
    anchorLinks.forEach(anchorLink => {

        const anchor = anchorLink.href.match(/#.+$/)[0]
        anchorLink.addEventListener('click', event => {

            event.preventDefault()

            /*  
            *   Calculates whether the desired scroll position is below
            *   the bottom of the document.
            */

            const bodyHeight = document.body.scrollHeight
            const maxScrollPosition = bodyHeight - window.innerHeight
            
            let target = document.querySelector(anchor)
            let offset = mobileState.isMobile ? 0 : FLOATING_NAVBAR_SPACE
            const duration = 1250
            const easing = 'ease-in-out'
            
            if (target.offsetTop > maxScrollPosition) {
                offset = maxScrollPosition
                target = document.body
            }

            /*  
            *   Scrolls smoothly to either the top of the target element
            *   or the bottom of the document.
            */

            Velocity(target, 'scroll', { offset, duration, easing })

        })

    });

}
