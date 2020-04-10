#!/bin/bash
# Author: sun~shell
# Time: 2020.4.10
# Function: 该脚本用于Fedora上一键卸载搜狗输入法，测试于 Fedora31-GNOME

if [ $(id -u) != "0" ]; then
    echo "请使用管理员权限执行脚本！"
    exit
fi

# 移除无用依赖包
dnf remove -y qtwebkit libidn-devel

# 删除本地配置项
sed -e '/export GTK_IM_MODULE=fcitx/d' ~/.bashrc > ~/.bashrc
sed -e '/export QT_IM_MODULE=fcitx/d' ~/.bashrc > ~/.bashrc
sed -e '/export XMODIFIERS=@im=fcitx/d' ~/.bashrc > ~/.bashrc

# 删除开机启动项
rm -f ~/.config/autostart/fcitx.desktop
rm -f /etc/profile.d/fcitx.sh

# 删除搜狗输入法安装包

## 删除/etc配置文件
rm -f /etc/X11/Xsession.d/72sogoupinyin
rm -f /etc/xdg/autostart/fcitx-ui-sogou-qimpanel.desktop

## 删除/usr文件

### 删除bin目录
rm -f /usr/bin/sogou*

### 删除lib目录
rm -f /usr/lib/mime/packages/fcitx-ui-sogou-qimpanel
rm -rf /usr/lib/x86_64-linux-gnu

### 删除share目录
rm -f /usr/share/applications/fcitx-ui-sogou-qimpanel.desktop
rm -rf /usr/share/doc/sogoupinyin
rm -rf /usr/share/fcitx-sogoupinyin
rm -f /usr/share/glib-2.0/schemas/50_sogoupinyin.gschema.override
rm -f /usr/share/keyrings/sogou*
rm -f /usr/share/locale/zh_CN/LC_MESSAGES/fcitx-sogoupinyin.mo
rm -f /usr/share/mime/packages/fcitx-ui-sogou*
rm -f /usr/share/pixmaps/application-x-scel.png
rm -f /usr/share/pixmaps/application-x-sogouskin.png
rm -rf /usr/share/sogou*
