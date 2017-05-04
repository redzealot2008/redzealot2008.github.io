---
title: Ubuntu手动安装或更新VMware Tools
date: 2017-05-03 21:41:58
tags:
---

## 安装环境 ##
- VMware Workstation 12 Pro
- Ubuntu 17.04 64位系统

## 安装步骤 ##
1. 开启虚拟机。
2. 在VMware Workstation菜单栏选择**“虚拟机 > 安装 VMware Tools”**，等待CD/DVD Drive挂载VMware Tools，如下图所示：
![](http://onmer39jj.bkt.clouddn.com/image/Screenshot%20from%202017-05-03%2005-10-12.png)
3. 右键点击**VMwareTools tar.gz**压缩包，选择**“Extract To...”**解压缩到用户目录中，我这里选择了Downloads。
![](http://onmer39jj.bkt.clouddn.com/image/Screenshot%20from%202017-05-03%2005-11-24.png)
![](http://onmer39jj.bkt.clouddn.com/image/Screenshot%20from%202017-05-03%2005-13-25.png)
4. 进入**vmware-tools-distrib**目录，右键点击空白处选择**“Open in Terminal”**打开终端
![](http://onmer39jj.bkt.clouddn.com/image/Screenshot%20from%202017-05-03%2005-14-35.png)
5. 安装VMware Tools需要超级用户权限，使用以下命令安装：

	```
	sudo ./vmware-install.pl
	```
	输入登录密码，一路回车即可。

	**提示：**安装过程中可能会出现以下语句，询问ifconfig所在位置。
	```
	What is the location of the "ifconfig" program on your machine?
	```
	可以再打开一个终端窗口使用**“Whereis”**命令查看：
	```
	Whereis ifconfig
	```
	返回结果如果是：
	```
	ifconfig:
	```
	说明系统中没有ifconfig，可以使用以下命令安装：
	```
	sudo apt install net-tools
	```
	返回结果如果是：
	```
	ifconfig: /sbin/ifconfig  /usr/share/man/man8/ifconfig.8.gz
	```
	说明ifconfig位置就在**/sbin/ifconfig**