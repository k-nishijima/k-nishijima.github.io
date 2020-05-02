+++
author = "k-nishijima"
published = 2012-12-08T22:40:00.001000+09:00
slug = "blogspot-2012-12-08-javaurls3"
tags = [ "aws", "java",]
title = "Java\u306eURL\u30af\u30e9\u30b9\u3067S3\u30d7\u30ed\u30c8\u30b3\u30eb\u3092\u5b9f\u88c5\u3059\u308b\u3068\u304d\u306b\u6c17\u3092\u3064\u3051\u308b\u3053\u3068"
+++
気づいたら埋まってしまっていた[AWS Advent Calendar
2012](http://www.zusaar.com/event/451053)向けのネタをひとつ。  
明日はCDP Advent Calendarネタを書きますが、今日はこっちで。  
  
-----  
2012年12月17日追記：  
[@DQNEO](https://twitter.com/DQNEO)さんより「正しくはプロトコルじゃなくてURIスキームじゃね？」とツッコミをいただきました。はい、そうです、転送に使うプロトコルは実際は
http or https
ですので、httpやs3と表記する部分はURI(URL)スキーム、というのが正しいです。皆さん見たことあると思いますが、詳細は[javadoc](http://dlc.sun.com.edgesuite.net/jdk/jdk-api-localizations/jdk-api-ja/builds/latest/html/ja/api/index.html)を参照してください。  
ですが「オレオレURIプロトコルスキーム」って言うのが語呂が悪いので（笑）、以下全部は変更しませんが、脳内変換してくださいませm(\_
\_)m  
-----  
<span
id="more"></span>JavaでAWSを触っている方は、s3cmdと互換のS3<s>プロトコル</s>プロトコルスキームを普通に自分のコードの中で扱えるようにしますよね？ね？  
例えばこんな感じの「new
URL("s3://yourBucketName/key/path/object.txt")」みたいに、URLクラスで透過的に扱いたいですよね？（ゴリ押し）  
  
Javaの世界では、s3://などと表記される<s>プロトコル</s>スキームも当然自分で実装出来るので、どんなオレオレプロトコルだろうが透過的にURLクラスの上で取り扱えます。例えばこんな感じのハンドラを書きます。  
  

    public class S3StreamHandler extends URLStreamHandler {

     /**
      * @see java.net.URLStreamHandler#openConnection(java.net.URL)
      */
     @Override
     protected URLConnection openConnection(URL url) throws IOException {
      return new URLConnection(url) {
       AmazonS3 s3 = AWSUtil.createS3Client();
       S3Object object = null;

       /**
        * @see java.net.URLConnection#connect()
        */
       public void connect() throws IOException {
        object = s3.getObject(url.getHost(), url.getPath().substring(1));
        if (object == null) {
         throw new FileNotFoundException(url.getHost() + url.getPath());
        }
       }

       /**
        * @see java.net.URLConnection#getInputStream()
        */
       @Override
       public InputStream getInputStream() throws IOException {
        if (!connected) {
         connect();
        }

        return object.getObjectContent();
       }
      };
     }
    }

んで、こいつをURL.setURLStreamHandlerFactoryするか、URLを生成する際の第5引数として与えます。setURLStreamHandlerFactoryはプロセス中1回しか呼べないので、例えばTomcat上のWebアプリの中で呼ぼうとすると他で呼ばれてるかもしれないのでその場合は後者の方法を使うしか無いです。  

       URL.setURLStreamHandlerFactory(new URLStreamHandlerFactory() {
        @Override
        public URLStreamHandler createURLStreamHandler(String protocol) {
         return "s3".equals(protocol) ? new S3StreamHandler()
           : null;
        }
       });

または  

    URLクラスのコンストラクタ

    URL(String protocol, String host, int port, String file, URLStreamHandler handler) 

で、普通はこれで何の問題もないんですが、何故か上記のS3StreamHandlerをsmall
footprintな環境でループの中で使うと、コネクションが不意に切れてしまうという何故だか妙なことが起こります。具体的には以下の様なコードを、凄くメモリを絞ったVMの設定とか、例えばmicroインスタンスで動かすと恐らく再現率100%だと思います。  

      List fileUrlList = new ArrayList();
      fileUrlList.add(new URL("s3://fooBar/hoge/fuga.txt"));
      fileUrlList.add(new URL("s3://その他一杯URL"));

      BufferedReader reader = null;
      try {
       for (URL fileUrl : fileUrlList) {
        reader = new BufferedReader(new InputStreamReader(fileUrl.openStream(), "UTF8"));
        String line;

        while ((line = reader.readLine()) != null) {
         // 色々処理する
        }
       }
      } catch (Throwable t) {
       log.error("", t);
       // 例外処理規約に従って煮るなり焼くなり
      } finally {
       try {
        if (reader != null)
         reader.close();
       } catch (Exception e) {
       }
      }

この例だと、ループで回してS3上のテキストファイルを読むだけなんですが、何故か数十ファイル読もうと思ってもはじめの数ファイルでjava.net.SocketException
Socket closedが投げられてくると思います。  
はて、クライアント側には何処にもクローズするコードはないんだけど。。。しかもローカルの開発環境では再現しないし、、、と悩みに悩んでいたんですが、stackoverflowで[こんなスレッド](http://stackoverflow.com/questions/9952815/s3-java-client-fails-a-lot-with-premature-end-of-content-length-delimited-messa)を発見。流石stackoverflow、なんでもありますねー。  
やはりメモリの少ない環境で動かして見ることは重要ですね。なるほど、、、ということで、S3StreamHandlerを以下のように修正すればガベコレされないでうまくいくと思います。AmazonS3とS3Objectをインスタンス変数に移しただけです。  

    public class S3StreamHandler extends URLStreamHandler {
     AmazonS3 s3 = AWSUtil.createS3Client();
     S3Object object = null;

     /**
      * @see java.net.URLStreamHandler#openConnection(java.net.URL)
      */
     @Override
     protected URLConnection openConnection(URL url) throws IOException {
      return new URLConnection(url) {

       /**
        * @see java.net.URLConnection#connect()
        */
       public void connect() throws IOException {
        object = s3.getObject(url.getHost(), url.getPath().substring(1));
        if (object == null) {
         throw new FileNotFoundException(url.getHost() + url.getPath());
        }
       }

       /**
        * @see java.net.URLConnection#getInputStream()
        */
       @Override
       public InputStream getInputStream() throws IOException {
        if (!connected) {
         connect();
        }

        return object.getObjectContent();
       }
      };
     }
    }

というわけで、オレオレS3プロトコルハンドラを書くときには、ヒープが少ない状態に設定されているJVMでもちゃうと動くように工夫しておいてあげましょう、というお話でした。  
ではまた明日m(\_ \_)m
