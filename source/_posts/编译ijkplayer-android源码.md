---
title: 编译ijkplayer-android源码
date: 2017-05-04 11:19:49
tags:
---

#编译ijkplayer-android源码#

原本想在windows系统下编译，不过在windows 7 64位旗舰版系统下编译ffmpeg出现以下错误：
<pre>
$ ./compile-ffmpeg.sh all
====================
[*] check archs
====================
FF_ALL_ARCHS = armv5 armv7a arm64 x86 x86_64
FF_ACT_ARCHS = armv5 armv7a arm64 x86 x86_64

====================
[*] check env armv5
====================
FF_ARCH=armv5
FF_BUILD_OPT=

--------------------
[*] make NDK standalone toolchain
--------------------
build on MINGW64_NT-6.1 x86_64
ANDROID_NDK=C:\develop\AndroidNDK
IJK_NDK_REL=14.1.3816874
NDKr14.1.3816874 detected
HOST_OS=windows
HOST_EXE=.exe
HOST_ARCH=x86_64
HOST_TAG=windows-x86_64
HOST_NUM_CPUS=4
BUILD_NUM_CPUS=8
Auto-config: --arch=arm
<font color=darkred><b>ERROR: Failed to create toolchain.</b></font>
</pre>

寻求解决办法无果，继而转向Ubuntu系统编译。

##编译环境##
- Ubuntu 17.04 64位

##编译步骤##
1. 在任意位置打开终端，输入以下命令安装git、yasm：

	```
	sudo apt install git
	sudo apt install yasm
	```
2. 配置ANDROID_SDK和ANDROID_NDK环境变量。在用户Home目录按**“Ctrl+H”**显示隐藏文件，找到.bashrc并打开，添加以下语句到末尾：
	```
	#ANDROID SDK所在目录
	export ANDROID_SDK="/home/jeff-chou/develop/android-sdk-linux"
	#ANDROID NDK所在目录
	export ANDROID_NDK="/home/jeff-chou/develop/android-ndk-r13b"
	#加入到PATH路径
	PATH="$PATH:${ANDROID_SDK}:${ANDROID_NDK}"
	```
3. 在你想要存储ijkplayer源码的目录下打开终端，通过git命令获取源码：

	```
	git clone https://github.com/Bilibili/ijkplayer.git ijkplayer-android
	cd ijkplayer-android
	git checkout -B latest k0.7.9
	```

4. 配置ffmpeg编解码器格式：
	- 支持所有格式

	```
	cd config
	rm module.sh
	ln -s module-default.sh module.sh
	```
	- 支持常用格式（包括HEVC/H.265）

	```
	cd config
	rm module.sh
	ln -s module-lite-hevc.sh module.sh
	```
	- 支持常用格式（默认配置）

	```
	cd config
	rm module.sh
	ln -s module-lite.sh module.sh
	```
5. 编译ffmpeg：
	
	```
	./init-android.sh

	cd android/contrib
	./compile-ffmpeg.sh clean
	./compile-ffmpeg.sh all
	```
6. 编译ijkplayer：
	
	```
	cd ..
	./compile-ijk.sh all
	```

##鸣谢##
- http://blog.csdn.net/u010072711/article/details/51438871