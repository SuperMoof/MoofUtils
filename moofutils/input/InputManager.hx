package moofutils.input;

import moofutils.ui.Element;
import moofutils.input.IInputListener;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class InputManager
{
	private static var _instance : InputManager;
	
	private var _listeners : Array<IInputListener>;
	
	public static function get() : InputManager
	{
		if (_instance == null)
		{
			_instance = new InputManager();
		}
		
		return _instance;
	}
	
	public function update()
	{
		#if mobile
		touchUpdate();
		#else
		mouseUpdate();
		#end
	}
	
	public function addListener(element : IInputListener)
	{
		_listeners.push(element);
	}
	
	public function removeListener(element : IInputListener)
	{
		_listeners.remove(element);
	}
	
	private function new()
	{
		_listeners = new Array<IInputListener>();
	}
	
	private function touchUpdate()
	{
		
	}
	
	private function mouseUpdate()
	{
		if (FlxG.mouse.justPressed)
		{
			for (listener in _listeners)
			{
				listener.onPointDown(FlxG.mouse.getScreenPosition());
			}
		}
		
		if (FlxG.mouse.justReleased)
		{
			for (listener in _listeners)
			{
				listener.onPointUp(FlxG.mouse.getScreenPosition());
			}			
		}
		
		if (FlxG.mouse.pressed && !FlxG.mouse.justPressed)
		{
			for (listener in _listeners)
			{
				listener.onPointMove(FlxG.mouse.getScreenPosition());
			}
		}
	}
}