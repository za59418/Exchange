package com.zxl.view.user
{
	import com.zxl.NotificationConstants;
	import com.zxl.library.Alert.ZxlAlert;
	import com.zxl.model.user.UserProxy;
	import com.zxl.model.user.UserVO;
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class UserMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "UserMediator";
		public var _proxy:UserProxy = null;
		public var _view:UserView = null;
		
		public function UserMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			_proxy = new UserProxy(UserProxy.NAME);
			_view = viewComponent.View as UserView;
			_view.addUser.addEventListener(MouseEvent.CLICK,addUserHandler);
			_view.editUser.addEventListener(MouseEvent.CLICK,editUserHandler);
			_proxy.GetUserList();
		}
		
		public function addUserHandler(e:MouseEvent):void
		{
			var editView:UserEditView = new UserEditView();
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		public function editUserHandler(e:MouseEvent):void
		{
			if(null==_view.dataGrid.selectedItem)
			{
				ZxlAlert.show("请选择你要编辑的用户!","错误");
				return;
			}
			var editView:UserEditView = new UserEditView();
			editView.userVO = _view.dataGrid.selectedItem as UserVO;
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				NotificationConstants.UserCollectionLoadCompleted
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case NotificationConstants.UserCollectionLoadCompleted:
					var list:ArrayCollection = notification.getBody() as ArrayCollection;
					_view.dataGrid.dataProvider = list;
					break;
			}
		}
		
	}
}