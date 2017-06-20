<?php

$phone_number_without_separators = implode( '', explode( '.', get_field( 'contact_info_phone_number' ) ) );

?>

<section id="contact" class="transition-slide-right">
    <a class="close-button">
        <svg viewBox="0 0 25 25">
            <line x1="0" y1="0" x2="25" y2="25" />
            <line x1="0" y1="25" x2="25" y2="0" />
        </svg>
    </a>
    <div class="stretchy-container contact-info">
        <div class="first">
            <a href="tel:<?php echo $phone_number_without_separators ?>"><?php echo get_field( 'contact_info_phone_number' ); ?></a>
            <a href="mailto:<?php echo get_field( 'contact_info_email_address' ); ?>"><?php echo get_field( 'contact_info_email_address' ); ?></a>
        </div>
        <div class="separator"></div>
        <div class="second">
            <?php echo get_field( 'contact_info_mailing_address' ); ?>
        </div>
    </div>
    <section class="contact-form">
        <div class="stretchy-container">
            <h1>Tell us about your project</h1>
            <form>
                <?php foreach ( array( 'Name', 'Email', 'Phone Number', 'Website' ) as $label ) : ?>
                    <label class="half-width">
                        <div><?php echo $label; ?>:</div>
                        <input type="text" data-field-name="<?php echo $label; ?>">
                    </label>
                <?php endforeach; ?>
                <label class="full-width">
                    <div>Description: </div>
                    <textarea data-field-name="Description"></textarea>
                </label>
                <a class="custom-button submit-button">Submit</a>
            </form>
        </div>
    </section>
</section>
