<?php

/*
*   Imports and inserts tracking codes, if available.
*/

function get_analytics_head() {
    $path = dirname(__FILE__) . '/analytics-head.env';
    return !WP_DEBUG && file_exists( $path ) ? file_get_contents( $path ) : '';
}

function get_analytics_body() {
    $path = dirname(__FILE__) . '/analytics-body.env';
    return !WP_DEBUG && file_exists( $path ) ? file_get_contents( $path ) : '';
}
