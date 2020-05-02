+++
author = "k-nishijima"
published = 2013-05-22T22:50:00+09:00
slug = "blogspot-2013-05-22-javajmx-1"
tags = [ "java",]
title = "Java\u4f7f\u3044\u306a\u3089JMX\u3092\u4f7f\u304a\u3046 \u305d\u306e1"
+++
始まりは某イベントをtwitterでエア参加していてTLに流れてきたこの一言、  

> 監視大事。JMXは知名度ないけどいいよねー
> [\#jdt2013](https://twitter.com/search/%23jdt2013)  
> — 山本裕介さん (@yusuke)
> [2013年5月14日](https://twitter.com/yusuke/status/334240156246736896)

  
えぇ〜、そうだったのか！？JDK1.5の頃から、J2EEだともっと前からあるのに！！！ということで、切腹、もとい  

> JMXほんとに知名度イマイチなのかな。ブログ書いてやろうか  
> — 西島 幸一郎さん (@k\_nishijima)
> [2013年5月14日](https://twitter.com/k_nishijima/status/334240960647147520)

  
の責任をとって、遅くなりましたがちょっと書いてみます。  
<span id="more"></span>

JMXとは
-------

[JSR3](http://www.jcp.org/en/jsr/detail?id=3)というとんでも無いナンバリングで、既に歴史ある仕様だってことが分かるのですが、細かい話はググるか[wikipedia](http://ja.wikipedia.org/wiki/Java_Management_Extensions)を参照してみて下さい。  
Java開発者にとってみると、ざっくり「稼働中のJVMに繋いで内部状態を取得したり、メソッド呼んだり出来る便利API」という言い方になるかと思います。  
一番身近なのは恐らく jconsole
で実行プロセスに接続して、メモリとかスレッドとか監視するかと思いますが、こいつのMBeanタブで見えるものがそれです。  

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-05-22-javajmx-1-2013-05-22+21.37.38.png"><img src="../images/thumbnails/blogspot-2013-05-22-javajmx-1-2013-05-22+21.37.38.png" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">jconsole を起動してプロセスに接続するとJVMの内部状態が見える</td>
</tr>
</tbody>
</table>

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-05-22-javajmx-1-2013-05-22+21.38.23.png"><img src="../images/thumbnails/blogspot-2013-05-22-javajmx-1-2013-05-22+21.38.23.png" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">JMX経由で取得した値。これはRuntimeを表示した例</td>
</tr>
</tbody>
</table>

### jconsoleを知らない！？

もしも万が一、jconsoleを知らないという方がいたら多分当社比**1万時間くらい損してますので**、できるだけ早く[本家ドキュメント](http://docs.oracle.com/javase/jp/6/technotes/guides/management/jconsole.html)などを参考にして、使ってみて下さい。  
これで例えば、開発環境でTomcatを使っていたとすると、こんな感じでアクティブなセッション数とかが取れるわけですね。  

<table>
<tbody>
<tr class="odd">
<td style="text-align: center;"><a href="../images/blogspot-2013-05-22-javajmx-1-2013-05-22+21.45.17.png"><img src="../images/thumbnails/blogspot-2013-05-22-javajmx-1-2013-05-22+21.45.17.png" /></a></td>
</tr>
<tr class="even">
<td style="text-align: center;">作為的すぎてスンマセン。アクティブセッションが1です</td>
</tr>
</tbody>
</table>

で、ナニが嬉しいの？
--------------------

-   稼働中のJVMのメソッドが呼べる

例えば稼働中にログレベルを変更したり、何かやばそうだからGC呼んでみたり、MBean経由で外部に公開されているものであればなんでも出来ます。自分の場合は色々各種サーバを書くことが多いので、その管理者向け機能を公開したりします（管理者しか使わない機能でGUIに乗せるのが面倒だったり、、、）。

設定変更や動作に直結する変更でも、いちいち再起動する必要がないのでとても便利です。

-   稼働中のJVMの内部状態が見える

先程からの繰り返しになりますが、例えばメモリ使用量、スレッド数、アクティブセッション数やエラー数など、これもMBeanインターフェイスが提供してくれるものであればなんでも取ることができます。

### MBeanインターフェイスとその実装

MBeanインターフェイスと言っても、実体は単なるインターフェイスです。例えば例としてこんなの。これは例えばFTPサーバの起動後の経過時間や、転送バイト数などを返すインターフェイスだと思って下さい。setEchoMessageなんていう内部変数を書き換えるメソッドも見えます  

    public interface HogeFTPServerMBean {
     public String getUptime();

     public int getReadBytes();

     public int getWrittenBytes();

     public void setEchoMessage(String msg);
    }

で、これをimplementsしたサーバを書いて、それが起動する際に  

      MBeanServer server = ManagementFactory.getPlatformMBeanServer();
      server.registerMBean(this, new ObjectName("yourDomain:type=hogeFTPServer"));

などと書いておけばあら不思議、先ほどのインターフェイスを実行中に呼び出すことができます。  
  
さて、これをじゃあどうやって実際に上手いこと監視に利用するの？という話になりますが、眠くなってきたので以下次号（笑）  
  

> そこでJolokia+jq+CloudWatchですよみなさん！！！とエア乱入してみる
>
> — 西島 幸一郎さん (@k\_nishijima)
> [2013年5月14日](https://twitter.com/k_nishijima/status/334240635215306753)
