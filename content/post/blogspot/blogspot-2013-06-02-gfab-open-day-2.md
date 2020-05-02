+++
author = "k-nishijima"
published = 2013-06-02T22:17:00.003000+09:00
slug = "blogspot-2013-06-02-gfab-open-day-2"
tags = [ "study-group", "arduino",]
title = "gFab Open Day + \u30e2\u30ce\u30d3\u30b8\u90e8 #2\u306b\u884c\u3063\u3066\u304d\u305f"
+++
さて、今日は[gFab Open Day + モノビジ部
\#2](http://atnd.org/event/monobu2)に行って来ましたよ。今回もMG
Wave様にてお世話になりました。モノdeサバイ部から名前は変わりましたが第2回です。あ、すみません、写真が一枚もないので様子は[ハッシュタグ\#monobu2](https://twitter.com/search?q=%23monobu2&src=typd)あたりでご確認下さい。  
  
さて、今回はもくもく会が基本だったので、自分もアレコレ横道にそれつつもくもくしてました。  

<span id="more"></span>何をしていたか？
---------------------------------------

最後の振り返りの時に告知しかしなかったので、今日は何をやっていたのかを報告します。一応、赤外線リモコンヘリで遊んでた！ってだけじゃないのです(^^ゞ  
取り敢えず、僕もカッティングプロッタを使いたかったので、元データをいかに手抜きをして作るか？ということに情熱を燃やしておりました。以下色々やったことメモ。  

### 上手いことすればPotraceで写真の輪郭が取れるかもしれない

と思いまして、[Potrace](http://potrace.sourceforge.net/)を試してみました。このツールは昔で言うところのAdobe
Streamlineともいうべきツールで、色んなOSに対応しているラスタ→ベクタ変換ツールです。こいつはかなりイケてる！と思ったのですが、入力ファイルがBMP形式しかサポートしていませんでした。ナニソレここはMacな世界。。。  

### ということでimagemagickの出番

Mac環境でbmp形式への出力をサポートしている画像取扱ソフトが案外無いのは驚きました。プレビューとかで簡単に書き出せるのかな？と思いきや駄目で、他の手持ちのフリーソフトでもなかなかサポートしているものがありませんでした。  
結局、Unix環境での画像処理では伝家の宝刀、imagemagickさんにご登場頂きました。  

    brew install imagemagick

でインストールは完了、pngからbmpへの変換は  

    convert dogs.png bmp3:dogs.bmp

てな感じで。  

### そしてPotraceの実力は如何に

ようやく作ったbmpファイルを使ってptraceをかけると、こんな感じになります。

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-06-02-gfab-open-day-2-dogs.jpg"><img src="../images/thumbnails/blogspot-2013-06-02-gfab-open-day-2-dogs.jpg" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">この写真が...</td>
</tr>
</tbody>
</table>

  

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-06-02-gfab-open-day-2-dogs.png"><img src="../images/thumbnails/blogspot-2013-06-02-gfab-open-day-2-dogs.png" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">こんな感じになる（実際には全部ベジェ）</td>
</tr>
</tbody>
</table>

これはこれで凄く劇的な感じではありますが。。。これではあまりにこまかすぎそのままカッティングプロッタには流せません。

困って別なツールに手を出す
--------------------------

絵心のある方なら、こんなことする前に写真からラインをトレースして、良い感じのデザインを創るのだと思いますが、自分はそんな能力がないので、ツールの力で何とかすべくもうちょっとあがいてみました。

### ToyViewerでなんとかする

Macで画像を編集するツールは色々あるかと思いますが、お手軽で目的に叶いそうな[ToyViewer](https://itunes.apple.com/jp/app/toyviewer/id414298354?mt=12)というツールを発見しました。これはなかなか良く出来ています。

これを使って、元画像をポスタライズした上で輪郭抽出したら何とかならんかな？と思ってやってみたのですが...  
  

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-06-02-gfab-open-day-2-sarah.png"><img src="../images/thumbnails/blogspot-2013-06-02-gfab-open-day-2-sarah.png" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">元画像をザックリ切り抜いたものを...</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-06-02-gfab-open-day-2-sarah-pos.png"><img src="../images/thumbnails/blogspot-2013-06-02-gfab-open-day-2-sarah-pos.png" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">ポスタライズして...</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-06-02-gfab-open-day-2-sarah-line.png"><img src="../images/thumbnails/blogspot-2013-06-02-gfab-open-day-2-sarah-line.png" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">輪郭抽出してみましたが...</td>
</tr>
</tbody>
</table>

もう少し抽出した輪郭線を太く出来ればいいんですけど、これでは線が細かすぎて、カットするそばから粉々になること請け合いって感じで、これをそのまま利用するのは断念しました。。。うーむ、手抜きでベクターデータを創るのはこのへんが限界なのでしょうか。。。  

この辺りで諦めて別なもくもくに切り替え
--------------------------------------

鈴木さん作成の新しいおもちゃ＝LEDマトリクスボードをhogehogeするコードをJavaから書こうと思ったのですが、Rubyの新しく追加されたメソッド
encode
をJavaに描き直すが面倒だと気づいたところでタイムアップ〜と相成りました。3\*5のドットで何を表現するか、漢の勝負だったんですけどね。。。

> 手作りLEDマトリクスを時計にしてみた。隣にある照明用のリモコンで時刻合わせ可能。正面から見ると眩しすぎて目が痛いw
> ガワはケミカルブロック削って作る予定。
> [twitter.com/mgwsuzuki/stat…](http://t.co/sRbD3XoIp3 "http://twitter.com/mgwsuzuki/status/340754075257823232/photo/1")  
> — K. Suzukiさん (@mgwsuzuki)
> [2013年6月1日](https://twitter.com/mgwsuzuki/status/340754075257823232)

で、最後に告知
--------------

本当はもう少しまともな成果を出してLTしようと思っていたのですが、全然アレだったので、最後の10分でファイルを作って告知LTをさせて頂きました。某秘密のイベントを初めて外部の皆さまにお知らせしましたよ〜。

  

**[20130602色々告知](http://www.slideshare.net/KoichiroNishijima/20130602 "20130602色々告知")**
from **[Koichiro
Nishijima](http://www.slideshare.net/KoichiroNishijima)**  
まだちとUSTにもtwitterにも流せない未確定情報が多かったのですがすみません、楽しいイベントにするべくがんばりますので、何卒よろしくお願いいたしますm(\_
\_)m  

### 8月の沖縄はメッチャ熱い！ということで、よろしくお願いします！m(\_ \_)m
