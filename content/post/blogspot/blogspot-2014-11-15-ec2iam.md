+++
author = "k-nishijima"
published = 2014-11-15T19:32:00+09:00
slug = "blogspot-2014-11-15-ec2iam"
tags = [ "study-group", "aws",]
title = "\u6307\u5b9a\u306eEC2\u30a4\u30f3\u30b9\u30bf\u30f3\u30b9\u30bf\u30a4\u30d7\u3057\u304b\u8d77\u52d5\u3067\u304d\u306a\u3044IAM\u30e6\u30fc\u30b6\u30fc\u3092\u4f5c\u6210\u3059\u308b"
+++
これはクラスメソッドさんのDevelopers.IOに投稿されている（いつもお世話になっております！）「[特定インスタンスタイプのEC2インスタンスが起動できないIAMユーザーを作成する](http://dev.classmethod.jp/cloud/ec2_restricted_runinstances/)」の対となるべく書いたポストです。  
  
どうでも良い付帯情報が多数書かれておりますので、キモだけ知りたい方は下の方へどうぞ。  

<span id="more"></span>事の始まり
---------------------------------

今年のJAWS-UG沖縄で恒例のサムライチケットを利用した「アカウント渡すから自由に使っていいよ〜」という自由なハンズオン（[過去のイベントはこの辺から見られます](http://jaws-ug-okinawa.doorkeeper.jp/events)）は、IAMユーザを配布しているのですが、毎回ほぼフル権限で渡しています。  
  
これは、何も考えずに渡しているわけではなくて、権限を制限して「なんかこれが出来ないんですケド」という質問や無駄な弊害を無くすべく、意識してやっていました。  
  
で、事件は起こります(^^ゞ  
  
[2014年10月に開催したCMS祭り](http://k-nishijima.blogspot.jp/2014/10/jaws-ug-cms201410.html)というイベントで、いつもの様にIAMアカウントを配布して網元AMIでWordPressを起動しよう〜！というハンズオンを実施したのですが、その際に・・・。  
  

> おい、ハンズオンで網元をhi1.4xlarge立ち上げたの誰やねん(;\_;)
> Marketplace Chargesはサムライチケット対象外だから、 Hiromichi Koga
> さんに自腹で50ドル以上献上しました(;\_;)
> 痛い勉強代になりました。。。orz  
> — 西島 幸一郎 (@k\_nishijima) [2014, 10月
> 19](https://twitter.com/k_nishijima/status/523749295196213248)

ということで、翌日インスタンスを停止するクリーニング作業をするまで、AWS
Marketplace Charges として$68.45がぶっ飛びました（笑）。  
  
デジタルキューブの小賀さんにご報告したところ、[どうもこれはMarketplace経由で選択した時のバグっぽい仕様](https://www.facebook.com/nishijima.koichiro/posts/10153273163340031?pnref=story)な感じでしたが、まあ確認画面でインスタンスサイズは出ているので、これは文句を言っても仕方ないことですね。。。  
（おそらくインスタンスって何？というかたが、そのままポチポチやったんじゃないかと想像してます）  
  
で、まあ仕方ないので次からはインスタンスのサイズを限定したIAMユーザを渡そう、と思い至り、上記の福田さんのポストを参考にこんなポリシーを書きました。  
  

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "Stmt1413712254000",
          "Effect": "Deny",
          "Action": [
            "ec2:RunInstances"
          ],
          "Condition": {
            "StringNotEquals": {
              "ec2:InstanceType": [
                "t1.micro",
                "t2.micro"
              ]
            }
          },
          "Resource": [
              "*"
          ]
        }
      ]
    }

  
ポイントはStringNotEqualsでして、プログラマーなら誰しも思うであろう、StringEqualsで「起動できるインスタンスを指定する」のではなくて、StringNotEqualsで「これ以外は起動しちゃやだ」という指定をしたい、というわけですね。  

しかし動かない・・・！？
------------------------

これで万事オッケ〜、Simulate
Policyでテストしても問題ないよ！と浮かれていたのですが、実際にこのポリシーを適用したユーザでインスタンスを起動しようとすると、謎のエラーで起動できない・・・ナゼorz  
  
どう頑張っても駄目だったので、[AWS Support
(Business)](https://aws.amazon.com/jp/premiumsupport/)
に加入して質問を投げてみました（実はこれもまた一悶着あるのですが（汗）。  
  
AWSのビジネスサポートは初期応答1時間以内で、かなり優秀という印象を持っていました。実ビジネスでAWSを利用するには加入必須のサービスと思われます。  
で、その優秀なサポートさんに今まであれこれ質問してきたわけですが、、、、実は解決に至るまでに、今までで一番時間がかかったケースになりました（笑）。  
  
1週間位掛かって解決した結論としては、、、  

RunInstances するときにはResource 設定しないと駄目だよ！
--------------------------------------------------------

とのことでした・・・。あ、この件は公開してもいいという許可は取ってありますのでご安心を。  

> 詳細は以下の  
> "Supported Resource-Level Permissions for Amazon EC2 API
> Actions"のRunInstancesの項目を参照してください。 

> <http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-supported-iam-actions-resources.html>

というわけで、正しいポリシーの設定は  

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Sid": "Stmt1413712254000",
          "Effect": "Deny",
          "Action": [
            "ec2:RunInstances"
          ],
          "Condition": {
            "StringNotEquals": {
              "ec2:InstanceType": [
                "t1.micro",
                "t2.micro"
              ]
            }
          },
          "Resource": [
              "arn:aws:ec2:*:アカウント番号:instance/*"
          ]
        }
      ]
    }

となります。  

オマケ：クレジットのサポート日割り料金未適用について
----------------------------------------------------

で、この質問をするのにJAWS-UG沖縄としてビジネスサポートに入ったわけですが（そもそもIAMに関する質問はビジネスサポート以上からしか出来ない）、初月は日割りでコストを請求されます。  
  
西島の持っているAWSサムライ2014のクレジット適用範囲にはビジネスサポートも含まれていたので、普通にさくっと契約してしまったのですが・・・  
  

<span style="font-size: large;">うおぉこれもAWS Service Charges
で請求が来てる！！</span>

  
この現象もよく分からなかったのでサポートに問い合わせたのですが、  

> <span
> style="background-color: white; color: #222222; font-family: arial, sans-serif; font-size: 14px;">大変わかりづらくなっており、誠に恐縮ですが、</span>  
> <span
> style="background-color: white; color: #222222; font-family: arial, sans-serif; font-size: 14px;">サービス加入時に発生いたします料金は、前払い金にあたるため、</span>  
> <span class="il"
> style="background: rgb(255, 255, 204); color: #222222; font-family: arial, sans-serif; font-size: 14px;">AWS</span><span
> style="background-color: white; color: #222222; font-family: arial, sans-serif; font-size: 14px;">プロモーションクレジットの対象外となります。</span>

という良く分からない日本語でご回答頂き、「まあいいからとにかく払えや」とのことでした・・・（涙）。  
というわけで日割りの$41.94をガッツリ請求されましたとさ。。。  

で、お伺いを立てました
----------------------

このままひとり爆死するのはネタとしては面白いのですが、これで一円も懐にはいらない自分としては<span
style="font-size: large;">どうにも悔しいでは無いですか</span>。ということでクレジットカード会社からの請求金額確定を待って、JAWS-UG沖縄のコアメンバーの皆様にお伺いを立てました。  
  

> 請求金額  
> AWS Support(Business) $41.94 \* 107.86円 = 4,524円  
> AWS Marketplace Charges $68.45 \* 114.50 = 7,838円  
> 計12,362円

結果、全会一致で「許してやろう」というお言葉を頂き、端数は面倒なので1万2千円をプール金より出金させて頂きました。  
  

JAWS-UG沖縄にご参加いただき、お気持ちをくださった皆様、スポンサーの皆様により救われました。ありがとうございましたm(\_
\_)m

（収支表は収支の動きがあった際に、集計して[Facebookグループのほう](https://www.facebook.com/groups/jawsug.okinawa/)にポストしています）

  
では最後にこの言葉で締めさせていただこうかと思います。  

#### この記事により多くの無駄な血が流れなくなることを祈っております。
