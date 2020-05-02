+++
author = "k-nishijima"
published = 2010-01-13T01:10:00+09:00
slug = "blogspot-2010-01-13-ubuntu910-on-aspire-as1410_13"
tags = [ "as1410", "ubuntu",]
title = "Ubuntu9.10 on aspire as1410 \u3067\u30cf\u30a4\u30d0\u30cd\u30fc\u30c8"
+++
ついにサスペンド問題も解決か！？！？（前とは探し方が何か違ったのか??それともカーネルが上がったお陰??）  
via 「How to: Karmic Koala on Acer 1410 / 1810T/ 1810TZ」  
<http://ubuntuforums.org/showthread.php?p=8409272>  

> **Issues:** **Hibernate/resume:**  
>
> > **Issue:** after hibernating or suspending, the computer won't wake
> > up properly.  
> > **Solution:** gksudo gedit /etc/modprobe.d/blacklist.conf to edit
> > the file and add the following (without quotes): "blacklist
> > acer-wmi"  

  
この通りにして1回念のため再起動した後は、今のところサスペンド後、この書き込みが出来るまでは進んでる！  
サスペンドからの復旧後にちゃんと無線LANも復旧するし。  
これからハイバネートしてお風呂入って、出てきて復旧してたらこれを公開するぞと。  
  
-&gt;
出来たみたい。ハイバネートは相当時間かかるけどね。ふた閉めてのサスペンドも問題ない模様。おぉー、うれしいなー。as1410友の会（んなのがあればだが）のメンバー全員に広めたい気分！
