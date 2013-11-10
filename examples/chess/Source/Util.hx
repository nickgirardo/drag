// File reading
import haxe.io.Eof;
import sys.io.File;

// JSON related
import haxe.Json;

class Util {


	public static inline function loadLocalFileToString(url:String):String {
		return sys.io.File.getContent(url);
	}

	public static inline function loadLocalFileToJson(url:String) {
		return haxe.Json.parse(loadLocalFileToString(url));
	}

	public static inline function loadLocalFileToArray(url:String) {
		return toArray(loadLocalFileToString(url));
	}

	public static function toArray(dataStr:String) {
		var ret:Array<Int> = new Array();

		while(dataStr.length > 0 && dataStr.indexOf(',') != -1) {
			ret.push(Std.parseInt(dataStr.substring(0,dataStr.indexOf(','))));

			dataStr = dataStr.substr(dataStr.indexOf(',')+1);

		}

		return ret;
	}



}