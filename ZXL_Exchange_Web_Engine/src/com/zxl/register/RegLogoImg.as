package com.zxl.register
{
	public class RegLogoImg
	{
		public function RegLogoImg()
		{
		}
		
		[Bindable] 
		[Embed(source='assets/logoleft.png')] 
		public static var logoleft:Class;

		[Bindable] 
		[Embed(source='assets/logocenter.png')] 
		public static var logocenter:Class;

		[Bindable] 
		[Embed(source='assets/logoright.png')] 
		public static var logoright:Class;
		
		[Bindable] 
		[Embed(source='assets/toolbartop.png')] 
		public static var toolbartop:Class;
		
		[Bindable] 
		[Embed(source='assets/toolbarbottom.png')] 
		public static var toolbarbottom:Class;
	}
}