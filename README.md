# Test old action script sample.

昔Flashで色々テストしてたものを、今後JavaScriptで使うかもしれないのでup。  
（※以前Blogにupしてたもの）  
言語が変わっても元になるアルゴリズムやコードの組み方は参考になる事が多い。  

`RandomTextTest.swf`  
Flash時代に流行った、テキストを1文字ずつランダムにシャッフル表示するクラス。  
参考サイトを見て色々テストした。  

`tf_and_string_length_test.swf`  
テキストフィールド上の文字数のカウントが、  
複数行の時は自動的に+1される検証？で作ったっぽい。  

`wait_test.swf`  
「数秒待つ」機能をクラスで実装。  
スクリプトをタイムラインとクラス両方に書く場合があって、  
この場合数秒待って指定のフレームにジャンプするようになっている。  

※JavaScriptで「数秒待つ（Sleep的な機能）」はPromiseとsetTimout使う方法でOK。  
jQuery.Deferredで同じ事が出来る（jQueryが組み込める場合）とか、  
async/await使うのはframeworkのトランスパイラが対応してなくてエラー出たとか、  
色々案件により対応方法が変わるので、調べた事は都度残しておく。  

reference  

**手軽にテキストシャッフル演出ができるJSライブラリ「shuffle-text」を公開 - ICS MEDIA**  
[https://ics.media/entry/15498/](https://ics.media/entry/15498/)  

※以下10年位前に参考にしたブックマーク  

**BONKURA BLOG - AS3版ランダムテキスト**  
[http://web.archive.org/web/20100111034833/http://blog.bonkura.jp/2008/10/as3-1.html](http://web.archive.org/web/20100111034833/http://blog.bonkura.jp/2008/10/as3-1.html)  
>もうちょっと簡潔＆仕様追加してAS3に移植してみました。  
>RandText_as3.as  
↓経由

**テキストくるくるライブラリ - pandajustice.jp**  
[http://web.archive.org/web/20090207082856/http://pandajustice.jp/2007/12/post-1.html](http://web.archive.org/web/20090207082856/http://pandajustice.jp/2007/12/post-1.html)  
>flashでよく見る、テキストをランダム文字列で埋めてから徐々に表示するライブラリを公開。  
>RandText_as2.as  

**ランダムなインプットアニメーションを持つテキストフィールド - wonderfl build flash online**  
[https://web.archive.org/web/20120315030546/http://wonderfl.net/c/4rn8](https://web.archive.org/web/20120315030546/http://wonderfl.net/c/4rn8)  
>4rn8.as

**Flash：テキストがガチャガチャするアレ - Webのプルタブ**  
[http://web.archive.org/web/20080626211027/http://pulltab.info/2007/12/17115659.html](http://web.archive.org/web/20080626211027/http://pulltab.info/2007/12/17115659.html)  
>onClipEventRandom.as

