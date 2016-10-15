Node.js Server with Headless WordPress CMS
==========================================
*by Cody M Leff*

This is a project I'm working on to facilitate building powerful Node.js-served websites with accessible WordPress back-end content management ready for deployment on Heroku but accessible locally through Vagrant.  It's heavily inspired and aided by [Xiao Yu's heroku-wp](https://github.com/xyu/heroku-wp) (thanks!), except refined for a specific use case.  It's a work in progress, and positive results are not guaranteed.

---

To start a new project, make sure you have all the required dependencies (what might they be?) and run ```./init.sh short-heroku-name 'Full Site Name'```.  If you'd like to add plugins, include them in composer.json and run ```composer update```, then add a line to install them using WP-CLI in install/install-wp.sh.

---

Next Steps:
- Finishing cleaning up new project setup, making sure Vagrant works.
- Revamp WordPress API access to serve WP Pages with [Advanced Custom Fields](https://www.advancedcustomfields.com), and write a custom JSON-serving theme to support it.
- Enable file uploads and SSL.
- Set server to handle assets correctly, plus include webpack for assets.

Coming Eventually:
- Include testing software.
- Research behavior when bandwidth and database limits are reached.
