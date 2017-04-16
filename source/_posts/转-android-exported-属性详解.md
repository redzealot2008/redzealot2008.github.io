---
title: '[转]android:exported 属性详解'
tags: []
date: 2017-04-11 11:27:11
---

[转载出处：[http://blog.csdn.net/watermusicyes/article/details/46460347](http://blog.csdn.net/watermusicyes/article/details/46460347)]

昨天在用360扫描应用漏洞时，扫描结果，出来一个[Android](http://lib.csdn.net/base/android "Android知识库"):exported属性，其实之前根本不知道这个属性，更不知道这个属性用来干嘛的，详情见下图：&nbsp;

![这里写图片描述](http://img.blog.csdn.net/20150611173912982)&nbsp;

![这里写图片描述](http://img.blog.csdn.net/20150611173929264)

因此，查了官方API，学习了一下这个属性!

* * *

android:exported 是Android中的四大组件 Activity，Service，Provider，Receiver 四大组件中都会有的一个属性。

总体来说它的主要作用是：是否支持其它应用调用当前组件。&nbsp;

默认&#20540;：如果包含有intent-filter 默认&#20540;为true; 没有intent-filter默认&#20540;为false。

下面来详细的了解一下四大组件中的这个属性：

1、先来看：Activity中的：

<pre class="prettyprint" name="code" style="white-space: nowrap; word-wrap: break-word; box-sizing: border-box; position: relative; overflow-y: hidden; overflow-x: auto; margin-top: 0px; margin-bottom: 1.1em; font-family: 'Source Code Pro', monospace; padding: 5px 5px 5px 60px; font-size: 14px; line-height: 1.45; word-break: break-all; color: rgb(51, 51, 51); border: 0px solid rgb(136, 136, 136); border-radius: 0px; background-color: rgba(128, 128, 128, 0.0470588);">`&lt;activity
          ……
          android:exported=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
          ……
/&gt;
`

*   1
*   2
*   3
*   4
*   5
*   6

*   1
*   2
*   3
*   4
*   5
*   6</pre>

![这里写图片描述](http://img.blog.csdn.net/20150611174107183)

意思如下：

在Activity中该属性用来标示：当前Activity是否可以被另一个Application的组件启动：true允许被启动；false不允许被启动。

如果被设置为了false，那么这个Activity将只会被当前Application或者拥有同样user ID的Application的组件调用。

exported 的默认&#20540;根据Activity中是否有intent filter 来定。没有任何的filter意味着这个Activity只有在详细的描述了他的class name后才能被唤醒 .这意味着这个Activity只能在应用内部使用，因为其它application并不知道这个class的存在。所以在这种情况下，它的默认&#20540;是false。从另一方面讲，如果Activity里面至少有一个filter的话，意味着这个Activity可以被其它应用从外部唤起，这个时候它的默认&#20540;是true。

其实，不只有这个属性可以指定Activity是否暴露给其它应用，也可以使用permission来限制外部实体唤醒当前Activity（详情见permission属性）

2、Service中的：

<pre class="prettyprint" name="code" style="white-space: nowrap; word-wrap: break-word; box-sizing: border-box; position: relative; overflow-y: hidden; overflow-x: auto; margin-top: 0px; margin-bottom: 1.1em; font-family: 'Source Code Pro', monospace; padding: 5px 5px 5px 60px; font-size: 14px; line-height: 1.45; word-break: break-all; color: rgb(51, 51, 51); border: 0px solid rgb(136, 136, 136); border-radius: 0px; background-color: rgba(128, 128, 128, 0.0470588);">`&lt;service android:enabled=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
         android:exported=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
         android:icon=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;drawable resource&quot;</span>
         android:isolatedProcess=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
         android:label=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string resource&quot;</span>
         android:name=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span>
         android:permission=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span>
         android:process=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span> &gt;
    . . .
&lt;/service&gt;
`

*   1
*   2
*   3
*   4
*   5
*   6
*   7
*   8
*   9
*   10
*   11

*   1
*   2
*   3
*   4
*   5
*   6
*   7
*   8
*   9
*   10
*   11</pre>

![这里写图片描述](http://img.blog.csdn.net/20150611174223699)

意思如下：&nbsp;

该属性用来标示，其它应用的组件是否可以唤醒service或者和这个service进行交互：true可以，false不可以。如果为false，只有同一个应用的组件或者有着同样user ID的应用可以启动这个service或者绑定这个service。

默认&#20540;根据当前service是否有intent filter来定。如果没有任何filter意味着当前service只有在被详细的描述class name后才会被唤醒。这意味这当前service只能在应用内部使用（因为其它应用不知道这个class name）.所以在这种情况下它的默认&#20540;为 false.从另一方面讲，如果至少有一个filter的话那么就意味着这个service可以被外部应用使用，这种情况下默认&#20540;为true。

其实，不只有这个属性可以指定service是否暴露给其它应用。你也可以使用permission来限制外部实体唤醒当前service（详情见permission属性）

3、Provider中的：

<pre class="prettyprint" name="code" style="white-space: nowrap; word-wrap: break-word; box-sizing: border-box; position: relative; overflow-y: hidden; overflow-x: auto; margin-top: 0px; margin-bottom: 1.1em; font-family: 'Source Code Pro', monospace; padding: 5px 5px 5px 60px; font-size: 14px; line-height: 1.45; word-break: break-all; color: rgb(51, 51, 51); border: 0px solid rgb(136, 136, 136); border-radius: 0px; background-color: rgba(128, 128, 128, 0.0470588);">`&lt;provider android:authorities=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;list&quot;</span>
          android:enabled=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
          android:exported=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
          android:grantUriPermissions=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
          android:icon=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;drawable resource&quot;</span>
          android:initOrder=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;integer&quot;</span>
          android:label=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string resource&quot;</span>
          android:multiprocess=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
          android:name=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span>
          android:permission=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span>
         android:writePermission=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span> &gt;
    . . .
&lt;/provider&gt;
`

*   1
*   2
*   3
*   4
*   5
*   6
*   7
*   8
*   9
*   10
*   11
*   12
*   13
*   14

*   1
*   2
*   3
*   4
*   5
*   6
*   7
*   8
*   9
*   10
*   11
*   12
*   13
*   14</pre>

![这里写图片描述](http://img.blog.csdn.net/20150611174327415)

意思如下：&nbsp;

当前内容提供者是否会被其它应用使用：&nbsp;

true: 当前提供者可以被其它应用使用。任何应用可以使用Provider通过URI 来获得它，也可以通过相应的权限来使用Provider。

false:当前提供者不能被其它应用使用。设置Android：exported=“false”来限制其它应用获得你应用的Provider。只有拥有同样的user ID 的应用可以获得当前应用的Provider。

当Android sdk 的最小版本为16或者更低时他的默认&#20540;是true。如果是17和以上的版本默认&#20540;是false。

可以通过Android：exported=“fasle” 和 permission来限制当前应用Provider是否会被其它应用获取。

4、receiver中的：

<pre class="prettyprint" name="code" style="white-space: nowrap; word-wrap: break-word; box-sizing: border-box; position: relative; overflow-y: hidden; overflow-x: auto; margin-top: 0px; margin-bottom: 1.1em; font-family: 'Source Code Pro', monospace; padding: 5px 5px 5px 60px; font-size: 14px; line-height: 1.45; word-break: break-all; color: rgb(51, 51, 51); border: 0px solid rgb(136, 136, 136); border-radius: 0px; background-color: rgba(128, 128, 128, 0.0470588);">`&lt;receiver android:enabled=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
          android:exported=[<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;true&quot;</span> <span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">| &quot;</span>false<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;]</span>
          android:icon=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;drawable resource&quot;</span>
          android:label=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string resource&quot;</span>
          android:name=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span>
          android:permission=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span>
          android:process=<span class="hljs-string" style="color: rgb(0, 136, 0); box-sizing: border-box;">&quot;string&quot;</span> &gt;
    . . .
&lt;/receiver&gt;
`

*   1
*   2
*   3
*   4
*   5
*   6
*   7
*   8
*   9
*   10

*   1
*   2
*   3
*   4
*   5
*   6
*   7
*   8
*   9
*   10</pre>

![这里写图片描述](http://img.blog.csdn.net/20150611174415484)

意思如下：&nbsp;

当前broadcast Receiver 是否可以从当前应用外部获取Receiver message 。true，可以；false 不可以。如果为false ,当前broadcast Receiver 只能收到同一个应用或者拥有同一 user ID 应用发出广播。

默认&#20540;根据当前 broadcast Receiver 是否包含intent filter来定。如果没有任何的filter的话意味着只有在被详细的描述了class name的情况下才会被唤起。这意味着当前Receiver只能在应用内部被使用（因为其它应用不知道这个类的存在。）在这种情况下，默认&#20540;是false。如果至少包含一个filter意味着当前broadcast Receiver 将会收到来自系统或者其它应用的广播，所以这个时候默认&#20540;是true。

不只有这个属性可以指定broadcast Receiver 是否暴露给其它应用。你也可以使用permission来限制外部应用给他发送消息。

在上文中提到的两个概念：user ID 和 permission 在网上找见了两篇不错的文章：&nbsp;

1、[Android中startActivity中的permission检测与UID机制](http://yelinsen.iteye.com/blog/977683)&nbsp;

2、[Android Permission 机制](http://yelinsen.iteye.com/blog/977548)

            <div>
                作者：redzealot2007 发表于2017/4/11 11:27:11 [原文链接](http://blog.csdn.net/redzealot2007/article/details/70049535)
            </div>
            <div>
            阅读：23 评论：0 [查看评论](http://blog.csdn.net/redzealot2007/article/details/70049535#comments)
            </div>