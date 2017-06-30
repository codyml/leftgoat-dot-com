# leftgoat.com
This repository contains the code that runs on the [Left Goat website](https://www.leftgoat.com).  It's a WordPress theme meant for installation on a standard WordPress installation.  It takes advantage of the following technologies:

- [Docker](http://docker.com) for development
- [Node.js](https://nodejs.org/)/[NPM](https://www.npmjs.com) for dependency management 
- [Advanced Custom Fields PRO](https://www.advancedcustomfields.com/pro/) for WP admin panel customization
- [SendGrid](https://sendgrid.com) for contact form submission
- [Webpack](https://webpack.js.org) for chunked static asset bundling
- [Babel](https://babeljs.io) for ES6+ transpiling
- [PostCSS](http://postcss.org) with [cssnext](http://cssnext.io) for CSS pre-processing
- Fonts from [Typekit](https://typekit.com) and [Google Fonts](https://fonts.google.com)
- [Velocity.js](http://velocityjs.org) for smooth scrolling and lazy-loading animations
- [imagesLoaded](https://imagesloaded.desandro.com) for tracking image load status

To develop, install Docker, Docker Compose and Node/NPM, then, from the repository root, run `npm install`.  Then, run `docker-compose up` and `npm run dev-watch` and visit `localhost:22222`.

To deploy, run `npm install && npm run prod-build`, then upload the `leftgoat-custom-theme` directory to the WordPress theme directory.  Make sure ACF is installed, then activate the theme.
