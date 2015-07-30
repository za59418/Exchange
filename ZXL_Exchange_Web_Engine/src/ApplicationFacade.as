package
{
	import com.zxl.controller.LoginCommand;
	import com.zxl.controller.StartUpCommand;
	
	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	
	
	public class ApplicationFacade extends Facade implements IFacade
	{
		public static const APP_STARTUP:String = "AppStartup";
		public static const APP_LOGIN:String = "AppLogin";
		
		public static function getInstance() : ApplicationFacade
		{
			if(null == instance)
			{
				instance = new ApplicationFacade();
			}
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			super.initializeController();
			registerCommand(APP_STARTUP,StartUpCommand);
			registerCommand(APP_LOGIN,LoginCommand);
		}
		
		public function startup(app:Object):void
		{
			sendNotification(APP_STARTUP,app);
		}

	}
}