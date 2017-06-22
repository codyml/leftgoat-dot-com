/*
*   Coordinates loading async assets behind the loading view.
*/

const wait = duration => new Promise(resolve => setTimeout(resolve, duration))
export default async () => {

    const container = document.querySelector('#loading')
    const logo = container.querySelector('.logo')
    const logoCover = logo.querySelector('.cover')

    await wait(0)
    container.classList.add('started')
    await wait(1000)

    const progressState = {
        
        progress: 0,
        async increment(n) {

            this.progress += n
            logoCover.style.height = Math.max(100 - this.progress, 0) + '%'
            if (this.progress >= 100) {

                const { startLazyLoading } = await import('./lazy-loading')
                await wait(500)
                container.classList.add('done')
                await wait(500)
                document.documentElement.classList.add('loading-done')
                await wait(500)
                container.remove()
                startLazyLoading()

            }
        
        }
    
    }

    loadStyles(progressState)
    loadFonts(progressState)
    trackImageLoading(progressState)
    loadScripts(progressState)

}


/*
*   Loads full site styles (25%)
*/

const loadStyles = async progressState => {

    await import('../styles/styles.css')
    progressState.increment(25)

}


/*
*   Loads full site fonts (25%)
*/

const loadFonts = async progressState => {

    const WebFontLoader = await import('webfontloader')
    
    await new Promise(resolve =>  WebFontLoader.load({
            
        google: {
            families: [
                'Bungee Outline',
                'Libre Baskerville:400i',
                'Montserrat:300,400,600,700',
            ],
        },
        active: resolve,
    
    }))

    progressState.increment(25)

}


/*
*   Tracks full-width image loading (25%)
*/

const trackImageLoading = async progressState => {

    const imagesLoaded = await import('imagesloaded')
    await new Promise(resolve => imagesLoaded('.big-image', { background: true }, resolve))
    progressState.increment(25)

}


/*
*   Loads full site scripts (~25%)
*/

const loadScripts = async progressState => {

    const throttle = await import('lodash.throttle')
    const windowState = {}
    const handleResize = () => {
        
        windowState.isMobile = (window.innerWidth <= 768)
        const navMenuDesktop = document.querySelector('#nav-menu-desktop')
        navMenuDesktop.classList.remove('floating')
        windowState.floatingScrollY = navMenuDesktop.offsetTop

    }

    await enableContactFormInteractivity(progressState)
    await enableTeamBioInteractivity(progressState)
    await enableMobileNavMenu(progressState)
    await enableSmoothScrolling(progressState, windowState)
    await enableFloatingNavMenu(progressState, windowState)
    await enableMobileDefinitionCard(progressState, windowState)
    await enableLazyLoading(progressState)

}


/*
*   Loads individual JS components (5% each)
*/

const enableContactFormInteractivity = async progressState => {

    const { enable } = await import('./contact')
    enable()
    progressState.increment(4)

}

const enableTeamBioInteractivity = async progressState => {

    const { enable } = await import('./team-bios')
    enable()
    progressState.increment(4)

}

const enableMobileNavMenu = async progressState => {

    const { enable } = await import('./mobile-nav-menu')
    enable()
    progressState.increment(4)

}

const enableSmoothScrolling = async (progressState, windowState) => {

    const { enable } = await import('./smooth-scrolling')
    enable(windowState)
    progressState.increment(4)

}

const enableFloatingNavMenu = async (progressState, windowState) => {

    const { enable } = await import('./floating-nav-menu')
    enable(windowState)
    progressState.increment(4)

}

const enableMobileDefinitionCard = async (progressState, windowState) => {

    const { enable } = await import('./mobile-definition-card')
    enable(windowState)
    progressState.increment(4)

}

const enableLazyLoading = async progressState => {

    const { enableTypewriterEffect } = await import('./lazy-loading')
    enableTypewriterEffect()
    progressState.increment(4)

}
