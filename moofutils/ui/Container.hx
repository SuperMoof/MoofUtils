package moofutils.ui;
import flixel.group.FlxGroup;
import flixel.util.FlxPoint;
import moofutils.ui.Element;

/**
 * ...
 * @author ...
 */
class Container extends Element
{
	private var _size : FlxPoint;
	
	public function new(size : FlxPoint)
	{
		super();
		_size = size;
	}
	
	public function addElement(element : Element, position : FlxPoint, anchor : AnchorPoint)
	{
		add(element);
		
		var anchorPoint = new FlxPoint();
		switch (anchor.horizontalAlignment)
		{
			case HorizontalAlignment.LEFT:
				element.origin.x = 0;
				anchorPoint.x = 0;
			case HorizontalAlignment.CENTER:
				element.origin.x = element.width / 2;
				anchorPoint.x = _size.x / 2;
			case HorizontalAlignment.RIGHT:
				element.origin.x = element.width;
				anchorPoint.x = _size.x;
		}
		switch (anchor.verticalAlignment)
		{
			case VerticalAlignment.TOP:
				element.origin.y = 0;
				anchorPoint.y = 0;
			case VerticalAlignment.CENTER:
				element.origin.y = element.height / 2;
				anchorPoint.y = _size.y / 2;
			case VerticalAlignment.BOTTOM:
				element.origin.y = element.height;
				anchorPoint.y = _size.y;
		}
		
		position.addPoint(anchorPoint);
		position.subtractPoint(element.origin);
		element.setPosition(position.x, position.y);
		
		element.onAdd();
	}
}