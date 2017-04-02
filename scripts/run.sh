#!/bin/sh

#tail -F /var/log/apache2/*log &

echo "[i] Starting daemon..."

# run apache httpd daemon

httpd -D FOREGROUND
