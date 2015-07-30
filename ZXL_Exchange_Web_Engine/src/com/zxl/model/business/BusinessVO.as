package com.zxl.model.business
{
	[RemoteClass(alias="ZXL.Exchange.Service.Business.BusinessVO")]
	[Bindable]
	public class BusinessVO
	{
		public function BusinessVO()
		{
		}
		public var PointID:int;
		public var PointName:String;
		public var PointAddress:String;
		public var ContactPerson:String;
		public var Tel:String;
	}
}