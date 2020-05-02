+++
author = "k-nishijima"
published = 2014-08-09T16:40:00.002000+09:00
slug = "blogspot-2014-08-09-unke-deploy"
tags = [ "aws", "java",]
title = "Docker\u30a4\u30e1\u30fc\u30b8\u304c\u30a4\u30df\u30e5\u30fc\u30bf\u30d6\u30eb\u3058\u3083\u7121\u304f\u306a\u3063\u305f\u8a71"
+++
沖縄のお盆は旧暦の7月13日から15日、ということで2014年は8月8日（つまり昨日）がウンケー（お迎え）でした。  
  
そんな日にデプロイ作業をしてたからハマった（？）のかどうか知りませんが、Docker
on Elastic Beanstalkの小咄を1つ。  
  
<span id="more"></span>  
プロダクション環境でDockerを利用している方は、ビルドの時間を短縮するためにだいたいこんな感じでイメージを作っているかと思います。  
  

[![](/images/blogspot/thumbnails/blogspot-2014-08-09-unke-deploy-2014-08-09+16.19.49.png)](/images/blogspot/blogspot-2014-08-09-unke-deploy-2014-08-09+16.19.49.png)

  
弊社の場合は、それぞれにこんなものが入っています。  

-   baseにはJava環境やsupervisord/sshdなど、どんな場合でも絶対使うもの（最近ここにcronを入れましたw）
-   appenvにはアプリケーション環境に固有なユーザやミドルウェアなど。例えば[gvm](http://gvmtool.net/)や[vert.x](http://vertx.io/)などが含まれます。
-   latestには最新のアプリそのものと一緒に、Elastic
    Beanstalkにデプロイします

latestのビルド時間を出来うる限り短縮したい、という話ですね。

  
で、それぞれのイメージのビルド周期は図のように、右に行くほど頻繁にビルドされます。と言うか左の2つは必要がなければいじりません。  
  
んで、最近のミドルウェアには大概自動アップデートの機能が付いているかと思います。gvmにもご多分に漏れず、付いています。  
  
ということは、appenvのイメージを作った時点では最新だったけど、latestを作った時にミドルウェアの自動アップデートが走って、もしアップデートが提供されていたら？  

[![](/images/blogspot/thumbnails/blogspot-2014-08-09-unke-deploy-2014-08-09+16.36.11.png)](/images/blogspot/blogspot-2014-08-09-unke-deploy-2014-08-09+16.36.11.png)

  
<span style="font-size: large;">はい、Immutable
Infrastructureだったつもりのイメージが、時期によっていきなり自分自身で更新が掛かって壊れてしまいますね！（汗）</span>  
  
ううむ、そうならないようにアップデートoffにしたり、オフラインの設定にしていたんですが、そのオプションが効いてなかったのか、、、gvmやるな（違）。  
<span
style="font-size: x-small;">（健気に標準入力で「アップデートする？」って聞いてきて
Beanstalkのデプロイがコケたのは秘密です。）</span>
