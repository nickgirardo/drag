package drag;

import flash.events.MouseEvent;
import flash.display.Sprite;
import flash.display.Bitmap;

import openfl.Assets;


class DragGroup extends Sprite {

	public var members:Array<Draggable>;
	public var domain:Sprite;

	public function new(domain:Sprite) {
		super();
		members = new Array();

		addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
		domain.addEventListener(MouseEvent.MOUSE_MOVE, mouseMoved);

	}

	public function add(e:Draggable) {
		members.push(e);
	}


	public function mouseMoved(m:MouseEvent) {
		for(e in members) {
			if(e.active) {
				e.positionUpdate(m.stageX, m.stageY);
			} 
		}

	}

	public function moveToFront (e) {
		members.remove(e);
		members.unshift(e);


		setChildIndex(e, numChildren-1);
	}

	public function mouseDown(event:MouseEvent) {
		var _x = Std.int(event.stageX);
		var _y = Std.int(event.stageY);

		for(e in members) {
			if(e.containsPoint(_x, _y) && e.pointSolid(Std.int(_x-e.x), Std.int(_y-e.y))) {
					e.active = true;
					e.cachePoint(_x, _y);
					e.addEventListener(MouseEvent.MOUSE_UP, e.onMouseUp);
					moveToFront(e);
					return;
			}
		}
	}

}
