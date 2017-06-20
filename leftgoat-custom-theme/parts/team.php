<?php

$team_members = get_field( 'our_team_members' );

?>

<section id="team" class="wide">
    <div class="fluid-container">
        <ul>
            <?php foreach ( $team_members as $key => $value ) : ?>
                <li>
                    <div class="image" style="background-image: url('<?php echo $value['image']; ?>');"></div>
                    <div class="text">
                        <div class="name"><?php echo $value['name']; ?></div>
                        <div class="position"><?php echo $value['position']; ?></div>
                    </div>
                    <div class="bio-overlay">
                        <a class="bio-close-button">
                            <svg viewBox="0 0 25 25">
                                <line x1="0" y1="0" x2="25" y2="25" />
                                <line x1="0" y1="25" x2="25" y2="0" />
                            </svg>
                        </a>
                        <div class="name"><?php echo $value['name']; ?></div>
                        <div class="position"><?php echo $value['position']; ?></div>
                        <div class="bio"><?php echo $value['bio']; ?></div>
                    </div>
                </li>
            <?php endforeach; ?>
        </ul>
    </div>
</section>
