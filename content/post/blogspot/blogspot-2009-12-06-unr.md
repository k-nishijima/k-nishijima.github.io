+++
author = "k-nishijima"
published = 2009-12-06T20:23:00+09:00
slug = "blogspot-2009-12-06-unr"
tags = [ "ubuntu",]
title = "UNR\u3082\u8a66\u3057\u3066\u307f\u307e\u3057\u305f"
+++
ちゃんと比較してみよう、という訳で(?) [Ubuntu Netbook
Remix](http://www.ubuntu.com/getubuntu/download-netbook)も入れてみました。日本語版(?)は9.04しかないっぽかったので、上記リンクのように英語版からたどってダウンロードしてUSBメモリからLiveCD状態で試してみました。  
  

[![](/images/blogspot/thumbnails/blogspot-2009-12-06-unr-Screenshot.png)](/images/blogspot/blogspot-2009-12-06-unr-Screenshot.png)  

  
Jolicloudと比べて、さらに美しくなったアイコンが迎えてくれました。  
カメラもちゃんと使えたし、無線LANでパスワードが受け付けられない！と思いきやたまたま機嫌が悪かった(?)だけなのか、再起動したらちゃんと使えました。Language
Supportで日本語入れてログアウトしてみたんですが、やっぱりLiveCDじゃダメなのか日本語入力するまでには至らず。  
SDカードは左側のスロットはOKでしたが、右奥のスロットがNG。なんで？それに、何度もSDを抜いたりiPhoneをUSBで刺したり抜いたりしてたらOSごとハング。うーむ、やっぱり9.10は地雷なのか、たった数10分でハングするなんてオカシイよね...（そういえば再起動しろっていう警告ダイアログが出てたね。キャプチャは忘れちゃったけど）。この辺、ちゃんとインストールしてカーネル更新すればなんとかなるのかね？  
  
この段階だと、アルファ版と銘打っているJolicloudの方がいい感じだけど、SDカードスロットが動かなかったのは致命的か（そういえばJolicloudで9.10にアップデートしたらどうなるのかね？）。  
  
なんだかんだ言って、アスワン(AOA150-Bb)は意外と素直に動くハードなのかもね。最後、unameはこんな感じでした。  
  
ubuntu@ubuntu:~$ uname -a  
Linux ubuntu 2.6.31-14-generic \#48-Ubuntu SMP Fri Oct 16 14:04:26 UTC
2009 i686 GNU/Linux  
ubuntu@ubuntu:~$ cat /proc/version  
Linux version 2.6.31-14-generic (buildd@rothera) (gcc version 4.4.1
(Ubuntu 4.4.1-4ubuntu8) ) \#48-Ubuntu SMP Fri Oct 16 14:04:26 UTC 2009
