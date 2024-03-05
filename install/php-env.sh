#!/usr/bin/env bash

# Check if '--force' is passed as an argument
FORCE=0
for arg in "$@"; do
  if [ "$arg" = "--force" ]; then
    FORCE=1
  fi
done

# Skip the check if '--force' is used, otherwise perform the check
if [ $FORCE -ne 1 ] && [ -f ~/.php-setup ]; then
  echo 'PHP is already installed. Exiting.'
  echo 'If you need to run it anyway, you can by calling the following command:'
  echo ''"'"sh '$(chezmoi source-path)/install/php-env.sh --force'"'"''
  exit 0
fi

echo 'Install php-yaml'
echo '-----------------'
yes '' | pecl install yaml

echo 'Install imagemagick & imagick'
echo '---------------'
pecl uninstall imagick # needs to be reinstall as imagemagick version could have changed
yes '' | pecl install imagick
# ensure the extension is only loaded once in the php.ini
php_ini_path=$(php --ini | grep 'Loaded Configuration File' | awk '{ print $4 }')
sed -i '' '/imagick.so/d' "$php_ini_path"
echo 'extension=imagick.so' >>  "$php_ini_path"

echo 'Install xdebug'
echo '--------------'
pecl install xdebug

echo 'Install redis'
echo '-------------'
pecl install redis

echo 'Install laravel envoy'
echo '---------------------'
composer global require laravel/envoy -W

echo 'Install laravel installer'
echo '---------------------'
composer global require laravel/installer -W

echo 'Install phpunit-watcher'
echo '-----------------------'
composer global require spatie/phpunit-watcher -W

echo 'Install friendsofphp/php-cs-fixer'
echo '---------------------------------'
composer global require friendsofphp/php-cs-fixer -W

echo 'Install spatie/x-ray'
echo '---------------------------------'
composer global require spatie/x-ray -W

echo 'Install laravel valet'
echo '---------------------'
composer global require laravel/valet -W
valet trust


echo -e "\033[0;31mDisabling trust-settings.admin to prevent spamming with password prompts\033[0m"
security authorizationdb read com.apple.trust-settings.admin > ~/.config/valet/apple-trust-settings
sudo security authorizationdb write com.apple.trust-settings.admin allow
valet install
sudo security authorizationdb write com.apple.trust-settings.admin < ~/.config/valet/apple-trust-settings
echo -e "\033[0;31mRe-enabling trust-settings.admin\033[0m"

touch ~/.php-setup
echo "PHP setup completed. Last run at $(date)" > ~/.php-setup
