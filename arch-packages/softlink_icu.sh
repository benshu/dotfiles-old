# This script will soft link icu shared libraries to support playwright
# requirements

# https://github.com/microsoft/playwright/issues/2621

sudo ln -s /usr/lib/libicui18n.so.67 /usr/lib/libicui18n.so.66
sudo ln -s /usr/lib/libicuuc.so.67 /usr/lib/libicuuc.so.66
sudo ln -s /usr/lib/libwebp.so.7 /usr/lib/libwebp.so.6
sudo ln -s /usr/lib/libenchant-2.so /usr/lib/libenchant.so.1

