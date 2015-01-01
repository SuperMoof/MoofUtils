package moofutils.input;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
interface IInputListener
{
	public function onPointDown(point : FlxPoint) : Void;
	public function onPointUp(point : FlxPoint) : Void;
	public function onPointMove(point : FlxPoint) : Void;
}