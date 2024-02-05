#!/bin/bash

apt install git

wget https://getcomposer.org/installer -O composer.phar
php composer.phar
php composer.phar install --no-dev