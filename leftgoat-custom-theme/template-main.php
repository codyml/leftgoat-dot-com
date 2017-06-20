<?php

/*
*   Template Name: Main Page
*/

get_header();

if ( have_posts() ) {

    while ( have_posts() ) {

        the_post();
        
        get_template_part( 'parts/first-look' );
        get_template_part( 'parts/nav-menu' );
        get_template_part( 'parts/who-we-are' );
        get_template_part( 'parts/services' );
        get_template_part( 'parts/the-difference' );
        get_template_part( 'parts/team' );
        get_template_part( 'parts/our-work' );
        //get_template_part( 'contact' );

    }

}

get_footer();
