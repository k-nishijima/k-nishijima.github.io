+++
author = "k-nishijima"
published = 2012-09-08T08:44:00+09:00
slug = "blogspot-2012-09-08-amazon-s3timemachine"
tags = [ "aws", "mac",]
title = "Amazon S3\u4e0a\u306bTimeMachine\u3067\u30d0\u30c3\u30af\u30a2\u30c3\u30d7\u3092\u53d6\u308b\u65b9\u6cd5"
+++
s3backerというfuse上のファイルシステムを使ってみんなが夢見る(?)、クラウド（今回はAmazonS3）へのTimeMachineを使ったバックアップ、出来ました。  
ただし初めに書いておきます。  

### 「無保証です！」

s3backerがどれだけ信頼性があるのかも検証してませんし、このバックアップからフルリストアしたこともありません（つまりこれが正しくバックアップされてるかどうか不明）。以上。  
お約束を書いたあとは、具体的な手順を書いていきます。  
  
<span id="more"></span>

事前準備
--------

お好みのパッケージ管理ソフトで、以下をインストールしておきます。  

-   fuse / Macのfuse実装は◯◯らしいので、fuse4xを入れました
-   [s3backer](http://code.google.com/p/s3backer/)

brewなら、以下。

> $ brew install fuse4x  
> $ brew install s3-backer

あれ、fuse4xはもうちょっと何かあった気が。メッセージに従ったような気がしますが、不明なら[公式サイト](http://fuse4x.github.com/)や、[この辺り](http://d.hatena.ne.jp/m-bird/20120401/1333306127)を参考にしてください。  

------------------------------------------------------------------------

以下 2012年12月26日追記：  
カーネルだかOSだか、何らかのバージョンが上がって不整合が起きた時に、  
  

> fuse4x client library version is incompatible with the kernel
> extension (kext='0.9.1', library='0.9.2').

とか言われてfuse4xのマウントが出来なくなることがあります。気づいたら12月中旬の段階でそうなってました（が、忙しくて放置していました）。

この時は、全て削除して再度入れなおす、で取り敢えず動いてる模様です。

> sudo kextunload -b org.fuse4x.kext.fuse4x  
> sudo rm -rf /Library/Extensions/fuse4x.kext/  
> sudo rm -rf /System/Library/Extensions/fuse4x.kext/  
> brew uninstall s3-backer  
> brew uninstall fuse4x  
> <span
> style="font-size: x-small;">この段階で、/usr/local/Cellar/fuse4x-kext/
> と /usr/local/Cellar/fuse4x/
> を確認してみて、ディレクトリが残ったままであれば手動で削除してしまったほうがなんとなく安心。。。</span>

> 念のため再起動後、  
> brew install fuse4x  
> brew info fuse4x-kext  
> の表示に従って  
>   sudo /bin/cp -rfX
> /usr/local/Cellar/fuse4x-kext/0.9.2/Library/Extensions/fuse4x.kext
> /Library/Extensions  
>   sudo chmod +s /Library/Extensions/fuse4x.kext/Support/load\_fuse4x  
> sudo kextload /Library/Extensions/fuse4x.kext/  
> brew install s3-backer

でいけると思います。多分。  
以上、追記終わり：  

------------------------------------------------------------------------

次、AWSアカウントは持っていることを前提として、まずS3上にTimeMachineバックアップ用のバケットを作成。なるべくネットワーク的に近くなるように、Tokyoリージョンに作成しました。  
もしs3cmdを使っていない人は、ブラウザ経由のManagementConsoleで作るなり、brew
install s3cmd なりしておいてください。  

> $ s3cmd mb --bucket-location ap-northeast-1 s3://yourBucketName  
> Bucket 's3://yourBucketName/' created

このバケットに小さいファイルが山と生成されますので、他の用途とは共有せず、専用のバケットを作ったほうが良いと思います。  

ところでs3backerとは？
----------------------

[公式サイト](http://code.google.com/p/s3backer/)にあるように、単純に言うとAmazon
S3上にブロックデバイスを持つ仮想ディスク、みたいな感じです。

Mac上からは、指定したサイズのdmgファイルを作ってそれをS3上に置ける、というような感じです。

s3backerの設定
--------------

基本的には  
<http://code.google.com/p/s3backer/wiki/CreatingANewFilesystem>  
にある通りです。上記URLにある書式通りの内容で、  
~/.s3backer\_passwd  
にアカウント情報を追加しておきます。  

### TimeMachineで使うDMGを生成

ここで指定するオプションは以下の様な意味です。  
  
 vhost :
東京リージョンにバケットを作ったゆえこのオプションが必要でした  
 prefix :
S3上のブロックファイルに使われるprefix。このprefixが付いたファイルが多数生成される  
 size : DMGファイルのサイズ。ここでは100Gのディスクを作成しました  
あとのオプションは公式サイトで確認してください。  

> $ mkdir s3b.mnt  
> $ s3backer --vhost --prefix=yourMBAdmg --compress --blockSize=1m
> --size=100g --filename=yourMBAdmg.dmg
> --listBlocks yourBucketName s3b.mnt  
> s3backer: auto-detecting block size and total file size...  
> s3backer: auto-detection failed; using configured block size 1m and
> file size 100g  
> s3backer: listing non-zero blocks...done  
> s3backer: found 0 non-zero blocks

### ディスクをアタッチ

> $ hdiutil attach -nomount s3b.mnt/yourMBAdmg.dmg  
> /dev/disk3

### パーティションを作成

diskutilについては man diskutil で確認してください。

> $ diskutil partitionDisk disk3 1 'HFS+' s3backer R  
> Started partitioning on disk3  
> Unmounting disk  
> Creating the partition map  
> Waiting for the disks to reappear  
> Formatting disk3s2 as Mac OS Extended with name s3backer  
> Initialized /dev/rdisk3s2 as a 100 GB HFS Plus volume  
> Mounting disk  
> Finished partitioning on disk3  
> /dev/disk3  
>    \#:                       TYPE NAME                    SIZE      
> IDENTIFIER  
>    0:      GUID\_partition\_scheme                        \*107.4 GB  
> disk3  
>    1:                        EFI                         209.7 MB  
> disk3s1  
>    2:                  Apple\_HFS s3backer                107.0 GB  
> disk3s2

この段階で、自分でつけた名前で（ここでは/Volumes/s3backer）に勝手にマウントされます。  

### TimeMachineのディスティネーションを設定

このtmutilコマンドがどのOSバージョンから添付されているのかわかりませんが、GUIの設定画面で先ほどマウントしたdmgが選択できなくても、以下のコマンドでちゃんと書き込み先として設定できます。このコマンドの詳細も
man tmutil してみてください。  

> $ sudo tmutil setdestination /Volumes/s3backer

で、設定を開くと、ちゃんと見えてる！  

[![/images/blogspot/blogspot/thumbnails/blogspot-2012-09-08-amazon-s3timemachine-2012-09-07+22.18.14.png)/images/blogspot/blogspot/blogspot-2012-09-08-amazon-s3timemachine-2012-09-07+22.18.14.png)

初回のバックアップはとてつもなく時間がかかると思われる（＆上り回線の帯域を圧迫する）ので、不要なディレクトリを除外するなどした上で、覚悟してバックアップを開始してください。  

使い勝手
--------

普通のUSBハードディスクを繋げたまま or
家庭内NASにバックアップしているTimeMachineがどんな感じなのか、やったことがないので比較は出来ません(^^ゞ  
たぶん、TimeMachine自体の動きは遅いんじゃないかな？と思います。  
しばらくこれで運用してみます。
