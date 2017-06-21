<?php

/*
*   Registers a REST endpoint to submit a contact request.
*/

function send_contact_request( $request ) {

    $params = $request->get_json_params();
    $url =  'https://api.sendgrid.com/v3/mail/send';
    $sendgrid_apikey = file_get_contents( dirname(__FILE__) . '/sendgrid.env' );

    // Get cURL resource
    $ch = curl_init();

    // Set url
    curl_setopt($ch, CURLOPT_URL, $url);

    // Set method
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'POST');

    // Set options
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

    // Set headers
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
            "Authorization: Bearer " . $sendgrid_apikey,
            "Content-Type: application/json",
        ]
    );
    
    // Create body
    $json_array = [
        "personalizations" => [
            [
                "to" => [
                    [
                        "email" => $params['to']
                    ]
                ]
            ]
        ],
        "subject" => $params['subject'],
        "content" => [
            [
                "type" => "text/html",
                "value" => $params['content']
            ]
        ],
        "from" => [
            "email" => $params['from']
        ]
    ];
    
    $body = json_encode($json_array);

    // Set body
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $body);

    // Send the request & save response to $resp
    $resp = curl_exec($ch);
    $result = array();

    $result['response_code'] = '' . curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $result['response_body'] = $resp;

    // Close request to clear up some resources
    curl_close($ch);


    return array(
        'params' => $params,
        'result' => $result,
    );

}

function register_contact_request_endpoint() {
  
    register_rest_route( 'leftgoat', '/contact-request', array(
        
        'methods' => 'POST',
        'callback' => 'send_contact_request',

    ) );

}

add_action( 'rest_api_init', 'register_contact_request_endpoint' );
