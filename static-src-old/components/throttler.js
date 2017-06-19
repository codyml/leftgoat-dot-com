/*
*   This helper creates a throttling helper.  All calls made to 
*   its 'execute' method will be throttled, so only the last call
*   made in the interval will be executed.
*/

export default class Throttler {
    
    constructor(interval) {

        this.expired = true
        this.toExecute = null
        this.interval = interval

    }

    execute(callback) {

        this.toExecute = callback
        if (this.expired) {

            this.expired = false
            setTimeout(() => { this.expired = true; this.toExecute() }, this.interval)

        }

    }

}