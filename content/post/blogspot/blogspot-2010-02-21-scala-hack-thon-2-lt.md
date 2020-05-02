+++
author = "k-nishijima"
published = 2010-02-21T13:51:00.001000+09:00
slug = "blogspot-2010-02-21-scala-hack-thon-2-lt"
tags = [ "study-group", "scala", "tightbell",]
title = "Scala Hack-a-thon #2 \u306b\u884c\u3063\u3066\u304d\u307e\u3057\u305f\uff06LT\u3067\u8a71\u3057\u3066\u304d\u307e\u3057\u305f"
+++
昨日になりますが、[@yuroyoro](http://twitter.com/yuroyoro)さん主催の2月20日に行われたScala
Hack-a-thon \#2 に行ってきました！  

-   <http://d.hatena.ne.jp/yuroyoro/20100219/1266581453>
-   [\#scalahackのまとめ](http://togetter.com/li/6510)はこちらです

会場を提供していただいた日本オラクル様に感謝です！部屋までの誘導はちと考える必要がありましたが、椅子は座りやすいし、ドリンクサーバもあるし、最強のファシリティです!!!ありがとうございました！

今後も勉強会などに積極的に場所を提供していきたいとのことですので、場所に困ったことがあったら相談に乗ってくれると思います。

  

さて、発火村の内容はといいますと、午前中は yuroyoroさんがScala
hack-a-thon
\#1の資料を使っての解説、午後もみんなで沈黙大会。。。じゃなくて各自黙々とscalaの(?)コーディングと相成りました。  
  
んで、僕は何をしていたかというと、初めてのScalaの題材何にしよう？と思ったんですが、yuroyoroさんの資料とコップ本を片手に[Termtter](http://termtter.org/)みたいなのをScalaでやってました。  
具体的にはtwitterのタイムラインを取ってきて、XMLをパースして、libnotifyに投げる、っていうのを作ってました。LTの寸前にやっと動きましたのでもうちょっと整理したらまた公開します。  
コレクションの操作が全く良くわからんので、沈黙を破りyuroyoroさんに色々と質問してしまいました。Scala難しい。。。習うより慣れろでいっぱい書くしかないですね。  
  
ところで、libnotifyってのは、Macで言うところのgrawlみたいなものです。Windowsにも同じようなのはあると思うんですが良くわかりません。。。  
  
$ sudo apt-get install libnotify-bin  
でインストールしておくと、  
$ notify-send "hello"  

で
notifyのダイアログが出せるんですが、これをScalaでやりたかったわけです。ついでに言うと、間に合えばこれを出しっぱなしにしてLTやりたかったんですが。。。残念。この試みはまた今度と言うことで。

-   libnotifyのJavaバインディングはこちら <http://java-gnome.sourceforge.net/>
-   growlはたぶん <http://growl.info/documentation/developer/>　この辺からJavaSupportが落とせるかなと思います（まだ見ていません）

夕方、途中から突然上がったブラインド越しに美しい夜景を見ながら、LTでちょっと喋ってきました。以下に資料を張っておきます。  
  

  
  
本当は、この後GAEの本番にデプロイしてっていうデモをするつもりだったんですが、なんと自分のUbuntuがプロジェクターにつながらず（汗）。結局上の資料をPDFにしてyuroyoroさんのMacを借りてプレゼンしました。いやーホント焦りました。お陰で(?)プレゼンも緊張してしまいなに喋ってるか良くわからなかったかもしれません、ゴメンナサイ。。。  
  
この後、19時からの懇親会では色々とディープな話を伺えて楽しかったです。yuroyoroさんをはじめ、参加者の皆様、ありがとうございましたー！
