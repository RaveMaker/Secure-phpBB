#! /bin/bash

# This script secure all wordpress folders and files permissions

# This is the folder where all your phpBB installations are:
www="/www/"
# Loop all folder inside $www and try to locate WordPress installs.
for d in "$www"/*/; do
  # remove trail / from $d (/www/website instead of /www/website/)
  d=${d%/}
  if [ -f "$d"/config.php ]; then
    # phpBB Found at $d
    echo "phpBB found! $d"
    chmod 644 "$d"/config.php
    chown root:root "$d" -R
    find "$d" -type d -exec chmod 755 {} \;
    find "$d" -type f -exec chmod 644 {} \;
    find "$d"/files -type d -exec chmod 777 {} \;
    find "$d"/files -type f -exec chmod 666 {} \;
    find "$d"/cache -type d -exec chmod 777 {} \;
    find "$d"/cache -type f -exec chmod 666 {} \;
    find "$d"/store -type d -exec chmod 777 {} \;
    find "$d"/store -type f -exec chmod 666 {} \;
    find "$d"/images/avatars/upload -type d -exec chmod 777 {} \;
    find "$d"/images/avatars/upload -type f -exec chmod 666 {} \;
    chown root:apache "$d"/config.php
    chmod 640 "$d"/config.php
    chcon -R -t httpd_sys_content_t "$d"
    chcon -R -t httpd_sys_rw_content_t "$d"/files
    chcon -R -t httpd_sys_rw_content_t "$d"/cache
    chcon -R -t httpd_sys_rw_content_t "$d"/store
    chcon -R -t httpd_sys_rw_content_t "$d"/images/avatars/upload
    restorecon -v "$d"/cache/production/queue.php.lock
  fi
done
