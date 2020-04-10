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

# 如何更换皮肤?
```
官方皮肤下载地址: https://pinyin.sogou.com/skins/
```
  安装后都会带有几款默认的搜狗皮肤,存储目录为/usr/share/sogou-qimpanel/recommendSkin/skin,搜狗默认皮肤目录为:/usr/share/sogou-qimpanel/recommendSkin/skin,从官网下载你喜欢的皮肤,记住一定是要带有ssf文件的才是linux支持的皮肤,然后放到skin目录下新建一个文件夹,名字就是这款皮肤的名字,然后使用鼠标右击.ssf文件,选择用搜狗拼音打开,之后你会看到皮肤已经改变了!

