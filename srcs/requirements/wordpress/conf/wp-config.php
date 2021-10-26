<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('MYSQL_DATABASE'));
/** MySQL database username */
define( 'DB_USER', getenv('WP_USER'));
/** MySQL database password */
define('DB_PASSWORD', getenv('WP_USER_PASSWORD'));
/** MySQL hostname */
define('DB_HOST', getenv('WP_DB_HOST'));
/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );
/** The Database Collate type. Do not change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'jVohY.XHFW65)D3r:$jFyjIXb.6/iapds?#XaFDk4BKR)4H;6mFakpN=z1lm4^lK' );
define( 'SECURE_AUTH_KEY',  '@,Nt44Hf!>n79syPa;zTW=8x2m6`UJ|PH8D74VGWn,{bpRz{&2fXGN1q$)/h5Aw~' );
define( 'LOGGED_IN_KEY',    '?1v:%KV-_gGIjKq13$~pN7X-N7tsl7m4E8H@C!art)@Q&%ODsO875jWtLL!kDcT6' );
define( 'NONCE_KEY',        'e?Y30]0xz$,@Go?r9N]R;z7lE[#kNy_L/@I!UntH.H7ZZOoe6#/+1(u6_Qt0)t4p' );
define( 'AUTH_SALT',        '#A4|0Ft {E{=+_vzegZD:bl(c+]`<copY.TsLIld~1]>fXc<>8[_E4+83xb%G.R,' );
define( 'SECURE_AUTH_SALT', '34!8Ag@utX_hW/38oj)U(//A|/^RVBVzrhR*5Z@L-M![s:q$/-2iHMK ^x^!s80y' );
define( 'LOGGED_IN_SALT',   'e`17Q`NMfF[WO@4ZC%.(0b56.xUsBwztM4WLO;jJA|(p-Kz1y2jPSyQWTA7weqwt' );
define( 'NONCE_SALT',       '0u2W#o(C9nLx(iXXHf`oizlISNUjWC3 pKCD]&]hE>v=]+fab:+DmgoCqJjtq ,0' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = getenv('WP_TABLE_PREFIX');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

define('CONCATENATE_SCRIPTS', false);

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';