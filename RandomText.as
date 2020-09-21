package {

    import flash.display.DisplayObjectContainer;
    import flash.text.TextField;
    import flash.events.Event;

    public class RandomText {

        //
        private var sourceTxt:String = "_/-=+%&$#!?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"; // カウントダウン表示用テキスト？
        private var content:DisplayObjectContainer; // コンテナ
        private var targetFld:TextField; // ターゲット
        private var targetText:String; // 変えるテキスト、一時代入用
        private var sliceCnt:int; //
        private var playTime:uint; // 再生時間？

        // コンストラクタ
        public function RandomText(content:DisplayObjectContainer, targetFld:TextField, time:uint) {

            this.content = content; // コンテナ指定

            this.targetFld = targetFld; // ターゲット指定

            playTime = time; // 再生時間指定

            targetText = targetFld.text; // ターゲットのテキストフィールド

        }

        public function start():void {
            targetFld.text = ""; // 空を代入
            sliceCnt = 0; // カウントに0を代入
            content.addEventListener(Event.ENTER_FRAME, onEnterFrame); // コンテナにエンターフレームイベントを指定
        }

        private function onEnterFrame(e:Event):void {
            trace("■エンターフレーム開始");

            sliceCnt++; // カウント+1
            trace("sliceCnt:" + sliceCnt);

            var randomTxt:String = ""; // ランダムに出すテキスト？
            trace("randomTxt : " + randomTxt);

            // trace("targetText.length:" + targetText.length);//16（+1？）、改行コードも含まれるので文字は1つでもlength=2になる。

            for (var i = 0; i < targetText.length; ++i) { // テキストm文字数の分まで、最後改行コードなので1個前で。3文字なら、2回

                trace("\n" + "i:" + i);

                if (sliceCnt - playTime < i) { // playTimeが10なら、0-11まで、ループ
                    trace("sliceCnt : " + sliceCnt);
                    trace("playTime:" + playTime);

                    // String.chaAt()、文字列の指定位置にある文字を返すメソッド
                    // ソーステキストの中からランダムに文字を返す。
                    randomTxt = randomTxt + sourceTxt.charAt(Math.floor(Math.random() * sourceTxt.length));

                    trace("if内 randomTxt : " + randomTxt);

                        // continue;
                } else {
                    trace("もうカウントしない");
                    trace("sliceCnt:" + sliceCnt);
                }

                randomTxt = randomTxt + targetText.charAt(i);
                trace("for内 randomTxt : " + randomTxt);

            }

            targetFld.text = randomTxt;
            trace("targetFld.text : " + targetFld.text);

            if (randomTxt == targetText) {
                trace("一致したので終了");
                content.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
            }

            trace("■エンターフレーム終了" + "\n" + "\n");

        }

    }

}
