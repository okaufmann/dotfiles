#!/usr/bin/env bash

# based on https://parsinta.com/articles/setup-php-swoole-in-your-mac-os

brew install openssl

export PATH="/opt/homebrew/opt/openssl@3/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"

brew install pcre2
sudo ln -s /opt/homebrew/include/pcre2.h /usr/local/include/

yes | pecl install swoole