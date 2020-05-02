+++
author = "k-nishijima"
published = 2016-06-12T15:27:00.001000+09:00
slug = "blogspot-2016-06-12-nanairoishi"
tags = [ "golang", "aws",]
title = "EC2\u306eSecurity Group\u306b\u81ea\u5206\u306eIP\u3092\u767b\u9332\u3059\u308b\u30c4\u30fc\u30eb\u66f8\u304d\u307e\u3057\u305f"
+++
「過去に書いたあらゆる小物ツールをgoで書き直したくなる病に冒されている」西島です、こんにちは。  
  
はい、今日もgolangの勉強中です。
今回のネタはよくある「IPがコロコロ変わる環境からEC2にアクセスするときどうすんだよおおお」問題を解決するために「七色石」というツールを書いてみました。  
  
<a href="https://github.com/k-nishijima/nanairoishi" class="uri">https://github.com/k-nishijima/nanairoishi</a>  
  
インストール方法などは上記READMEを見てください。  
  
類似のツールはshellで書かれたものなど、いろいろありますね。いいんです、go言語の勉強なので(^\_^;)  
  
動きとしては、自分のグローバルIPを取って、セキュリティグループに追加、ヒストリに保存（次回同じ設定名で実行されたら、以前の設定をセキュリティグループから削除を試みる）、という、至ってシンプルな動きです。詳しくはソースを見てください。  
  
モバイル環境ほか、よく落ちるルーター経由で仕事している人（自分）、もしかしたらオートスケール配下のEC2なんかでも使えるとは思いますが、試してはいませんので自己責任にてお願いします。  
バグや何か面白いアイデアがあったらプルリクエストお待ちしております！  

使い方
------

    $ nanairoishi init

とするとコンフィグファイルの在り処が、  

    $ nanairoishi -h

とするとUsageほか設定ファイルの書き方例などが出ます。  
config.yaml
にはいくつでも設定がかけます。簡単に日本語で解説をつけときます。  

    Configs:
    - Name: 設定名（この名前で update -n 名前と実行します。多分日本語はダメだと思います）
      Profile: aws_profile_name（AWS Credentialsにあるprofile名を指定）
      Region: us-west-2（リージョン名）
      ID: sg-aaaabbbb（操作する対象のセキュリティグループ名）
      Port: 8080（FromPort/ToPortをこの値で指定します）

    - Name: myProject2
      Profile: aws_profile_name
      Region: us-west-2
      ID: sg-ccccdddd
      Port: 8081

上の例で、myProject2のセキュリティグループを更新したい場合は、以下のように実行してください。上手くいくと最後にDescribeSecurityGroupしてくれます。  

    $ nanairoishi update -n myProject2

七色石ってなあに？
------------------

[それはもちろん](https://www.google.co.jp/search?q=%E4%B8%83%E8%89%B2%E7%9F%B3&source=lnms&tbm=isch&sa=X&ved=0ahUKEwjF1oGl6KHNAhVDHJQKHetUANIQ_AUICCgB&biw=1438&bih=928)・・・
