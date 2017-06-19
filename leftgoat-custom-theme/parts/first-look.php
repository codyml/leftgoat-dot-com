<?php

$phone_number_without_separators = implode( '', explode( '.', get_field( 'contact_info_phone_number' ) ) );

?>

<section id="first-look" style="background-image: url('<?php echo get_field( 'first_look_full_width_background_image' ); ?>');">
    <div class="contact-info is-hidden-mobile">
        <a href="tel:<?php echo $phone_number_without_separators ?>"><?php echo get_field( 'contact_info_phone_number' ); ?></a>
        <a href="mailto:<?php echo get_field( 'contact_info_email_address' ); ?>"><?php echo get_field( 'contact_info_email_address' ); ?></a>
    </div>
    <div class="fluid-container">
        <div class="columns">
            <div class="introduction column is-offset-1 is-6">
                <article><?php echo get_field( 'first_look_content' ); ?></article>
                <svg class="claw" viewBox="0 0 50 160">
                    <line x1="0" y1="0" x2="0" y2="110"></line>
                    <line x1="0" y1="110" x2="50" y2="160"></line>
                </svg>
            </div>
            <article class="definition-card column is-offset-1 is-4">
                <?php echo get_field( 'first_look_definition_card' ); ?>
                <div class="continue-button is-hidden-tablet">Continue</button>
            </div>
        </div>
    </div>
</section>
