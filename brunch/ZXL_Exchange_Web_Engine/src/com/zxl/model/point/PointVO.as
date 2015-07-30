package com.zxl.model.point
{
	[RemoteClass(alias="ZXL.Exchange.Service.Point.PointVO")]
	[Bindable]
	public class PointVO
	{
		public function PointVO()
		{
		}
		public var PointID:int;
		public var PointName:String;
		public var PointAddress:String;
		public var ContactPerson:String;
		public var Tel:String;
	}
}