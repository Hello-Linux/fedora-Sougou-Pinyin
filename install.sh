#!/bin/bash
# Author: sun~shell
# Time: 2020.4.10
# Function: 该脚本用于Fedora上一键安装搜狗输入法，测试于 Fedora31-GNOME
# version: v1.0.0
# Email: hello_linux@aliyun.com

## 安装配置
Install(){
#解决输入法依赖
    sudo dnf install -y qtwebkit libidn-devel
    #解压和配置包 version: 2.3.1.0112
    tar xvJf sogou.tar.xz
    sudo cp -pr usr/ /
    sudo cp -pr etc/ /
    #链接共享库
    sudo cp /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogoupinyin.so /usr/lib64/fcitx
    sudo ln -s /usr/lib/x86_64-linux-gnu/fcitx/fcitx-punc-ng.so /usr/lib64/fcitx-punc-ng.so
    sudo ln -s /usr/lib64/libidn.so.12 /usr/lib64/libidn.so.11
    #启动
    sogou-qimpanel
}

## fcitx安装配置
Config(){
    #解决环境依赖性
    sudo dnf install -y fcitx fcitx-pinyin fcitx-configtool gnome-tweak-tool
    #开机启动fcitx
    mkdir ~/.config/autostart
    cp fcitx.desktop ~/.config/autostart
    #重启时生效 默认输入法修改
    sudo cp fcitx.sh /etc/profile.d
    #本地默认输入法
    echo 'export GTK_IM_MODULE=fcitx' >> ~/.bashrc
    echo 'export QT_IM_MODULE=fcitx' >> ~/.bashrc
    echo 'export XMODIFIERS=@im=fcitx' >> ~/.bashrc
    #系统默认输入法
    
    echo "请重启计算机以生效！"
}

if [ "$1" == "config" ];then
    Config
fi

if [ "$1" == "install" ];then
    Install
fi
