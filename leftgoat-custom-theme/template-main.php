<?php

/*
*   Template Name: Main Page
*/

get_header();

?>

<?php if ( have_posts() ) : while ( have_posts() ) : the_post(); ?>

<?php print_r( get_fields() ); ?>

<?php endwhile; endif; ?>

<?php

get_footer();
