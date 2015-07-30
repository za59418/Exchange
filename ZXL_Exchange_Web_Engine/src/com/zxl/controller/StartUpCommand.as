package com.zxl.controller
{
	import com.zxl.model.login.LoginProxy;
	import com.zxl.view.login.Login;
	import com.zxl.view.login.LoginMediator;
	
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;

	public class StartUpCommand extends SimpleCommand implements ICommand
	{
		public function StartUpCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			var app:Login = notification.getBody() as Login;
			
			facade.registerProxy(new LoginProxy(LoginProxy.NAME));
			
			facade.registerMediator(new LoginMediator(
				LoginMediator.NAME,
				{
					username:app.username,
					password:app.password,
					btnreset:app.btnReset,
					btnlogin:app.btnlogin
				}
			));
			
			sendNotification(ApplicationFacade.APP_LOGIN,app);
		}
		
	}
}