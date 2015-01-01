package moofutils;

import flash.Lib;
import haxe.CallStack;
import haxe.PosInfos;

/**
 * ...
 * @author ...
 */
class Log
{
	#if ENABLE_LOGGING
	public static function message(msg : String, ?pos : haxe.PosInfos)
	{
		flash.Lib.trace(getPosString(pos) + msg);
	}
	#else
	public static inline function message(msg : String, ?pos : haxe.PosInfos) { }
	#end
	
	#if ENABLE_LOGGING
	public static function warning(msg : String, ?pos : haxe.PosInfos)
	{
		flash.Lib.trace("WARNING " + getPosString(pos) + msg);
	}
	#else
	public static inline function warning(msg : String, ?pos : haxe.PosInfos) { }
	#end
	
	#if ENABLE_ERRORS
	public static function error(msg : String, ?pos : haxe.PosInfos)
	{
		printStack();
		throw getPosString(pos) + msg;
	}
	#else
	public static inline function error(msg : String, ?pos : haxe.PosInfos) { }
	#end
	
	public static function printStack()
	{
		var stack = CallStack.callStack();
		stack.reverse();
		stack.pop();
		flash.Lib.trace(CallStack.toString(stack));		
	}
	
	private static function getPosString(pos : PosInfos) : String
	{
		return pos.className + "::" + pos.methodName + " (" + pos.lineNumber + "): ";
	}
}