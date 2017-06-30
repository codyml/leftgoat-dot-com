<?php

/*
*   Registers the theme main menu location.
*/

function register_main_nav_menu() {
  
    register_nav_menu( MAIN_NAV_MENU, 'Main Nav Menu' );

}

add_action( 'init', 'register_main_nav_menu' );
