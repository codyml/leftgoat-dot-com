/*
*   Coordinates the opening and closing of site overlays, so two
*   overlays are never open at once.
*/


const overlays = []


/*
*   Sets all overlays to be closed except the passed parameter, 
*   if present.
*/

const setOpenOverlay = overlay => {

    let overlayOpen = false
    for (let i = 0; i < overlays.length; i++) {

        if (overlays[i] === overlay) {
            overlay.element.classList.add('coordinated-overlay-open')
            overlayOpen = true
        } else {
            overlays[i].element.classList.remove('coordinated-overlay-open')
        }

    }
    if (overlayOpen) document.body.classList.add('coordinated-overlay-open')
    else document.body.classList.remove('coordinated-overlay-open')

}


/*
*   Exported class definition for a coordinated overlay.
*/

export default class Overlay {

    constructor(element) {
        this.element = element
        element.classList.add('coordinated-overlay')
        overlays.push(this)
        this.open = this.open.bind(this)
        this.close = this.close.bind(this)
    }

    open() { setOpenOverlay(this) }
    close() { setOpenOverlay() }
    closeAll() { setOpenOverlay() }

}
