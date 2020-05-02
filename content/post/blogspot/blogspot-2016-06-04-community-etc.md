+++
author = "k-nishijima"
published = 2016-06-04T09:39:00+09:00
slug = "blogspot-2016-06-04-community-etc"
tags = [ "hackers-champloo", "study-group",]
title = "\u3053\u3053\u6700\u8fd1\u306e\u30b3\u30df\u30e5\u30cb\u30c6\u30a3\u6d3b\u52d5\u5831\u544a"
+++
仕事でブログ書いてると、本当に個人ブログとか書かなくなりますね。。。  
  
ということで久しぶりに書いてみました。ここ最近登壇させて頂いた資料とか、もうあと3週間を切ったハッカーズチャンプルー2016の宣伝などです。  

第2回Golang勉強会 in Okinawa
============================

<a href="https://okinawa-go.doorkeeper.jp/" class="uri">https://okinawa-go.doorkeeper.jp/</a>  
  
「沖縄でgoやろうぜ！」という有志が集まって始めた okinawa.go ですが、
先日5月21日に第2回勉強会を開催しました。「ブログを書くまでが勉強会」といつも口酸っぱくいいつつ、自分では全然書いていなかったので、まずこれを書いてみます。  
  
第2回は「すごい広島」方式でやることを宣言して、お菓子を食べながらモクモク各自作業をする、というアットホームな感じでやりました。真剣に、でもゆるく1つのテーマに集中して勉強するのは、社会人にとってなかなか時間が取りづらいものですが、こういうふうに集まってやると集中できていい感じです。参加者の皆様からは  

-   「みんなシーンとしてやってて、楽しいの僕だけかと思ってました！」
-   「久々にコード書けて良かったです！」

などなどの声が上がっておりました。  
みんなのやったことは[Issues](https://github.com/okinawa-go/okinawa-go.github.io/issues?q=is%3Aissue+is%3Aclosed)にありますので、よろしければ見てみてください。  
  
さて、西島は何をやっていたかというと、2点ありまして、1つは
<a href="http://okinawa-go.github.io/" class="uri">http://okinawa-go.github.io/</a>
を hugo
で構築してました（まだ[Issueクローズしてない](https://github.com/okinawa-go/okinawa-go.github.io/issues/1)・・・）。仕事で鬼のように使っている
hugo で、速攻（1時間弱くらい？）で GitHub pages
にコンテンツをアップしました。 [hugo](https://gohugo.io/) は golang
で書かれている静的Webコンテンツ生成エンジンです(RubyにおけるJekyllみたいなもん)。  
  
本当はどういじったかという話をチュートリアル的にまとめよう、と思っていたのですが↓の資料を作っていた関係で時間がなく、断念しました。hugo
は微妙いところも多数ありつつもかなりイケてるツールなので、これはこれでまた別途共有したいと思ってます。  
  
2点目は、「Helloworldの次の一歩」というLT資料を作っていました。以下に貼ります。  
  

  

**[Helloworld次の一歩](https://www.slideshare.net/KoichiroNishijima/helloworld-62250194 "Helloworld次の一歩")**
from **[Koichiro
Nishijima](https://www.slideshare.net/KoichiroNishijima)**

勉強会の最後にこの資料を発表しつつ、みんなで「あーだーこーだー」いいながら知見を共有しました。  
そういえばその後の展開ですが、初めてお客様先に導入したgoで書かれたツールは、無事元気に動いているようです。良かったよかった(^^)  

第1回Golang勉強会 in Okinawa
============================

2016年は3月19日に行われた第1回の報告ブログは、[木下さん](http://kazuminkun.hatenablog.com/entry/2016/03/27/190114)が詳細にまとめてくださっているのでリンクを貼ってお茶を濁そう(^\_^;)  
  
ちなみに第1回でLT（というほど短くなかった。。。）した資料も貼っておきます。若い学生さんたちが多数来そうだったので、こんな話をしてみました。みんな熱くなって、なかなかに好評でした(^^)  
  

  

**[楽しいエンジニアライフを送るために重要なこと](https://www.slideshare.net/KoichiroNishijima/ss-59757686 "楽しいエンジニアライフを送るために重要なこと")**
from **[Koichiro
Nishijima](https://www.slideshare.net/KoichiroNishijima)**

\[勉強勉強会\]本当にいい結果を出す勉強法について考える会
========================================================

第1階と第2回のあいだの4月23日には、なんと [Java Küche
の勉強勉強会](http://java-kuche.org/posts/studystudy)
で登壇させていただきました。Java Küche
は沖縄でもっとも歴史と伝統あるコミュニティのひとつでです。どうやら上の「楽しいエンジニアライフを送るために重要なこと」を見てお声が掛かったようでです。まさか登壇の機会をいただけるとは思っても見ませんでしたので、感謝感激＆恐縮でした(^^;)  
  
「楽しく仕事をするために必要な栄養素」と題した資料はこちらです。これまた学生の方が多く参加されていたので、少しでも何か持ち帰ってもらえたのなら嬉しいなぁ、というところです。  
  

  

**[楽しく仕事をするために必要な栄養素](https://www.slideshare.net/KoichiroNishijima/ss-61260166 "楽しく仕事をするために必要な栄養素 ")**
from **[Koichiro
Nishijima](https://www.slideshare.net/KoichiroNishijima)**

JAWS-UG沖縄 Cloud on the BEACH 2016
===================================

で、更に勉強勉強会の翌週の4月29日ですね、JAWS-UG沖縄の定番イベント
[Cloud on the BEACH
2016](https://www.r3it.com/blog/aws/cloud-on-the-beach-2016/)
も無事終わりました。こちらは報告を会社ブログに書いてありますので、そこにリンクを貼っておこう。  
  
いい天気でしたが反省することも多かったビーチパーティ、来年はなんとかしたいと思いますm(\_
\_)m  

ハッカーズチャンプルー2016はもうすぐだ！だ！だ！
================================================

[![](/images/blogspot/thumbnails/blogspot-2016-06-04-community-etc-hc_logo_577x166.png)](/images/blogspot/blogspot-2016-06-04-community-etc-hc_logo_577x166.png)

<a href="http://hackers-champloo.org/2016/" class="uri">http://hackers-champloo.org/2016/</a>  
さて、沖縄ITエンジニアのお祭りであるハッカーズチャンプルー2016が、もう3週間後に迫ってきました。  
  
事前の仕込みも大部分は終わり、あとはワクワクドキドキの本番まで指折り数える感じになってきました。スポンサーになって頂いた企業の皆様、運営を支えて下さるボランティアのコアメンバーの皆様に感謝です。当日ボランティアに名乗りを上げて頂いた皆様は、当日よろしくお願いします！！  
  
このプログラムを見ても、もうワクドキしかないですね！  
<http://hackers-champloo.org/2016/program.html>  
メインセッション＆ライトニングトークも盛り沢山です。  
  
イベントは6月22日からの開発合宿からスタートです。皆様楽しみましょう！
