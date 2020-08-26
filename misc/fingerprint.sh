#!/usr/bin/env bash

sudo chmod +w /etc/pam.d/sudo

echo 'Copy the following to your clipboard and ensure it''s the first line (add it if its missing)'
echo
echo 'auth       sufficient     pam_tid.so'
echo
echo 'Vim open the config file if you press [ENTER]'
read

sudo vim /etc/pam.d/sudo



sudo chmod -w /etc/pam.d/sudo