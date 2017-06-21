/*
*   Imports
*/

import Velocity from 'velocity-animate'


/*
*   Constants
*/

const DURATION = 1000
const EASING = 'ease-in-out'
const LARGE_SCREEN_OFFSET = -110


/*
*   Enables smooth scrolling by intercepting clicks to anchor links,
*   then animating the scroll to their position.
*/

export default () => {

    const anchorLinks = [ ...document.querySelectorAll('a[href^="#"]:not([href="#contact"])') ]
    anchorLinks.forEach(anchorLink => {

        const anchor = anchorLink.href.match(/#.+$/)[0]
        anchorLink.addEventListener('click', event => {

            console.log(anchorLink, event)

            //  Prevents the normal, instantaneous scrolling
            event.preventDefault()

            /*  Calculates whether the desired scroll position is below
            *   the bottom of the document.  */
            const target = document.querySelector(anchor)
            const bodyHeight = document.body.scrollHeight
            const maxScrollPosition = bodyHeight - window.innerHeight
            
            /*  Scrolls smoothly to either the top of the target element
            *   or the bottom of the document.  */
            if (target.offsetTop < maxScrollPosition) {

                console.log('scrolling to: ', target, target.offsetTop, bodyHeight, maxScrollPosition)

                Velocity(target, 'scroll', {

                    offset: 0,
                    duration: DURATION,
                    easing: EASING,

                })

            } else {

                console.log('scrolling to max scroll position: ', target, target.offsetTop, bodyHeight, maxScrollPosition)

                Velocity(document.body, 'scroll', {

                    offset: maxScrollPosition,
                    duration: DURATION,
                    easing: EASING,

                })

            }

        })

    });

}
