package com.zxl.view.traslate
{
	import com.zxl.NotificationConstants;
	import com.zxl.library.Alert.ZxlAlert;
	import com.zxl.model.translate.TranslateProxy;
	import com.zxl.model.translate.TranslateVO;
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class TranslateMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "TranslateMediator";
		public var _proxy:TranslateProxy = null;
		public var _view:TranslateView = null;
		
		public function TranslateMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			_proxy = new TranslateProxy(TranslateProxy.NAME);
			_view = viewComponent.View as TranslateView;
			_view.addTranslate.addEventListener(MouseEvent.CLICK,addTranslateHandler);
			_proxy.GetTranslateList();
		}
		
		public function addTranslateHandler(e:MouseEvent):void
		{
			var editView:TranslateEditView = new TranslateEditView();
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				NotificationConstants.TranslateCollectionLoadCompleted
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case NotificationConstants.TranslateCollectionLoadCompleted:
					var list:ArrayCollection = notification.getBody() as ArrayCollection;
					_view.dataGrid.dataProvider = list;
					break;
			}
		}
		
	}
}