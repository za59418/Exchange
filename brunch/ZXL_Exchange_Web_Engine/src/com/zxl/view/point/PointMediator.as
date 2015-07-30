package com.zxl.view.point
{
	import com.zxl.NotificationConstants;
	import com.zxl.library.Alert.ZxlAlert;
	import com.zxl.model.point.PointProxy;
	import com.zxl.model.point.PointVO;
	
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class PointMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "PointMediator";
		public var _proxy:PointProxy = null;
		public var _view:PointView = null;
		
		public function PointMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			_proxy = new PointProxy(PointProxy.NAME);
			_view = viewComponent.View as PointView;
			_view.addPoint.addEventListener(MouseEvent.CLICK,addPointHandler);
			_view.editPoint.addEventListener(MouseEvent.CLICK,editPointHandler);
			_proxy.GetPointList();
		}
		
		public function addPointHandler(e:MouseEvent):void
		{
			var editView:PointEditView = new PointEditView();
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		public function editPointHandler(e:MouseEvent):void
		{
			if(null==_view.dataGrid.selectedItem)
			{
				ZxlAlert.show("请选择你要编辑的网点!","错误");
				return;
			}
			var editView:PointEditView = new PointEditView();
			editView.pointVO = _view.dataGrid.selectedItem as PointVO;
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		override public function listNotificationInterests():Array
		{
			return [
				NotificationConstants.PointCollectionLoadCompleted
			];
		}
		
		override public function handleNotification(notification:INotification):void
		{
			switch(notification.getName())
			{
				case NotificationConstants.PointCollectionLoadCompleted:
					var list:ArrayCollection = notification.getBody() as ArrayCollection;
					_view.dataGrid.dataProvider = list;
					break;
			}
		}
		
	}
}