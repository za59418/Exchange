package com.zxl.model.translate
{
	[RemoteClass(alias="ZXL.Exchange.Service.Translate.TranslateVO")]
	[Bindable]
	public class TranslateVO
	{
		public function TranslateVO()
		{
		}
		public var PointID:int;
		public var PointName:String;
		public var PointAddress:String;
		public var ContactPerson:String;
		public var Tel:String;
	}
}