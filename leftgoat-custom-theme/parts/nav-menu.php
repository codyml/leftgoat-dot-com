<?php

$menu = wp_nav_menu( array(

    'theme_location' => MAIN_NAV_MENU,
    'container' => false,
    'echo' => false,

) );

?>

<section id="nav-menu-desktop" class="wide is-hidden-mobile">
    <div class="stretchy-container">
        <?php echo $menu; ?>
    </div>
</section>
<section id="nav-menu-mobile" class="is-hidden-tablet">
    <?php echo $menu; ?>
    <a class="open-button">
        <svg viewBox="0 0 32 32">
            <line x1="6" y1="11" x2="26" y2="11" />
            <line x1="6" y1="16" x2="26" y2="16" />
            <line x1="6" y1="21" x2="26" y2="21" />
        </svg>
    </a>
    <a class="close-button">
        <svg viewBox="0 0 25 25">
            <line x1="0" y1="0" x2="25" y2="25" />
            <line x1="0" y1="25" x2="25" y2="0" />
        </svg>
    </a>
</section>
