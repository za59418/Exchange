package com.zxl.view.login
{
	import com.zxl.NotificationConstants;
	import com.zxl.library.Alert.ZxlAlert;
	import com.zxl.model.login.UserVO;
	
	import flash.events.MouseEvent;
	
	import mx.containers.Canvas;
	import mx.controls.Button;
	import mx.controls.TextInput;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class LoginMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "LoginMediator";
		public var allUsers:Array = null;
		
		public function LoginMediator(mediatorName:String=null, viewComponent:Object=null)
		{
			super(mediatorName, viewComponent);
			(viewComponent.btnlogin as Button).addEventListener(MouseEvent.CLICK,loginHandler);
			(viewComponent.btnreset as Button).addEventListener(MouseEvent.CLICK,resetHandler);
		}
		
		public function loginHandler(event:MouseEvent):void
		{
			sendNotification(NotificationConstants.LOGIN);
		}
		
		public function resetHandler(event:MouseEvent):void
		{
			ZxlAlert.show("reset clicked");
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				NotificationConstants.LOAD_ALL_USERS,
				NotificationConstants.LOGIN
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName()){
				case NotificationConstants.LOAD_ALL_USERS:
					allUsers = notification.getBody() as Array;
					break;
				case NotificationConstants.LOGIN:
					for each(var user:UserVO in allUsers)
					{
						if(user.Username == (viewComponent.username as TextInput).text
							&& user.Password == (viewComponent.password as TextInput).text )
						{
							var obj:Object = Login.getChild("home");
							Login.viewStack.selectedChild = obj as Canvas;
						}
					}
					break;
					
			}
		}
	}
}