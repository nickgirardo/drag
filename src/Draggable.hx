package drag;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Sprite;
import flash.events.MouseEvent;
import openfl.Assets;

import flash.Lib;


class Draggable extends Sprite {

	public var constrainX:Bool;	//If true won't drag along x axis
	public var constrainY:Bool;	//If true won't drag along y axis

	public var minX:Int;	//Optional constraints
	public var maxX:Int;
	public var minY:Int;
	public var maxY:Int;	

	public var group:DragGroup;	//Drag group of which this is a member
	public var active:Bool;		//Wether the object is active (aka being dragged)

	private var cacheOffsetX:Float;	//Offsets for dragging
	private var cacheOffsetY:Float;

	public var bitmapD:BitmapData;	//This objects bitmapdata
	

	public function new(url:String) {
		super();

		this.addChild(new Bitmap(Assets.getBitmapData(url)));	//Load bitmap from given url
		this.bitmapD = Assets.getBitmapData(url);				//Load bitmapdata from given url

		minX = 0;							//Default constraints
		maxX = Lib.current.stage.stageWidth;

		minY = 0;							//Default constraints
		maxY = Lib.current.stage.stageHeight;
	}

	/*
	*Sets a point offset of smooth dragging
	*/

	public function cachePoint (_x, _y):Void {
		cacheOffsetX = this.x - _x;
		cacheOffsetY = this.y - _y;
	}

	/*
	*In a transparent bitmap, returns true unless the given point is entirely transparent
	*/

	public function pointSolid (_x, _y):Bool {
		return (bitmapD.getPixel32(_x, _y)>>24 != 0);
	}

	/*
	*Updates the position of the draggable object
	*
	*The x or y position can be constrained by booleans constrainX or constrainY respectively
	*The rest of the function makes sure that the the x and y stay within the
	*optional bounds of minX, minY, maxX and maxY
	*
	*/

	public function positionUpdate (_x, _y):Void {
		if (!constrainX) {
			if(_x + cacheOffsetX < minX) {
				x = minX;
			} else if (_x + cacheOffsetX + width > maxX) {
				x = maxX - width;
			} else {
				x = _x + cacheOffsetX;
			}
		}
		if (!constrainY) {
			if(_y + cacheOffsetY < minY) {
				y = minY;
			} else if (_y + cacheOffsetY + height > maxY) {
				y = maxY - height;
			} else {
				y = _y + cacheOffsetY;
			}
		}
	}


	/*
	*Checks if a given point exists within the objects bounding box
	*/
	public function  containsPoint (_x, _y):Bool {
		if(x > _x) {
			return false;
		}
		if(x + width < _x) {
			return false;
		}
		if(y > _y) {
			return false;
		}
		if(y + height < _y) {
			return false;
		}

		return true;
	}

	/*
	*Declares the object is no longer active
	*This handler then removes itself to not need to be called unnessacarily
	*/

	public function onMouseUp (event:MouseEvent):Void {

		active = false;
		
		this.removeEventListener (MouseEvent.MOUSE_UP, onMouseUp);
		
	}





}
