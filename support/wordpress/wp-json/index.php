<?php

$response = Array();

/*  Retrieves post(s) and returns their titles, contents and fields.
*/
if ( have_posts() ) : while ( have_posts() ) : the_post();

    //  Retrieves the post contents
    $content = get_the_content();
    $content = apply_filters('the_content', $content);
    $content = str_replace(']]>', ']]&gt;', $content);

    //  Retrieves other post info
    $this_post = Array(
        'title' => the_title(null, null, false),
        'content' => $content,
        'fields' => get_fields()
    );

    $js_safe_key = implode('_', explode('-', $post->post_name));
    $response[$js_safe_key] = $this_post;

endwhile; endif;

/*  Returns post(s) as JSON.
*/
header('Content-Type: application/json;charset=utf-8');
echo json_encode($response);
