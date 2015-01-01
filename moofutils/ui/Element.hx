package moofutils.ui;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxPoint;
import moofutils.input.InputManager;
import moofutils.input.IInputListener;

/**
 * ...
 * @author ...
 */

enum VerticalAlignment
{
	TOP;
	CENTER;
	BOTTOM;
}

enum HorizontalAlignment
{
	LEFT;
	CENTER;
	RIGHT;
}
 
class Element extends FlxSpriteGroup
{
	private var _isInputListener : Bool = false;
	
	public function new()
	{
		super();
	}
	
	public function onAdd() : Void
	{
		if (Std.is(this, IInputListener))
		{
			InputManager.get().addListener(cast(this, IInputListener));
		}
	}
	
	public override function destroy() : Void
	{
		if (Std.is(this, IInputListener))
		{
			InputManager.get().removeListener(cast(this, IInputListener));
		}
		
		super.destroy();
	}
	
	private function containsPoint(point : FlxPoint) : Bool
	{
		if (point.x < x) return false;
		if (point.x > x + width) return false;
		if (point.y < y) return false;
		if (point.y > y + height) return false;
		
		return true;
	}
}