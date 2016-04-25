#!/bin/bash

while ! ping -c 1 fpm; do sleep 3; done
nginx -g "daemon off;"
