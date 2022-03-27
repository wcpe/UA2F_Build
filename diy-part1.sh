#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >>feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >>feeds.conf.default

# 添加SSRP+
echo "src-git helloworld https://github.com/fw876/helloworld.git" >> feeds.conf.default

# 添加OpenClash
git clone https://github.com/vernesong/OpenClash.git
cp -rf OpenClash/luci-app-openclash package/luci-app-openclash

# 添加UA2F
git clone https://github.com/Zxilly/UA2F.git package/UA2F

# 更新queue
git clone https://github.com/openwrt/packages
rm -rf package/libs/libnetfilter-queue
# cp命令方便本地使用
cp -rf packages/libs/libnetfilter-queue package/libs/
