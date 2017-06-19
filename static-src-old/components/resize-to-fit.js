/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
*
*   This client-side component adds a listener to resize components
*   marked with the '.resize-to-fit' class to fit their parent elements
*   using CSS transforms.  It's written in ES6, intended for Webpack
*   bundling.
*
*   Cody M Leff <cody@leftgoat.com>
*
*/


/*  Creates an array of elements needing resizing, saving their
*   initial sizes.  */
const nodes = [...document.querySelectorAll('.resize-to-fit')]
const dimensions = nodes.map(node => {

    const rect = node.getBoundingClientRect()
    return {

        width: rect.width,
        height: rect.height,

    }

})


/*
*   Function: resizeHandler
*   -----------------------
*   This function loops through the the nodes needing resizing,
*   applying a CSS transform to appropriately scale.
*/
function resizeHandler() {

    nodes.forEach((node, i) => {

        const parentRect = node.parentNode.getBoundingClientRect()
        const scale = Math.min(

            parentRect.width / dimensions[i].width,
            parentRect.height / dimensions[i].height

        )

        node.style.transform = `scale(${scale}) translate(-50%, -50%)`

    })

}


/*
*   Exported Function: enable
*   -------------------------
*   This function adds a resize listener and runs the resize handler
*   once.
*/
export default function enable() {

    resizeHandler()
    window.addEventListener('resize', resizeHandler)

}
