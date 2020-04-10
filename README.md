# fedora-Sougou-Pinyin
fedora 搜狗拼音安装方法
===

### 1.下载最新版本的搜狗deb包
使用dpkg -X sogoupinyin_2.3.1.0112_amd64.deb解包搜狗输入法
### 2.将包下的 etc/和 usr/目录放置到linux根目录下
```
cp -pr usr/ /
cp -pr etc/ /
```
### 3.安装依赖库
```
dnf install -y qtwebkit libidn-devel fcitx
```
### 4.链接共享库
```
cp /usr/lib/x86_64-linux-gnu/fcitx/fcitx-sogoupinyin.so /usr/lib64/fcitx
ln -s /usr/lib/x86_64-linux-gnu/fcitx/fcitx-punc-ng.so /usr/lib64/fcitx-punc-ng.so
ln -s /usr/lib64/libidn.so.12 /usr/lib64/libidn.so.11
```
### 5.启动
```
sogou-qimpanel
```
### 快捷键为： curl+空格
启动且无致命错误后，可以测试输入法，或者终止安装程序。
