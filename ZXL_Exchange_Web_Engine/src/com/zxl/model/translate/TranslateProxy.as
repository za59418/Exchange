package com.zxl.model.translate
{
	import com.zxl.NotificationConstants;
	import com.zxl.model.ApplicationProxy;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	[Bindable]
	public class TranslateProxy extends ApplicationProxy
	{
		public static const NAME:String = "TranslateProxy";
		public function TranslateProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
			_remoteObject.source = "ZXL.Exchange.Service.Translate.TranslateService"; 
		}
		
		public function GetTranslateList():void
		{
			_remoteObject.getOperation("GetTranslateList").send();
			_remoteObject.addEventListener(ResultEvent.RESULT,GetTranslateListSuccessHandler);
			_remoteObject.addEventListener(FaultEvent.FAULT,FaultHandler); 
		}
		
		private function FaultHandler(e:FaultEvent):void
		{
			trace(e.fault.toString())
		}
		
		private function GetTranslateListSuccessHandler(e:ResultEvent):void
		{
			var list:ArrayCollection = e.result  as ArrayCollection;
			sendNotification(NotificationConstants.TranslateCollectionLoadCompleted,list);
		}
	}
}