package {

    import flash.display.MovieClip;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    public class RandomTextTest extends MovieClip {

        private var randomText:RandomText;

        // コンストラクタ
        public function RandomTextTest():void {

            trace("this:" + this); // this:[object RandomTextTest]

            // 参照渡し、ターゲットテキストフィールド、回数は正解出す前に何回ループさせるか、になる。ステップ＝time（100）+文字数（5）=105ループ
            randomText = new RandomText(this, test_txt, 10);

            // シャフルスタート
            randomText.start();

            // ロールオーバー時も
            test_txt.addEventListener(MouseEvent.ROLL_OVER, onRollover);

        }

        private function onRollover(e:MouseEvent):void {
            // ロールオーバーでも再スタート（シャッフル中ならフラグで判別してスタートさせないとか？）
            randomText.start();
        }

    }

}

