package com.zxl.model.user
{
	[RemoteClass(alias="ZXL.Exchange.Service.User.UserVO")]
	[Bindable]
	public class UserVO
	{
		public function UserVO()
		{
		}
		public var PointID:int;
		public var PointName:String;
		public var PointAddress:String;
		public var ContactPerson:String;
		public var Tel:String;
	}
}