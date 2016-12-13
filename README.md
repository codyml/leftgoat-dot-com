Node.js Server with Headless WordPress CMS
==========================================
*by Cody M Leff*

This is a project I'm working on to facilitate building powerful Node.js-served websites with accessible WordPress back-end content management ready for deployment on Heroku but accessible locally through Vagrant.  It's heavily inspired and aided by [Xiao Yu's heroku-wp](https://github.com/xyu/heroku-wp) (thanks!), except refined for a specific use case.  It's a work in progress, and positive results are not guaranteed.

---

To start a new project, make sure you have all the required dependencies (what might they be?) and run ```./init.sh short-heroku-name 'Full Site Name'```.  If necessary, set up an S3 bucket and register it in the WordPress admin panel, and set up automatic deploys in GitHub.

---

Current Limitations:
- S3 image offload doesn't work for images inlined in post body content.

Coming Eventually:
- Include testing software.
- Research behavior when bandwidth and database limits are reached.
