#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
BASEPATH=$SCRIPTPATH

info () {
  printf "  [ \033[00;34m..\033[0m ] $1 \n"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

if [ ! -f /etc/apache2/users/workethic.conf ]; then
  info "Installing Apache2 Config"
  # We link because this config may change or be updated
  rm $BASEPATH/apache2.conf
  cp $BASEPATH/apache2.conf.tmpl $BASEPATH/apache2.conf
  sed -i "" -e "s@%%PATH%%@$BASEPATH@g" $BASEPATH/apache2.conf #OSX specific replace in place
  sudo ln -s $BASEPATH/apache2.conf /etc/apache2/users/workethic.conf
fi

info "Ensuring Apache starts on boot"
launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist > /dev/null 2>&1

user "Do you want to add 127.0.0.2 as a loopback alias? This will survive reboots. [y] Yes / [n] No"

read -n 1 action

printf "\n";

case "$action" in
  y )
    info "Copying loopback alias"
    # We copy because this file will not change in implementation.
    # Now that I've said that, it totally will. You just watch.
    sudo cp $BASEPATH/loopback.plist /Library/LaunchDaemons/com.lo1.plist
    sudo launchctl load -w /Library/LaunchDaemons/com.lo1.plist
    ;;
  * )
    ;;
esac

info "Restarting Apache"

apachectl restart > /dev/null 2>&1

success "Finished. Remember to add blocked sites to your /etc/hosts by pointing them at 172.0.0.2"
