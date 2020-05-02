+++
author = "k-nishijima"
published = 2010-01-01T12:22:00+09:00
slug = "blogspot-2010-01-01-ubuntu910-on-aspire-as1410"
tags = [ "as1410", "ubuntu",]
title = "Ubuntu9.10 on aspire as1410 \u305d\u306e\u5f8c"
+++
さて、昨年末買っちゃったaspire
as1410ですが、現在のワーク環境はこんな感じで落ち着きました。  
@ubuntumag vol.02のCDROMからインストールしたUbuntu 9.10
32bit版です（ちなみにオフィスのデスクトップ環境も同じく9.10で、あっちは64bit版）。  

[![](/images/blogspot/thumbnails/blogspot-2010-01-01-ubuntu910-on-aspire-as1410.png)](/images/blogspot/blogspot-2010-01-01-ubuntu910-on-aspire-as1410.png)  

<span style="font-size: x-small;">Compizも好調なり</span>  

  
で、悩みに悩んでいたハードディスクの不調（起動に異常に時間がかかったり、リブートすると不意にファイルが壊れたり）の原因がようやくはっきりしました。  
  

&amp;amp;lt;iframe name="tp106810" id="tp106810" width="500"
height="200" frameborder="0"
src="http://tweetpaste.thingamaweb.com/embed/106810/" style="overflow:
hidden; display: block; width: 500px; height:
200px;"&amp;amp;gt;&amp;amp;lt;p&amp;amp;gt;&amp;amp;lt;a
href="http://tweetpaste.thingamaweb.com/embed/106810/"
target="\_blank"&amp;amp;gt;View k\_nishijima&amp;amp;amp;rsquo;s
tweet&amp;amp;lt;/a&amp;amp;gt;&amp;amp;lt;/p&amp;amp;gt;&amp;amp;lt;/iframe&amp;amp;gt;

  
  
とつぶやいたところ、@WdWeaverさんが  
  

&amp;amp;lt;iframe name="tp106811" id="tp106811" width="500"
height="200" frameborder="0"
src="http://tweetpaste.thingamaweb.com/embed/106811/" style="overflow:
hidden; display: block; width: 500px; height:
200px;"&amp;amp;gt;&amp;amp;lt;p&amp;amp;gt;&amp;amp;lt;a
href="http://tweetpaste.thingamaweb.com/embed/106811/"
target="\_blank"&amp;amp;gt;View WdWeaver&amp;amp;amp;rsquo;s
tweet&amp;amp;lt;/a&amp;amp;gt;&amp;amp;lt;/p&amp;amp;gt;&amp;amp;lt;/iframe&amp;amp;gt;

  
  
と教えてくださったのでおおおそうなのか！とNCQについて調べたところ、うちのas1410ではBIOSの設定でSATAのモードをAHCIからIDEに変えたところ、すこぶる機嫌が良くなってくれました。今のところ起動は30秒弱で、ファイルが壊れることも当然ありません（予備的にext3にしておいたのはたぶん関係ないと思います）。NCQの状態はこんな感じ。  
  
west@bang-doll:~$ dmesg | grep depth  
\[ 1.715228\] ata1.00: 488397168 sectors, multi 16: LBA48 NCQ (depth
0/32)  
※ググるとよく出てくる「sudo echo 1 &gt;
/sys/block/sda/device/queue\_depth」という手はうちでは使えませんでした。。。  
  
  
以前持っていたaspire
oneのXPから完全移行を試みているんですが、流石にダイビングコンピュータと繋ぐUSBインターフェイスキットはwineでは動かず（USBのドライバが入らない。。。）、これだけのためにvirtualbox入れないといかんかな、と思っているところです。  
あとはPicasaも動くし、SDカードも問題ないし、順調に移行してます。  
  
  
あ、あとはサスペンド/ハイバネートだねー（涙）
