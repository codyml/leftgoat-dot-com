/*
*   Coordinates loading async assets behind the loading view.
*/

export default () => {

    const element = document.querySelector('#loading')
    window.scrollTo(0, 0)
    setTimeout(() => element.classList.add('started'), 0)
    setTimeout(() => document.body.classList.add('loading-finished'), 2000)

}
