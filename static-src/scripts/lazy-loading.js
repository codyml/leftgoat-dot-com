/*
*   Imports and constants
*/

import throttle from 'lodash.throttle'
const REFRESH_INTERVAL = 500


/*  
*   The lazy-loading will occur once the user has scrolled this
*   far into an element.
*/

const TRIGGER_OFFSET = 100
let nodesToLoad = [ ...document.querySelectorAll('.lazy-load') ]


/*
*   Checks if the new scroll position warrants lazy-loading a certain
*   page section.
*/

const scrollHandler = () => {

    if (nodesToLoad.length > 0) {

        nodesToLoad = nodesToLoad.filter(node => {

            if (node.getBoundingClientRect().top < window.innerHeight - TRIGGER_OFFSET) {

                node.classList.add('lazy-load-finished')
                return false

            } else return true

        })

    } else window.removeEventListener('scroll', scrollHandler)

}


/*
*   Starts lazy loading
*/

export const startLazyLoading = () => {

    window.addEventListener('scroll', throttle(scrollHandler, REFRESH_INTERVAL, { trailing: true }))
    scrollHandler()

}


/*
*   Enables special typewriter effect for lazy-loading.
*/

export const enableTypewriterEffect = () => {

    const nodes = [ ...document.querySelectorAll('.typewriter-effect') ]
    nodes.forEach(node => {

        node.innerHTML = node.innerText.split('').map(t => `<span>${t}</span>`).join('')

    })

}