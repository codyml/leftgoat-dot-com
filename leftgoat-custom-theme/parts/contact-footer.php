<?php

$phone_number_without_separators = implode( '', explode( '.', get_field( 'contact_info_phone_number' ) ) );

?>

<footer>
    <a href="tel:<?php echo $phone_number_without_separators ?>"><?php echo get_field( 'contact_info_phone_number' ); ?></a> | 
    <?php echo get_field( 'contact_info_mailing_address' ); ?>
</footer>
