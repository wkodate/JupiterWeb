#!/bin/sh

cd /var/www/html/jupiter-web/
git pull origin master
bundle install --deployment --without development test
bundle exec rake assets:precompile db:migrate RAILS_ENV=production
passenger-config restart-app
