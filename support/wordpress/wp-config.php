<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

$db_url = getenv('WP_DATABASE_URL') ?: 'http://local:local@localhost:3306/wordpress';
$parsed_db_url = parse_url($db_url);

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', trim($parsed_db_url['path'], '/'));

/** MySQL database username */
define('DB_USER', $parsed_db_url['user']);

/** MySQL database password */
define('DB_PASSWORD', $parsed_db_url['pass']);

/** MySQL hostname */
define('DB_HOST', $parsed_db_url['host']);

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/** Sets site URL to the HTTP host. */

if (isset($_SERVER['HTTP_HOST'])) {
    define('WP_SITEURL', 'http://' . $_SERVER['HTTP_HOST']);
    define('WP_HOME', 'http://' . $_SERVER['HTTP_HOST']);
}

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'p~4DgpVW_m,r6VAz+Ucu^?%yZ5zqn6wXCEV,,u-8`%mFzw6{*$ogknCChuo;>c/.');
define('SECURE_AUTH_KEY',  ']*mDy_O!pN{>i`o,v!s1x7DSO`R]ugO43|S.<r;-P{.&$>r3gL1K)lS)_LF<C-[$');
define('LOGGED_IN_KEY',    'P`P_tw@f5**y*o!<D!B)h&Pg}XG/cq+-1#}5bJKx#DQuV2/Pt/x3mNcYdj;SSN1`');
define('NONCE_KEY',        '$RhdoNv.Y)+.ut+[vR!jc5344&b`{nQSK#vZGvKar+49@FYAcmA.;XNxG__2aAWi');
define('AUTH_SALT',        'G(M+p]EjK]Dg[%+j/^v>AF!39z*{-|)48?gCOB{2Q{mACb6IY `b*vD|V3}iF!pt');
define('SECURE_AUTH_SALT', '[U>(Fj5?;{{1+I,?iUOiSjcZ,S?yzKlqD7l/FS8syl+<6XySG:m-|B-JfQ<(#tHd');
define('LOGGED_IN_SALT',   'GR{02_nA[MaY9+.h1:aQfBj3 `- 41Nx<]hAkaf^xcPPV$OzQ7uCe~0us?&N)k?1');
define('NONCE_SALT',       'jLeth8ad@w<Oq. O1ms|}BLyYhPY_yepsoO[^N*^26a0g*tq-XCvS<-MiN_$V@9^');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
