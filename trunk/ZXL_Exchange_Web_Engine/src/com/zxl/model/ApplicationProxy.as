package com.zxl.model
{
	
	import com.zxl.library.Alert.ZxlAlert;
	
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class ApplicationProxy extends Proxy implements IProxy
	{
		protected var _remoteObject:RemoteObject = null;
		
		public function ApplicationProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
			
			_remoteObject = new RemoteObject("fluorine");
			_remoteObject.addEventListener(FaultEvent.FAULT, faultHandler);
		}
		
		protected function faultHandler(event:FaultEvent):void
		{
			ZxlAlert.show(event.fault.toString(),"程序错误");
		}
	}
}