package com.zxl.model.point
{
	import com.zxl.NotificationConstants;
	import com.zxl.model.ApplicationProxy;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	[Bindable]
	public class PointProxy extends ApplicationProxy
	{
		public static const NAME:String = "PointProxy";
		public function PointProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
			_remoteObject.source = "ZXL.Exchange.Service.Point.PointService"; 
		}
		
		public function GetPointList():void
		{
			_remoteObject.getOperation("GetPointList").send();
			_remoteObject.addEventListener(ResultEvent.RESULT,GetPointListSuccessHandler);
			_remoteObject.addEventListener(FaultEvent.FAULT,FaultHandler); 
		}
		
		public function AddPoint(vo:PointVO):void
		{
			_remoteObject.getOperation("AddPoint").send(vo);
			_remoteObject.addEventListener(FaultEvent.FAULT,FaultHandler); 
		}
		
		private function FaultHandler(e:FaultEvent):void
		{
			trace(e.fault.toString())
		}
		
		private function GetPointListSuccessHandler(e:ResultEvent):void
		{
			var list:ArrayCollection = e.result  as ArrayCollection;
			sendNotification(NotificationConstants.PointCollectionLoadCompleted,list);
		}
	}
}