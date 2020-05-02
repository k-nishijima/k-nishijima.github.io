+++
author = "k-nishijima"
published = 2013-05-05T18:00:00.001000+09:00
slug = "blogspot-2013-05-05-de-1-arduinojava"
tags = [ "study-group", "arduino",]
title = "\u30e2\u30cede\u30b5\u30d0\u30a4\u90e8 #1\u306b\u884c\u3063\u3066\u6765\u307e\u3057\u305f / Arduino\u3068Java\u306e\u7d20\u6575\u306a\u95a2\u4fc2"
+++
atnd登録したその日に注文して、ほとんど未開封のArduinoとワクドキの心をセットにして、5月3日に行われた[モノdeサバイ部
\#1](http://atnd.org/event/monobu1/0)に行って来ましたよ！  
ハッシュタグは
[\#monobu1](https://twitter.com/search?q=%23monobu1&src=typd)
、USTも最後の成果発表だけはしてたっぽいですがURLは不明です。。  

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-05-05-de-1-arduinojava-2013-05-03+13.16.20.jpg"><img src="../images/thumbnails/blogspot-2013-05-05-de-1-arduinojava-2013-05-03+13.16.20.jpg" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">MG Waveさんに集結した大きな子供達</td>
</tr>
</tbody>
</table>

詳細はatndを見てもらうと分かるんですが、この勉強会はArduino+Rubyでなんかやろうぜワークショップ、だと信じていたのですが、それは化けの皮で実体は  

<span style="font-size: large;">@mgwsuzukiさんが特製shield  
作ってくれたから、  
これでお前らハッカソンしろ！</span>

というワンダーランドでございました。  
  
<span id="more"></span>  
  

[![](../images/thumbnails/blogspot-2013-05-05-de-1-arduinojava-2013-05-05+12.36.33.JPG)](../images/blogspot-2013-05-05-de-1-arduinojava-2013-05-05+12.36.33.JPG)[![](../images/thumbnails/blogspot-2013-05-05-de-1-arduinojava-2013-05-05+12.49.03.JPG)](../images/blogspot-2013-05-05-de-1-arduinojava-2013-05-05+12.49.03.JPG)

  
驚きですよ、なんせこれですからね。僕が今お借りしているのはNo.3のナンバリングがされてるものです。鈴木さんがご自分で設計＆制作された基板の上に、赤外線入出力と、ボタン2個、おまけに光学センサー付きの憎いやつ。裏側の回路とハンダ付けの精細さがプロの仕事を物語っております。で、これを制御する6種類のコマンドを含んだスケッチもありますよ〜というお膳立て。ここまでの用意があれば、[PPM](http://en.wikipedia.org/wiki/Pulse-position_modulation)ってなに？(
ﾟдﾟ)ﾎﾟｶｰﾝ　な自分でも前半の講義を聞いてちょっと頑張ればナニモノカが出来る、という完璧な準備でした。オーガナイズしてくださった宮里さん＆鈴木さん、本当にありがとうございましたm(\_
\_)m  
  
機材の関係もありペアプロで、ということで僕は
[@sleepycat\_zzzさん](https://twitter.com/sleepycat_zzz)とペアになりました。いやー、おいらペアプロやったことなかったのでゴメンナサイ。なんか、どうやればいいのか全く分からず、各自モクモクな流れになっちゃいました。。  

何をやっていたかというと
------------------------

まず二人でPPMの勉強からはじめました。自宅から持ってきた[リモコンのデータの解析](https://docs.google.com/file/d/0B89-Np6LQHeFSDVONVdaMVBFV0k/edit?usp=sharing)は機器の都合上鈴木さんがやってくださったので、それを見ながらパルスをダンプしたものを解析して、16進数でどう表されているか？というデコードの部分をお勉強。赤外線受光部に向けて、リモコンのボタンを押すとパルスのOnOffのマイクロ秒がダンプが取れるので、それを[こんな感じでメモって](https://docs.google.com/spreadsheet/ccc?key=0As9-Np6LQHeFdHhXVlRsOXZKZ2lraUpMdTdxcnB0N0E&usp=sharing)みて、あーこういうコードを送ってるのね、というのをまず理解しました。アナログな入出力でデジタル信号を送ってるのがオモシレーって話ですね。それを元にデコーダを書こうかなと思ったのですが、僕は<span
style="font-size: xx-small;">(rubyで書くの面倒いという理由だけで)</span>断念し、結局これを@sleepycat\_zzzさんがあとでモクモクの時にチャレンジしていた模様です。  
  
その後、何をやろうか二人で一致した目的を相談することもなく(^^ゞ、だらっと各自モクモクし始めました。@sleepycat\_zzzさんは前述のデコーダの部分をRubyで、僕はシリアル制御のためのREST
APIを書きたかったので、<span
class="underline">JavaでArduinoを制御する</span>のを試し始めました。ええ、書き間違いではないです。「Ruby
x Arduino ワークショップ」に来ているにもかかわらず、Javaで書いてます:)  

### 以下MacのJDK1.6or1.7で動かすまでのメモです。

Javaでシリアル通信するために、[RXTX](http://rxtx.qbang.org/wiki/index.php/Main_Page)というライブラリをこちらから落として入れておいて下さい。READMEにあるように、jarとjnilibを/Library/Java/Extensions/を入れればいいのですが、どうやら64bitOSだとjnilibがうまく動かないっぽいので、[こちら](https://code.google.com/p/arduino/issues/detail?id=172)にあるファイルで上書きしちゃいました。この辺りは[こちらのブログ](http://cho-kotan.blogspot.jp/2012/10/javaavrmacjavaavr.html)を参考にさせて頂きました。  
Eclipseで、mavenプロジェクトでやるのであれば、pom.xmlのdependenciesに  

      <dependency>
       <groupid>org.rxtx</groupid>
       <artifactid>rxtx</artifactid>
       <version>2.1.7</version>
      </pre>

を追加すればgnu.io.\*クラス群を使ってコンパイルは出来るはずなのですが、この状態であんまり見たことのない「アクセス制限:
型 SerialPort は必須ライブラリー /Library/Java/Extensions/RXTXcomm.jar
で制限されているためアクセスできません」とかいうエラーが出て来ました。  
これは[こちらのブログ](http://blog.bitmeister.jp/?p=1486)でご指摘のとおり、ビルド・パスの構成
→ ライブラリータブのJREシステム・ライブラリーのアクセスルールを編集 →
追加で、「gnu/\*\*」を「アクセス許可」、などとすると上手くビルドできるようになると思います。  

Javaでシリアル通信
------------------

で、いくつかチョロチョロとシリアル通信のサンプルプログラムを書いて見たところ、上手く動いているようです。やったね。  
1回シリアルポートにつながれば、後は普通のストリームのプログラミングなので、例えばIRTXコマンドを書き込むならこんな感じで渡せます。  

         out.write("RTX".getBytes("ISO-8859-1"));
         out.flush();

（改行コードの有無とか、文字エンコーディングとか、毎回flushするのかしないのかなどモロモロ試行錯誤したのは省きます）  

JavaでRESTサーバを書く
----------------------

本当は、実験がてら[Ninja web
framework](http://www.ninjaframework.org/)で書こうと思ったのですが、何故かmvn
archetype:generate が上手く動いてくれず断念しましたorz  
代わりにJAX-RSでチョロチョロっとアノテーションを書いて、サーバはもちろんjettyを使ってRESTサーバを仕立てて、あるURLを叩くとLEDランプが付く！というところまで何とか滑りこみで成果発表に間に合わせることができました。これを公開すれば誰かがURLを叩くたびにLEDチカチカ完成！  

分かった、ソースはよ
--------------------

というツッコミがあることは覚悟しているのですが、すみません、なんかシリアル通信の部分が1回投げると掴んだままになってしまうという超致命的なバグなのか動作不良がありまして、サービスとしてはダメダメなのでもうちょっとちゃんと仕立ててからにします。  

今後の目標
----------

さて、今回shieldをお借りしている、と冒頭に書きましたが、そう、これワンオフの特注品なので今回は「次回のワークショップまで貸すからなんか作れ」ということでお借りして来ました。やりたい夢広がりんぐなのですが、取り敢えずいま頭に浮かんだものをここに箇条書きに書いておきます。  
  

-   取り敢えず家にあるリモコンのコードを全部デコードしてみる。でもリビングにMacを置くのが面倒だからこれはどうなのか。。
-   酔っ払って帰ってきたら、気づくと[こんな玩具](http://www.amazon.co.jp/gp/product/B009BL5B9Y?ie=UTF8&camp=1207&creative=8411&creativeASIN=B009BL5B9Y&linkCode=shr&tag=westisland-22&psc=1)を買っていたのでこいつを制御してみる。
-   仕事部屋がLED照明なので、照度センサを使って常に一定の光量になるように自動調光する、とか。これから夏に向けて自然光の光量との兼ね合いが難しくなってくるんですよねぇ。
-   テルミンじゃないけどシンセ作りたいなぁ、とか。

まあ、いろいろです。取り敢えず自分でシールド作れないとどうしようもない気がしますがひとまず妄想だけは。

懇親会
------

19時まであと15分だけどその間は一串50円でがあったりとか、鈴木さんがシリアルポートについて死ぬほど語るとか、SDNの話が飛び交うとか、いきなりOpenStackのデモが始まるとか、デバイスからクラウドまで相変わらず何だかカオスな懇親会でしたwww。2軒目は禁煙の素敵なバーに連れて行って頂きました。

<span
style="font-size: x-small;">とっても楽しかったんですが、2時頃に帰ってきて、犬が朝5時半に起こしに来て散歩に行くのだけは辛かったです(^^ゞ</span>

  

P.S.

あ、FPGAのお話伺うの忘れた。また今度、よろしくお願いします！
