/*
*   Coordinates the opening and closing of site overlays, so two
*   overlays are never open at once.
*/

/*
*   Imports the Velocity library
*/

import Velocity from 'velocity-animate'


/*
*   Returns overlay transition config constants
*/

const getTransition = (transition, display) => {

    const duration = 500

    switch (transition) {

        case 'slide-right': return {

            initial: [ { translateX: '-100%' }, { display: 'none', duration: 0 } ],
            opening: [ { translateX: '0%' }, { display, duration } ],
            closing: [ { translateX: '-100%' }, { display: 'none', duration } ],
        
        }

        case 'slide-left': return {
            
            initial: [ { translateX: '100%' }, { duration: 0 } ],
            opening: [ { translateX: '0%' }, { duration } ],
            closing: [ { translateX: '100%' }, { duration } ],

        }

    }

}

const applyBodyStyles = overlayOpen => {

    if (overlayOpen) document.body.classList.add('overlay-open')
    else document.body.classList.remove('overlay-open')

}

const overlays = []


/*
*   Sets all overlays to be closed except the passed parameter, 
*   if present.
*/

const setOpenOverlay = overlay => {

    let overlayOpen = false
    for (let i = 0; i < overlays.length; i++) {

        if (overlays[i] === overlay && !overlay.visible) {
            
            overlayOpen = true
            Velocity(overlays[i].element, ...overlays[i].transition.opening)

        } else Velocity(overlays[i].element, ...overlays[i].transition.closing)

    }
    
    applyBodyStyles(overlayOpen)

}


/*
*   Exported class definition for a coordinated overlay.
*/

export default class Overlay {

    constructor(element, transition) {
        
        this.element = element
        this.visible = false
        this.transition = getTransition(transition, element.style.display)
        Velocity(this.element, ...this.transition.initial)
        overlays.push(this)
        
        this.open = this.open.bind(this)
        this.close = this.close.bind(this)
    
    }

    open() { setOpenOverlay(this) }
    close() { setOpenOverlay() }
    closeAll() { setOpenOverlay() }

}
