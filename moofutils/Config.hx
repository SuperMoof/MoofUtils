package moofutils;
import haxe.xml.Fast;
import openfl.Assets;

/**
 * ...
 * @author ...
 */
class Config
{
	private static var _instance : Config;
	private var _vars : Map<String, String>;
		
	public static function initialize()
	{
		_instance = new Config();
	}
	
	public static function get() : Config
	{
		Debug.assert(_instance != null, "Attempting to access Config object before it's initialized");
		
		return _instance;
	}
	
	private function new() 
	{
		_vars = new Map<String, String>();
		
		var file = Assets.getText("assets/config.cfg");
		if (file != null)
		{
			var lines = file.split("\n");
			for (line in lines)
			{
				var tokens = line.split("=");
				if (tokens.length == 2)
				{	
					var key = StringTools.trim(tokens[0]);
					key = key.toLowerCase();
					
					var value = StringTools.trim(tokens[1]);
					value = value.toLowerCase();
					
					_vars.set(key, value);
				}
			}
		}
	}
	
	public function GetValueString(key : String) : String
	{
		return _vars[key.toLowerCase()];
	}
	
	public function GetValueInt(key : String) : Int
	{
		return Std.parseInt(_vars[key.toLowerCase()]);
	}
}