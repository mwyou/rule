#!/usr/bin/env bash
set -e
# 追加第三方 feed：sundaqiang
grep -q 'sundaqiang/openwrt-packages' feeds.conf.default || \
echo 'src-git sundaqiang https://github.com/sundaqiang/openwrt-packages' >> feeds.conf.default
