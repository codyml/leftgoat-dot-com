<?php

$response = Array();

/*  Retrieves post title and if found, saves title and fields
*   for request response.
*/
$title = single_post_title(null, false);
if (isset($title)) {

    $response['title'] = $title;
    $response['fields'] = get_fields();

}

header('Content-Type: application/json;charset=utf-8');
echo json_encode($response);