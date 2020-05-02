+++
author = "k-nishijima"
published = 2009-12-17T23:50:00.002000+09:00
slug = "blogspot-2009-12-17-blog-post"
tags = [ "as1410", "ubuntu",]
title = "\u307c\u3061\u307c\u3061\u74b0\u5883\u8a2d\u5b9a"
+++
さて、相変わらずサスペンドの後のネットワーク/キーボードの復旧が出来たり出来なかったりなacer
ASPIRE
AS1410ですがバックアップ用のポータブルHDDも買ったことだし、ぼちぼち環境設定を始めました（サスペンドはどうやらふたを閉めないでFn+F4でやればいいとか。。。後で試してみよう）。  
  
emacs23とかGnome
DOとかDropBoxとかメジャーどころも当然入れましたが、日本人なら何はなくともATOKでしょう、ということでさくっと。。。。と思いきや、64ビット版には入れるの結構大変でした。悩んだところ、[a-mutou
さんの素晴らしいブログ](http://am112705.blog.so-net.ne.jp/2009-11-13)を発見したのでそのまま使わせていただきました。ありがとうございました。以下はコマンドのヒストリを防備録として貼り付けておきます。  

> $ sudo apt-get install ia32-libs  
>   
> $ tar xzvf atokx3.tar.gz  
> $ cd ATOKX3  
> $ sudo -s  
>   
>    94  export LANG=C  
>    95  touch /etc/gtk-2.0/gtk.immodules  
>    96  bash ./setupatok\_tar.sh  
>    97  cd bin/tarball/IIIMF/  
>    98  tar zxvf iiimf-client-lib-trunk\_r3104-js3.i386.tar.gz  
>    99  tar zxvf iiimf-protocol-lib-trunk\_r3104-js3.i386.tar.gz  
>   100  mv ./usr/lib/\* /usr/lib32/  
>   101  wget
> http://ftp.ussg.iu.edu/linux/ubuntu/pool/main/t/tcp-wrappers/libwrap0\_7.6.q-18\_i386.deb  
>   102  dpkg --fsys-tarfile libwrap0\_7.6.q-18\_i386.deb |tar xf -  
>   103  mv ./lib/libwrap.so.0\* /usr/lib32/  
>   104  /sbin/ldconfig  
>   
>   105  cd ~/tmp/  
>   106  tar zxvf atokx3up2.tar.gz  
>   107  cd atokx3up2/bin/ATOK/  
>   108  tar zxvf atokxup-20.0-3.0.0.i386.tar.gz -C /  
>   109  cd ../IIIMF/  
>   110  tar zxvf iiimf-server-trunk\_r3104-js3.i386.tar.gz
> --exclude='./usr/lib' -C /  
>   111  tar xzvf iiimf-server-trunk\_r3104-js3.i386.tar.gz ./usr/lib  
>   112  mv ./usr/lib/\* /usr/lib32/  
>   113  sudo bash /opt/atokx3/sample/setting\_debian4.sh  

  
で、IIIMF
ステータスがじゃまなので消すのは[ジャストのサポートページ](http://support.justsystems.com/faq/1032/app/servlet/qadoc?QID=037494-1)を参照して作業します。  
  
ちなみにバックアップ用に買ったディスクはこれの黒。ポータブルで500Gで8千円は安いなーと思って昨晩バスケットに入れておいて、今朝注文しようと思ったら「価格が変わりましたー」と言って千円高くなってました。。。とほほ。
