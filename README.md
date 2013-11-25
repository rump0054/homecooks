Default Rails App
=================

This app contains my default rails setup.  It contains these custom components:

* Gemfile
* Testing
* Twitter Bootstrap 3
* Application helper

Gemfile Setup
-------------
Removed comment lines from file and has these custom gems added and installed by default:

For all environments:
* bootstrap-sass ~> 3
* haml
* high_voltage
* simple_form
* devise
* bcrypt-ruby (via git repository)

For test and development:
* rspec
* spork
* capybara
* factory_girl
* better_errors
* quiet_errors

For production (Heroku deployment)
* rails_12factor
* pg (development and test use sqlite)

Testing
-------
Removed the test directory and added the spec directory with folders for controllers, helpers, and models.  Added spec_help.rb file configured for use with Spork.

Twitter Bootstrap 3
-------------------
Added a default layout using the Twitter Bootstrap CSS framework.  Layout lives in the app/views/layout folder.  Also includes an app/views/shared folder which contains partials for flash message rendering in the default layout.

For proper form handling, I have also added a simple_form.rb initializer that properly setups the HTML tag handling of bootstrap components when using the simple_form gem.

Bootstrap components are imported into:
*CSS: app/assets/stylesheets/custom.css.scss
*Javascript: app/assets/javascripts/application.js

Application Helper
------------------
Custom application helpers added

*full_title - returns a full title based on a per-page basis