#!/usr/bin/env bash

sudo chmod +w /etc/pam.d/sudo
sudo vim /etc/pam.d/sudo

echo 'ensure the following line'
echo 'auth       sufficient     pam_tid.so'

sudo chmod -w /etc/pam.d/sudo