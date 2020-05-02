+++
author = "k-nishijima"
published = 2013-02-18T20:16:00+09:00
slug = "blogspot-2013-02-18-gitlab41-on-aws"
tags = [ "aws",]
title = "gitlab4.1 on AWS"
+++
@yamanetoshiさんが、よその仮想サーバで動いていたgitlabを開放してくださっていたのですが、<s>駄々をこねたら</s>軽い気持ちでお願いしてしまったら[さくっとgitlab4.1
のAMIを作って公開](http://d.hatena.ne.jp/yamanetoshi/20130215/1360927631)してくださったので早速試してみました。  
本当に有難うございますm(\_ \_)m  
  
＃丁度何故か同時期に [@gkfj](http://d.hatena.ne.jp/dkfj/20130216/1361017256)
さんも同じようにAMIを作って公開されていますので、もしよろしければそちらも参考にして下さい。ちなみにgkfjさんのほうは
AmazonLinuxで、山根さんの方は Ubuntuです。勿論僕はUbuntu!  
  
で、そもそもgitlabの動作の仕組みをよくわかってなかったので、取り敢えず動かすまでに時間がかかったんですが、以下を実行すれば一応GUIからリポジトリを作れるところまでは動いたのでご報告です。  
（突っ込んだ動作確認はおいおいで、何かあったらここに追記します）  
  

> ubuntuユーザでログイン後、 

> $ sudo su gitlab  
> $ cp ~/.ssh/id\_rsa.pub ~/.ssh/authorized\_keys  
> $ ssh -i ~/.ssh/id\_rsa localhost  
> $ exit  
>   
> $ sudo su - git  
> $ ~/bin/gitolite setup -pk gitlab.pub

色々いじりすぎてよく分からんのですが、ひとまずコレで動いたような気がします。トラブルシュートについてはこのへんを参考にしてみて下さい。  
<https://github.com/gitlabhq/gitlab-public-wiki/wiki/Trouble-Shooting-Guide>  
  
あ、そうそう、AMIのリージョン移動はできませんが、元となったスナップショットを選択→Copy
Snapshot
でどのリージョンにも移動出来ますのでお好きなリージョンへどうぞ。
