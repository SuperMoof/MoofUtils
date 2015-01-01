package moofutils.ui;

import flixel.FlxG;
import flixel.util.FlxPoint;
import haxe.io.Error;

/**
 * ...
 * @author ...
 */
class Screen
{
	private static var _instance : Screen;
	
	public var resolution(default, null) : FlxPoint;
	
	public static function initialize(designResolution : FlxPoint)
	{
		_instance = new Screen(designResolution);
	}
	
	public static function get() : Screen
	{
		Debug.assert(_instance != null, "Attempting to access Screen object before it's initialized");
		
		return _instance;
	}
	
	private function new(res : FlxPoint)
	{
		resolution = res;
	}
}