---
title: '[原]一脸懵逼也能使用hexo搭建github博客'
tags: []
date: 2017-03-29 14:10:26
---

这两天在网上浏览程序猿技术相关的资讯以及一些大神的技术博客文章，hexo这个词数次进入我的视线，于是我到网上查找了hexo相关的信息。

## hexo是什么？

> [Hexo 是一个简单的、轻量的、基于Node的一个静态博客框架，可以方便的生成静态网页托管在Github和Heroku上，引用Hexo作者 @tommy351 的话：快速、简单且功能强大的 Node.js 博客框架。A fast, simple &amp; powerful blog framework, powered by Node.js。](http://www.tuicool.com/articles/ueI7naV/)

正好我之前也经常上Github去学习一些开源项目，于是我也想尝试用hexo在Github上搭建一个自己的个人技术博客。但以前没弄过，一脸懵逼怎么办，首先上[hexo官方网站](https://hexo.io/)看使用文档（hexo官方网站默认进去是英文，可以在页面右上方 ![](http://ontjktddg.bkt.clouddn.com/image/360%E6%88%AA%E5%9B%BE20170329141155243.jpg?imageView2/0/format/webp/interlace/1/q/75|imageslim)  选择中文），然后还参考了一些已经成功搭建好hexo博客的大神们的文章。以下就是详细步骤以及图示：

## 安装环境

*   安装Git
    下载并安装 [Git](https://git-scm.com/downloads)。
*   安装Node.js
    下载并安装 [Node.js](https://nodejs.org/zh-cn/download/)。

## 创建Github仓库

*   登录[Github](https://github.com/)，没有Github账号先注册。
*   点击页面右上方   ![](http://ontjktddg.bkt.clouddn.com/image/QQ%E6%88%AA%E5%9B%BE20170329183459.png?imageView2/0/format/webp/interlace/1/q/75|imageslim)  选择New repository，填好仓库名称，格式是github用户名.github.io，然后点击Create repository。
    ![](http://ontjktddg.bkt.clouddn.com/image/QQ%E6%88%AA%E5%9B%BE20170329184127.png?imageView2/0/format/webp/interlace/1/q/75|imageslim)

## 生成SSH密钥

*   在任意文件目录单击鼠标右键，选择Git Bash，使用ssh命令生成密钥。

<pre><font color="red">ssh-keygen -t rsa -C "Github的注册邮箱地址"</font>
</pre>

*   按三次回车等密钥生成完毕，会在C:\Users\计算机用户名.ssh目录下生成id_rsa和id_rsa.pub两个文件。

## Github配置SSH密钥

*   打开id_rsa.pub，复制里面的内容，进入[https://github.com/settings/ssh](https://github.com/settings/ssh)，New SSH Key，把内容粘贴到Key文本框里，然后点击Add SSH Key。
*   验证SSH Key：

<pre><font color="red">$ ssh -T git@github.com</font>
</pre>

返回以下语句说明SSH Key配置好了。

<pre><font color="red">The authenticity of host 'github.com (192.30.253.112)' can't be established.
RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added 'github.com,192.30.253.112' (RSA) to the list of known hosts.
Hi redzealot2008! You've successfully authenticated, but GitHub does not provide shell access.</font>
</pre>

*   初始化本地git仓库

<pre><font color="gray">//设置Git的user name和email</font>
<font color="red">$ git config --global user.name "redzealot2008"</font>
<font color="red">$ git config --global user.email "Github的注册邮箱地址"</font>
<font color="gray">//在本地的hexo init生成的文件夹中初始化git仓库</font>
<font color="red">$ git init</font>
<font color="gray">//将本地仓库和远程仓库连接（这一步骤可以不做）</font>
<font color="red">$ git remote add origin git@github.com:redzealot2008/redzealot2008.github.io.git </font>
</pre>

做完以上这些步骤，说明你的仓库可以使用ssh方式来上传下载代码，而不需要输入用户名和密码了

## 安装Hexo

*   在任意文件目录单击鼠标右键，选择Git Bash，使用npm命令即可下载安装Hexo。

<pre><font color="gray">//全局安装hexo</font>
<font color="red">$ npm install -g hexo-cli</font>
</pre>

*   安装过程需要一点时间，可使用hexo命令确认是否安装成功。
    ![](http://ontjktddg.bkt.clouddn.com/image/QQ%E6%88%AA%E5%9B%BE20170329160651.png?imageView2/0/format/webp/interlace/1/q/75|imageslim)

## 创建Hexo博客文件夹

*   在你喜欢的目录下创建Hexo博客文件夹（如：E:\hexo-github）。

## 初始化Hexo博客

*   在Git Bash里使用以下命令：

<pre><font color="gray">//进入Hexo博客文件夹</font>
<font color="red">$ cd e:\hexo-github</font>
<font color="gray">/初始化Hexo博客</font>
<font color="red">$ hexo init</font>
<font color="gray">//安装依赖包</font>
<font color="red">$ npm install</font>
</pre>

初始化完成后Hexo博客文件夹里的文件如下： 

![](http://ontjktddg.bkt.clouddn.com/image/QQ%E6%88%AA%E5%9B%BE20170329180502.png?imageView2/0/format/webp/interlace/1/q/75|imageslim)

    .
    ├── _config.yml #全局配置文件
    ├── package.json #应用程序的信息
    ├── scaffolds #模板
    ├── source #博客正文和其他源文件，404、favicon、CNAME
    |   ├── _drafts #草稿
    |   └── _posts #文章
    └── themes #主题`</pre>

*   hexo常用命令：

    <pre class="prettyprint">`hexo help <span class="hljs-comment">#查看帮助</span>
    hexo init <span class="hljs-comment">#初始化一个目录</span>
    hexo new <span class="hljs-string">"postName"</span> <span class="hljs-comment">#新建文章</span>
    hexo new page <span class="hljs-string">"pageName"</span> <span class="hljs-comment">#新建页面</span>
    hexo generate <span class="hljs-comment">#生成网页，可以在 public 目录查看整个网站的文件</span>
    hexo server <span class="hljs-comment">#本地预览，'Ctrl+C'关闭</span>
    hexo deploy <span class="hljs-comment">#部署.deploy目录</span>
    hexo clean <span class="hljs-comment">#清除缓存，**强烈建议每次执行命令前先清理缓存，每次部署前先删除 .deploy 文件夹**</span>
    简写：
    hexo n == hexo new
    hexo g == hexo generate
    hexo s == hexo server
    hexo d == hexo deploy`</pre>

    ## 配置Hexo博客

*   打开Hexo博客文件夹里的_config.yml全局配置文件，主要修改以下参数：

    <pre class="prettyprint">`# Site
    title: 剑若成风的成长日志
    subtitle: 新的开始，回归自我
    description: 剑若成风的个人技术博客
    author: redzealot2008
    language: zh-CN
    timezone: Asia/Shanghai

    # URL
    url: http://redzealot2008.com

    # Deployment
    deploy:
      type: git
      # 之前在Github上创建的仓库地址
      repo: https://github.com/redzealot2008/redzealot2008.github.io.git
      branch: master`</pre>

    > <font color="red">注意：每个参数冒号后面要有一个空格。</font>

    ## 新建文章

*   hexo new “标题”    在 _posts 目录下会生成文件标题.md

    <pre class="prettyprint">`<span class="hljs-symbol">title:</span> <span class="hljs-constant">Hello</span> <span class="hljs-constant">World</span>
    <span class="hljs-symbol">date:</span> <span class="hljs-number">2015</span>-<span class="hljs-number">07</span>-<span class="hljs-number">30</span> <span class="hljs-number">07</span><span class="hljs-symbol">:</span><span class="hljs-number">56</span><span class="hljs-symbol">:</span><span class="hljs-number">29</span> <span class="hljs-comment">#发表日期，一般不改动</span>
    <span class="hljs-symbol">categories:</span> hexo <span class="hljs-comment">#文章文类</span>
    <span class="hljs-symbol">tags:</span> [hexo,github] <span class="hljs-comment">#文章标签，多于一项时用这种格式</span>
    ---
    正文，使用<span class="hljs-constant">Markdown</span>语法书写

*   编辑完后保存，hexo server 预览。

## hexo部署

*   在Git Bash使用以下命令即可完成部署。

<pre><font color="gray">//生成静态文件</font>
<font color="red">hexo generate</font>
<font color="gray">//安装 hexo-deployer-git</font>
<font color="red">$ npm install hexo-deployer-git --save</font>
<font color="gray">//部署到Github</font>
<font color="red">hexo deploy</font>
</pre>

以下提示说明部署成功

<pre><font color="red">[info] Deploy done: git</font>
</pre>

*   hexo deploy报错could not read Username for ‘[https://github.com](https://github.com)‘，打开_config.yml修改repo地址：

<pre><font color="gray">//方案1.在github.com前面添加Github注册的用户名</font>
<font color="red">https://redzealot2008@github.com/redzealot2008/redzealot2008.github.io.git</font>
<font color="gray">//方案2.使用SSH地址</font>
<font color="red">git@github.com:redzealot2008/redzealot2008.github.io.git</font>
</pre>

## 鸣谢

*   [手把手教你建github技术博客](http://www.jianshu.com/p/701b1095da11)
*   [20分钟教你使用hexo搭建github博客](http://www.jianshu.com/p/e99ed60390a8)
*   [解决用Hexo和GitHub搭建博客时hexo d命令报错问题](http://blog.csdn.net/Greenovia/article/details/60576985)
            <div>
                作者：redzealot2007 发表于2017/3/29 14:10:26 [原文链接](http://blog.csdn.net/redzealot2007/article/details/68064298)
            </div>
            <div>
            阅读：15 评论：0 [查看评论](http://blog.csdn.net/redzealot2007/article/details/68064298#comments)
            </div>