/*
*   Imports & constants
*/

import throttle from 'lodash.throttle'
const INTERVAL = 100

/*
*   Attaches a throttled scroll listener function that applies or
*   removes a CSS class to the nav menu depending on scroll position.
*/

export default () => {

    const element = document.querySelector('#nav-menu-desktop')
    const floatingScrollY = element.offsetTop

    const handleScroll = () => {

        const floating = window.scrollY > floatingScrollY
        if (floating) element.classList.add('floating')
        else element.classList.remove('floating')

    }

    window.addEventListener('scroll', throttle(handleScroll, INTERVAL, { trailing: true }))
    handleScroll()

}
