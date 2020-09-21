/**
 * Copyright ukkr ( http://wonderfl.net/user/ukkr )
 * MIT License ( http://www.opensource.org/licenses/mit-license.php )
 * Downloaded from: http://wonderfl.net/c/4rn8
 */

package {
	import flash.display.*;
	import flash.text.*;
	import flash.events.*;
	
	public class DocumentClass extends MovieClip {
		private var _st1:SequentialText;
		private var _tfm:TextFormat;
		
		//コンストラクタ
		public function DocumentClass() {
			_st1 = new SequentialText( "Adobe Creative Suite 4 Design Premium - Shortcut to Brilliant" );
			_tfm = new TextFormat();
			_tfm.size = 10;
                        _tfm.bold = true;
			_tfm.color = 0x000000;
			_tfm.font = "_sans";
			_tfm.align = TextFormatAlign.LEFT;
			
			_st1.tf.defaultTextFormat = _tfm;
			_st1.tf.autoSize = TextFieldAutoSize.LEFT;
			_st1.x = 20;
			_st1.y = 15;
			addChild( _st1 );
			_st1.init();
			_st1.bg.addEventListener( MouseEvent.MOUSE_OVER, mouseOverHandler );
		}
		
		private function mouseOverHandler( e:MouseEvent ):void {
			_st1.init();
		}
	}
}

import flash.display.*;
import flash.text.*;
import flash.events.*;
class SequentialText extends Sprite {
	public var tf:TextField;
	public var bg:Sprite;

	private var _targetStr:String;
	private var _strLength:int;
	private var _randomStr:String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-^";
	private var _inputStr:String = "";
	private var _index:int;
	private var _indexList:Array;
	private var _strList:Array;
	private var _randomTurns:int = 10;
	private var _inputManagerList:Array = [];
	private var _isInit:Boolean = false;

	//コンストラクタ
	public function SequentialText( str:String ) {
		tf = new TextField();
		tf.x = 2;
		addChild( tf );
		bg = new Sprite();
		_targetStr = str;
		_strLength = _targetStr.length;
	}

	//初期化
	public function init():void {
		tf.text = "";
		_inputStr = "";
		_index = 0;
		_indexList = [];
		_strList = [];
		for ( var i:int = 0; i < _strLength; i++ ) {
			_indexList[ i ] = _randomTurns;
			_strList[ i ] = "";
		}
		
		//初期化以降はリスナーを予め消去
		if ( _isInit == true ) {
			removeEventListener( Event.ENTER_FRAME, updateString );
			removeEventListener( Event.ENTER_FRAME, sequentialInput );
			for ( var j:int = 0; j < _strLength; j++ ) {
				_inputManagerList[ j ].removeEventListener( Event.ENTER_FRAME, randomInput );
			}
		}
		addEventListener( Event.ENTER_FRAME, updateString );
		addEventListener( Event.ENTER_FRAME, sequentialInput );
	}

	private function updateString( e:Event ):void {
		_inputStr = "";
		for ( var i:int = 0; i < _strLength; i++ ) {
			_inputStr += _strList[ i ];
		}
		tf.text = _inputStr;
	}

	private function sequentialInput( e:Event ):void {
		if ( _index < _strLength ) {
			initRandomInput( _index );
			_index++;
		} else {
			removeEventListener( Event.ENTER_FRAME, sequentialInput );
		}
	}

	private function initRandomInput( targetIndex:int = 0 ):void {
		if( _isInit == false ) {
			_inputManagerList[ targetIndex ] = new MovieClip();
		}
		_inputManagerList[ targetIndex ].index = targetIndex;
		_inputManagerList[ targetIndex ].addEventListener( Event.ENTER_FRAME, randomInput );
	}

	private function randomInput( e:Event ):void {
		var currentIndex:int = e.target.index;
		if ( _indexList[ currentIndex ] > 0 ) {
			_indexList[ currentIndex ]--;
			_strList[ currentIndex ] = _randomStr.substr( Math.floor( _randomStr.length * Math.random() ), 1 );
		} else {
			_strList[ currentIndex ] = _targetStr.charAt( currentIndex );
			_inputManagerList[ currentIndex ].removeEventListener( Event.ENTER_FRAME, randomInput );
			if ( currentIndex >= ( _strLength - 1 ) && _index >= _strLength ) {
				removeEventListener( Event.ENTER_FRAME, updateString );
				tf.text = _targetStr;
				
				if ( _isInit == false ) {
					bg.graphics.beginFill( 0xffffff, 0 );
					bg.graphics.drawRect( 0, 0, tf.width + 4, tf.height );
					bg.graphics.endFill();
					addChild( bg );
					_isInit = true;
				}
			}
		}
	}
}