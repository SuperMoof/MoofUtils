package moofutils.ui;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxPoint;
import moofutils.input.IInputListener;

/**
 * ...
 * @author ...
 */
class Button extends Element implements IInputListener
{
	private var _sprite : FlxSprite;
	private var _down : Bool = false;
	private var _callback : Void->Void;
	
	public function new(bitmapName : String, callback : Void->Void)
	{
		super();
		
		var path = "ui/buttons/" + bitmapName;
		var graphics = FlxG.bitmap.add(path);
		_sprite = new FlxSprite();
		var numFrames = 2; // up, down
		_sprite.loadGraphic(graphics, true, graphics.bitmap.width, Math.floor(graphics.bitmap.height / numFrames));
		add(_sprite);
		
		_callback = callback;
	}
	
	public function onPointDown(point : FlxPoint) : Void
	{
		setDown(containsPoint(point));
	}
	
	public function onPointUp(point : FlxPoint) : Void
	{
		if (_down)
		{
			onPressed();
		}
		setDown(false);
	}
	
	public function onPointMove(point : FlxPoint) : Void
	{
		setDown(containsPoint(point));
	}
	
	private function setDown(down : Bool) : Void
	{
		_sprite.animation.frameIndex = down ? 1 : 0;
		_down = down;
	}
	
	private function onPressed()
	{
		_callback();
	}
}