package moofutils.ui;
import flixel.FlxState;
import moofutils.input.InputManager;

/**
 * ...
 * @author ...
 */
class State extends FlxState
{
	
	private var _container : Container;

	override public function create() : Void
	{
		super.create();
		
		_container = new Container(Screen.get().resolution);
		add(_container);
	}
	
	override public function update() : Void
	{
		InputManager.get().update();
	}
}