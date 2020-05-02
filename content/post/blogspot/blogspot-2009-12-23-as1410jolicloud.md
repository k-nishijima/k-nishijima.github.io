+++
author = "k-nishijima"
published = 2009-12-23T01:39:00.001000+09:00
slug = "blogspot-2009-12-23-as1410jolicloud"
tags = [ "as1410", "ubuntu",]
title = "as1410\u3067Jolicloud\uff01"
+++
CULVノートでUNR使ってみたい人がいたらチャレンジするかなーと思って、とりあえず僕もas1410に入れてみました（Ubuntu9.10
64/32版ともにスリープがダメダメ＆起動に2分以上かかるってのが大きいんですが。。。実はディスクがおかしいんかな???）
。  
  

[![](/images/blogspot/thumbnails/blogspot-2009-12-23-as1410jolicloud-Screenshot.png)](/images/blogspot/blogspot-2009-12-23-as1410jolicloud-Screenshot.png)  

この間のaspire oneより画面が広い。  

  
この[Jolicloud](http://www.jolicloud.com/)ですが、既にベータテストが始まりましたのでサイトからISOなりなんなりダウンロード可能な状態となっています。試してみたい方は是非。inviteも出来るのでtwitterでDでメルアドでも送ってもらえればお送りします。  
  
こいつとacer aspire
as1410との相性はと言うと。。。今のところ快調ですが。。。色々ネタはあります。  
  
良いところ：  

-   今のところ100%スリープが使える。蓋閉じ、Fn+F4ともにOK。復旧後の無線LANも問題無し。これはとても大きいですね。
-   常に最大化（何て言うツールなんでしたっけこれ）で画面が広く使える。as1410は天地が768しかないので、ステータスバーがつかなかったりして地味に広がるのがうれしい。  

問題点：  

-   インストール後のブートでエラー出まくり＆無茶苦茶時間かかる。ちと違うけど[こんなのがいっぱい](http://pastebin.com/f65aac4f6)。よくブート出来たもんだ。1度起動したら落とさなきゃ何てことないのかも知れんが。。。  

> ata5.00: failed command: READ FPDMA QUEUED  
> ata1: status: { DRDY ERR }  
> ata1: error ICRC ABORT  
> などなど  

-   標準では無線LAN認識してくれません。なので別マシンか有線でつないで[インテルのサイトから](http://www.intellinuxwireless.org/?n=Downloads)「1000
    Images – for Intel WiFi Link 1000BGN」を落としてきて /lib/firmware/
    に入れて再起動してあげる必要があります。
-   Fnキーでのハードウェア、全部動かないかも。。。カメラ、SDカードはOK、試した範囲で動いたのはF1/F4/F7/F8/カーソルでの音量、輝度、などなどもOK。というかこれらFn+色々なキーを試している間にハングしたのでもうこれ以外やってません（涙）
-   で、パッケージマネージャはMy
    Jolicloudしか無いわけですが、emacs23はどこ？（違）

<!-- -->

 最後にお約束のunameを貼っておきますか。ホスト名は破烈の人形にしてみました（うちのマシンたちMHの名前付いてるの多し。MacBookはaugeだし）。  
  
west@bang-doll:~$ cat /proc/version  
Linux version 2.6.32-1-jolicloud (adamm@gw) (gcc version 4.3.3 (Ubuntu
4.3.3-5ubuntu4) ) \#3 SMP Thu Dec 3 05:54:26 MST 2009  
west@bang-doll:~$ uname -a  
Linux bang-doll 2.6.32-1-jolicloud \#3 SMP Thu Dec 3 05:54:26 MST 2009
i686 GNU/Linux
