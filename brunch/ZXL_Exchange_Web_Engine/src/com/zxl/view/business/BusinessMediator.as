package com.zxl.view.business
{
	import com.zxl.NotificationConstants;
	import com.zxl.library.Alert.ZxlAlert;
	import com.zxl.model.business.BusinessProxy;
	import com.zxl.model.business.BusinessVO;
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class BusinessMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "BusinessMediator";
		public var _proxy:BusinessProxy = null;
		public var _view:BusinessView = null;
		
		public function BusinessMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			_proxy = new BusinessProxy(BusinessProxy.NAME);
			_view = viewComponent.View as BusinessView;
			_view.addBusiness.addEventListener(MouseEvent.CLICK,addBusinessHandler);
			_view.editBusiness.addEventListener(MouseEvent.CLICK,editBusinessHandler);
			_proxy.GetBusinessList();
		}
		
		public function addBusinessHandler(e:MouseEvent):void
		{
			var editView:BusinessEditView = new BusinessEditView();
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		public function editBusinessHandler(e:MouseEvent):void
		{
			if(null==_view.dataGrid.selectedItem)
			{
				ZxlAlert.show("请选择你要编辑的业务!","提醒");
				return;
			}
			var editView:BusinessEditView = new BusinessEditView();
			editView.businessVO = _view.dataGrid.selectedItem as BusinessVO;
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				NotificationConstants.BusinessCollectionLoadCompleted
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case NotificationConstants.BusinessCollectionLoadCompleted:
					var list:ArrayCollection = notification.getBody() as ArrayCollection;
					_view.dataGrid.dataProvider = list;
					break;
			}
		}
		
	}
}