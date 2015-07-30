package com.zxl.model.business
{
	import com.zxl.NotificationConstants;
	import com.zxl.model.ApplicationProxy;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	[Bindable]
	public class BusinessProxy extends ApplicationProxy
	{
		public static const NAME:String = "BusinessProxy";
		public function BusinessProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
			_remoteObject.source = "ZXL.Exchange.Service.Business.BusinessService"; 
		}
		
		public function GetBusinessList():void
		{
			_remoteObject.getOperation("GetBusinessList").send();
			_remoteObject.addEventListener(ResultEvent.RESULT,GetBusinessListSuccessHandler);
			_remoteObject.addEventListener(FaultEvent.FAULT,FaultHandler); 
		}
		
		private function FaultHandler(e:FaultEvent):void
		{
			trace(e.fault.toString())
		}
		
		private function GetBusinessListSuccessHandler(e:ResultEvent):void
		{
			var list:ArrayCollection = e.result  as ArrayCollection;
			sendNotification(NotificationConstants.BusinessCollectionLoadCompleted,list);
		}
	}
}