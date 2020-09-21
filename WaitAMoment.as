package {

    import flash.display.Sprite;
    import flash.events.TimerEvent;
    import flash.utils.Timer;
    import flash.display.MovieClip;
    import flash.utils.getTimer;

    public class WaitAMoment extends Sprite {

        private static var wait_time:int; // 停止する時間受け取り
        private static var use_label:String = ""; // ラベルを使う時の飛び先（ラベル名）受け取り
        private static var _this:Object; // タイムラインの参照受け取り
        private static var my_w_timer:Timer;
        private static var testTime:int; // 実際の経過時間確認用

        public function WaitAMoment():void {
            trace("WaitAMoment");
        }

        public static function wait(e:int, e2:Object, e3:Object = null):void {
            trace("wait");
            wait_time = e;
            _this = e2;
            trace("_this : " + _this);
            trace("wait_time : " + wait_time);
            if (e3 != null) {
                use_label = String(e3); // ラベルを使う場合、ラベル名前に指定
            }
            my_w_timer = new Timer(wait_time, 1);
            my_w_timer.addEventListener(TimerEvent.TIMER, newTimer, false, 0, true);
            my_w_timer.addEventListener(TimerEvent.TIMER_COMPLETE, newTimerComplete, false, 0, true);
            my_w_timer.start();
            testTime = getTimer(); // 確認用
        }

        private static function newTimer(e:TimerEvent):void {
            trace("newTimer");
            trace("e:" + e);
        }

        private static function newTimerComplete(e:TimerEvent):void {
            trace("newTimerComplete");
            trace("e:" + e);
            trace("経過時間は" + String(getTimer() - testTime)); // 確認用
            my_w_timer.removeEventListener(TimerEvent.TIMER, newTimer);
            my_w_timer.removeEventListener(TimerEvent.TIMER_COMPLETE, newTimerComplete);
            if (use_label != "") {
                _this.gotoAndPlay(use_label); // ラベル使用
            } else {
                _this.play(); // ラベル不使用
            }
        }

    }

}
