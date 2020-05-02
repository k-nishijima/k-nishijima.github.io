+++
author = "k-nishijima"
published = 2014-08-09T17:13:00+09:00
slug = "blogspot-2014-08-09-201408jaws-ug-okinawa"
tags = [ "study-group", "aws",]
title = "2014\u5e748\u67089\u65e5 JAWS-UG\u6c96\u7e04\u3082\u304f\u3082\u304f\u4f5c\u696d\u30e1\u30e2"
+++
2014年8月9日 JAWS-UG沖縄もくもく作業メモ
========================================

<http://jaws-ug-okinawa.doorkeeper.jp/events/13850>  
のもくもく作業メモです。  

<span id="more"></span>CloudWatch Logs
--------------------------------------

    http://blog.cloudpack.jp/2014/07/17/aws-8-cloudwatch-logs/

  
を熟読。logwatchの代替、という言い方がしっくり来ますね。いつもlogwatchだけど東京に来たら、さくっとこれに切り替えたい。  

Amazon Mobile Analytics
-----------------------

公式のブログ  

    http://aws.typepad.com/aws_japan/amazon-mobile-analytics/

Cognitoを普通のサイトで使いたいな〜。「アクティブユーザの追跡とエンゲージメント」とかって別にモバイルアプリに限った話じゃないからなぁ。  
  

    http://docs.aws.amazon.com/mobile/sdkforandroid/developerguide/kinesis.html

ここにドキュメントがあるんだが、1秒見ただけではRESTのドキュメントが見当たらない。SDKのソースをばらしていじるのはちょいとめんどいな。。。  

Redshift無料使用枠
------------------

ってか、無料枠ってあったかな？？-&gt;
無い気がする。勘違いであった。。。  
因みにTableauは無料で2週間トライアルがあって、価格は20万円代らしい（月or年orワンショット購入？）  

Knesis in Tokyo!
----------------

ブラベルの資料はこれ。  

    http://www.slideshare.net/AmazonWebServicesJapan/aws-black-belt-tech-amazon-kinesis

1shard 1000Write/Sec
位なら普通に処理できるんだけど、Kinesisに載せ替えるこれという理由がすぐに思いつかない。。。  
Log4j Appenderはちょっと面白そうだけど。  
  

    http://aws.typepad.com/aws_japan/2014/03/process-streaming-data-with-kinesis-and-elastic-mapreduce.html

によると、EMR
Connectorを使ってそのままEMRにぶっこんでってのも出来るよ、とのこと。hiveで半リアルタイムの集計とかは楽そう。  
  

    http://www.slideshare.net/iktakahiro/amazon-kinesis-32428443?related=1

のfluentdとの棲み分けあたりの記述が参考になりました。  
  
また、大谷さんの資料を穴が開くまで熟読。  

    http://www.slideshare.net/shot6/amazon-kinesis-32354587

RasPiからはMQTTで、具体的にはこやつを使ってデータを吸い上げなさい、とのこと。
<http://mosquitto.org/>  

CloudTrail in Tokyo!
--------------------

CloudTrailがサポートしているサービスはここに一覧がある。  
<https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_supported_services.html>  
  
が、残念ながらDynamoDBは未サポートなので、「ゴラァ誰だこのテーブルのスループット下げたのは！！」とかいう突っ込みには利用できない(;\_;)  
全サービスのAPI呼び出しがサポートされていると勘違いしていたので、意外。  

ZocaloはGoogle Appsがあるからパスw
----------------------------------

その他、コミュニティ活動。。。
==============================

ハッカーズチャンプルーメンテナンス
----------------------------------

    http://hackers-champloo.org/

のメンテナンス実施。  
<http://hackers-champloo.org/2014/> ディレクトリを整備。  
また、来年への取り組み...の前に、実行委員会を毎年リセットして、希望者を募る形にしようと思う。なので、一旦リセットして来週以降に再度立ち上げることとする。  

CodeMash / CodeJPについて
-------------------------

CodeJPというイベントが今日明日北海道で開催されていた。  

    http://codejapan.jp/2014

ほええこんなのがあるなんて知らなかった〜。  

    http://www.codemash.org/

CodeMash、これも知らんかった。恐らく理想はこれが近いのかな。  

10月のJAWS-UG沖縄 CMS祭りについて
---------------------------------

本当に徐々にではあるが企画が動きつつありますので、[乞うご期待](http://jaws-ug.jp/es/jaws-ug-okinawa-201410/)。これ、座談会をPODCASTで録音して残したいなw
