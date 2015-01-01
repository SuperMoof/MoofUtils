package moofutils.ui;
import moofutils.ui.Element;

/**
 * ...
 * @author ...
 */

class AnchorPoint
{
	public var verticalAlignment(default, null) : VerticalAlignment;
	public var horizontalAlignment(default, null) : HorizontalAlignment;

	public function new(vertical : VerticalAlignment, horizontal : HorizontalAlignment) 
	{
		verticalAlignment = vertical;
		horizontalAlignment = horizontal;
	}
	
}