package moofutils;

/**
 * ...
 * @author ...
 */
class Debug
{
	#if ENABLE_ERRORS
	public static function assert(conditional : Bool, msg : String, ?pos : haxe.PosInfos)
	{
		if (!conditional)
		{
			Log.error(msg, pos);
		}
	}
	#else
	public static inline function assert(conditional : Bool, msg : String, ?pos : haxe.PosInfos) { }
	#end
}