package 
{
	import flash.display.DisplayObjectContainer;
	import flash.text.TextField;
	import flash.events.Event;
	
	public class RandomText 
	{
		private var sourceTxt:String = "_/-=+%&$#!?ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		private var content:DisplayObjectContainer;
		private var targetFld:TextField;
		private var targetText:String;
		private var sliceCnt:int;
		private var playTime:uint;
		
		public function RandomText(content:DisplayObjectContainer, targetFld:TextField, time:uint)
		{
			this.content = content;
			this.targetFld = targetFld;
			playTime = time;
			targetText = targetFld.text;
		}
		
		public function start():void
		{
			targetFld.text = "";
			sliceCnt = 0;
			content.addEventListener(Event.ENTER_FRAME, onEnterFrame);	
		}
		
		private function onEnterFrame(e:Event):void 
		{
			++sliceCnt;
			var randomTxt:String = "";
			
			for (var i = 0; i < targetText.length; ++i)
			{
				if (sliceCnt - playTime < i)
				{
					randomTxt = randomTxt+sourceTxt.charAt(Math.floor(Math.random()*sourceTxt.length));
					continue;
				}
				randomTxt = randomTxt+targetText.charAt(i);
			}
			
			targetFld.text = randomTxt;
			if (randomTxt == targetText)
			{
				content.removeEventListener(Event.ENTER_FRAME, onEnterFrame);	
			}
		}
		
	}
	
}