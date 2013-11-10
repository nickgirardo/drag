package;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;
import openfl.Assets;

import flash.Lib;

import drag.*;

class Main extends Sprite {
	
	private var container:DragGroup;

	private var Board:Sprite;
	
	private var cacheOffsetX:Float;
	private var cacheOffsetY:Float;
	
	
	public function new () {
		
		super ();

		
		Board = new Sprite ();
		Board.addChild (new Bitmap (Assets.getBitmapData ("assets/img/Board.png")));
		Board.x = (Lib.current.stage.stageWidth-Board.width)/2;
		Board.y = (Lib.current.stage.stageHeight-Board.height)/2;
		addChild (Board);

		container = new DragGroup(this);
		loadObjects("assets/data/setup.json", container, Board);
		addChild (container);

	}


	public function loadObjects(url:String, container:DragGroup, Board:Sprite) {
		var data = Util.loadLocalFileToJson(url).objects;
		trace(data[0]);		//Fails to compile without this line for some reason

		for (i in 0...data.length) {
			var o:Dynamic = data[i];
			
			switch (o.name) {
				case "bPawn" :
					var p = new Draggable("assets/img/bP.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "wPawn" :
					var p = new Draggable("assets/img/wP.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "bRook" :
					var p = new Draggable("assets/img/bR.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "wRook" :
					var p = new Draggable("assets/img/wR.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "bKnight" :
					var p = new Draggable("assets/img/bN.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "wKnight" :
					var p = new Draggable("assets/img/wN.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "bBishop" :
					var p = new Draggable("assets/img/bB.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "wBishop" :
					var p = new Draggable("assets/img/wB.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "bQueen" :
					var p = new Draggable("assets/img/bQ.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "wQueen" :
					var p = new Draggable("assets/img/wQ.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "bKing" :
					var p = new Draggable("assets/img/bK.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				case "wKing" :
					var p = new Draggable("assets/img/wK.png");
					p.group = container;
					container.add(p);
					p.x = o.x*Board.width/8+Board.x;
					p.y = o.y*62+Board.y;
					container.addChild(p);
				default :
					throw("Incorrect object name " + o.name);
			}	
		}
	}	


}
