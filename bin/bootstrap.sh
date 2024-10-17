#!/bin/bash

# Clone my git repos
mkdir /dev/repos
cd /dev/repos
curl -s https://api.github.com/users/segfault017/repos | grep \"clone_url\" | awk '{print $2}' | sed -e 's/"//g' -e 's/,//g' | xargs -n1 git clone


# TODO handle ssh keys

# TODO handle dotfiles 

# TODO install browser 	