package com.zxl.model.user
{
	import com.zxl.NotificationConstants;
	import com.zxl.model.ApplicationProxy;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	[Bindable]
	public class UserProxy extends ApplicationProxy
	{
		public static const NAME:String = "UserProxy";
		public function UserProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
			_remoteObject.source = "ZXL.Exchange.Service.User.UserService"; 
		}
		
		public function GetUserList():void
		{
			_remoteObject.getOperation("GetUserList").send();
			_remoteObject.addEventListener(ResultEvent.RESULT,GetUseristSuccessHandler);
			_remoteObject.addEventListener(FaultEvent.FAULT,FaultHandler); 
		}
		
		private function FaultHandler(e:FaultEvent):void
		{
			trace(e.fault.toString())
		}
		
		private function GetUseristSuccessHandler(e:ResultEvent):void
		{
			var list:ArrayCollection = e.result  as ArrayCollection;
			sendNotification(NotificationConstants.UserCollectionLoadCompleted,list);
		}
	}
}