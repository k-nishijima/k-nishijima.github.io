+++
author = "k-nishijima"
published = 2009-12-22T00:00:00+09:00
slug = "blogspot-2009-12-22-blog-post_22"
tags = [ "ubuntu",]
title = "\u3084\u3063\u3071\u308a\u30b5\u30b9\u30da\u30f3\u30c9\u304c\u6c17\u306b\u306a\u308b\u3002\u3002\u3002\u30ab\u30fc\u30cd\u30eb\u3092\u4e0a\u3052\u3066\u307f\u308b\u3082\u6483\u6c88"
+++
んー、やっぱり使えたのはあの1回だけ。。。なんでだろ。  
  
ちと頭にきて、カーネルを上げたらどうなるんだろ？と思い[http://kernel.ubuntu.com/~kernel-ppa/mainline/](http://kernel.ubuntu.com/%7Ekernel-ppa/mainline/)にある
v2.6.32および v2.6.33-rc1の両方を試してみました。  
-&gt; 結果、NGでした。。。とほほ。  
  
特に2.6.33-rc1は例のEXT4の[びっくりな不具合](https://wiki.ubuntu.com/KarmicKoala/ReleaseNotes/ja#ext4%20%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%81%A7%E3%81%AF%E5%B7%A8%E5%A4%A7%E3%81%AA%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%8C%E7%A0%B4%E6%90%8D%E3%81%99%E3%82%8B%E6%81%90%E3%82%8C%E3%81%8C%E3%81%82%E3%82%8A%E3%81%BE%E3%81%99)が修正されたっぽいので期待したのですが。。。両カーネルともXが何とか立ち上がるんですが激しく画面がちらついて操作できず、tty1にも切り替えられずと言う無茶苦茶な状況だったので、断念しました。  
  
お陰様で、ちょっとだけgrub2と仲良くなれましたのでメモしておきます。  
  
【grub2ってどうやって設定するの？？？】  
基本は /etc/default/grub　を編集して、  
sudo update-grub  
すると /boot/grub/grub.cfg が自動的に書き換わることになる。  
  
ただ、非常事態でUSBからブートしたときなどはそんなことやってられないので、直接
/boot/grub/grub.cfg
を書き換えることになる。このファイルはリードオンリー属性になってるので、viで書き込むときは
:w! で書き込んであげましょう。  
  
ちなみに /etc/default/grub の以下2行  
GRUB\_HIDDEN\_TIMEOUT=0  
GRUB\_HIDDEN\_TIMEOUT\_QUIET=true  
をコメントアウトすれば、毎回ブート時にカーネルの選択が可能になります。あれこれ入れたカーネルを切り替えるときにはお試しを。
