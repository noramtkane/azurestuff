#!/usr/bin/bash
sudo -u devuser git clone $1 /home/devuser/workspace
sudo systemctl restart nginx
sudo systemctl restart php-fpm
echo "create database $3;"|mysql -u root
/usr/local/bin/composer config github-oauth.github.com 9de5d34e6d55abd91da23d0232c92b6ca13f0236
cd /home/devuser/workspace
sudo -u devuser git checkout $2
sudo -u devuser composer install
sudo -u devuser npm install
sudo -u devuser gulp
sudo -u devuser php artisan cache:clear
