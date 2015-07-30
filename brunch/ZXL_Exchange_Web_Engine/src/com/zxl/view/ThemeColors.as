package com.zxl.view
{
	public class ThemeColors
	{
		public static var Theme:String="GreenBlue";
		
		public static function get popupWindowHeaderColor():uint
		{
			var color:uint;
			switch(Theme)
			{
				case "GreenBlue":
				{
					color = 0x91baf0;
					break;
				}
				case "Green":
				{
					color = 0x97ff91;
					break;
				}
				case "Red":
				{
					color = 0xffa4a4;
					break;
				}
				default:
				{
					color = 0x91baf0;
					break;
				}
			}
			return color;
		}
		public static function get popupWindowBorderColor():uint
		{
			var color:uint;
			switch(Theme)
			{
				case "GreenBlue":
				{
					color = 0x91baf0;
					break;
				}
				case "Green":
				{
					color = 0x97ff91;
					break;
				}
				case "Red":
				{
					color = 0xffa4a4;
					break;
				}
				default:
				{
					color = 0x91baf0;
					break;
				}
			}
			return color;
		}
		public static function get popupWindowBgColor():uint
		{
			var color:uint;
			switch(Theme)
			{
				case "GreenBlue":
				{
					color = 0xF5F5F5;
					break;
				}
				case "Green":
				{
					color = 0xF5F5F5;
					break;
				}
				case "Red":
				{
					color = 0xF5F5F5;
					break;
				}
				default:
				{
					color = 0xF5F5F5;
					break;
				}
			}
			return color;
		}
		
	}
}