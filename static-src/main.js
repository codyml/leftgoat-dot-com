/*
*   Imports the CSS and JS required for the loading sequence, then
*   begins the loading sequence for the other assets.
*/

import './styles/loading.css'
import startLoading from './scripts/loading'
window.addEventListener('DOMContentLoaded', startLoading)
