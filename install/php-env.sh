#!/usr/bin/env bash

echo 'Install php'
echo '-----------'
brew install php@7.3
brew install php@7.4
brew install php@8.0

echo 'Install php-yaml'
echo '-----------------'
brew install libyaml
pecl install yaml

# echo 'Install mcrypt'
# echo '-----------------'
# pecl install mcrypt

echo 'Install imagemagick & imagick'
echo '---------------'
brew install imagemagick
pecl install imagick

echo 'Install xdebug'
echo '--------------'
pecl install xdebug

echo 'Install redis'
echo '-------------'
pecl install redis

echo 'Install composer'
echo '----------------'
cd ~/.dotfiles
EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    echo 'ERROR: Invalid Composer installer signature'
    rm composer-setup.php
else
    php composer-setup.php --quiet
    rm composer-setup.php
    echo 'move composer to /usr/local/bin/composer'
    sudo mv -f composer.phar /usr/local/bin/composer
fi

echo 'Install cgr'
echo '------------'
composer global require consolidation/cgr

echo 'Install laravel envoy'
echo '---------------------'
cgr laravel/envoy


echo 'Install laravel installer'
echo '---------------------'
cgr laravel/installer

echo 'Install phpunit-watcher'
echo '-----------------------'
cgr spatie/phpunit-watcher

echo 'Install mixed-content-scanner-cli'
echo '---------------------------------'
cgr spatie/mixed-content-scanner-cli

echo 'Install friendsofphp/php-cs-fixer'
echo '---------------------------------'
cgr friendsofphp/php-cs-fixer

echo 'Install laravel valet'
echo '---------------------'
cgr laravel/valet
valet install