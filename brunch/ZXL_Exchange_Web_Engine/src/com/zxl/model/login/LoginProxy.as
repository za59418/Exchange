package com.zxl.model.login
{
	import com.zxl.NotificationConstants;
	
	import org.puremvc.as3.interfaces.IProxy;
	import org.puremvc.as3.patterns.proxy.Proxy;

	public class LoginProxy extends Proxy implements IProxy
	{
		public static const NAME:String = "LoginProxy";
		
		public function LoginProxy(proxyName:String=null, data:Object=null)
		{
			super(proxyName, data);
		}
		
		public function loadAllUsers():void
		{
			data = new Array();
			data.push(new UserVO("admin","admin"));
			data.push(new UserVO("zxl","123456"));
			
			sendNotification(NotificationConstants.LOAD_ALL_USERS,data);
		}
		
	}
}