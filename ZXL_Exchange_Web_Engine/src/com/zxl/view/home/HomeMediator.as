package com.zxl.view.home
{
	import com.zxl.library.Alert.ZxlAlert;
	import com.zxl.register.RegIcon;
	import com.zxl.view.business.BusinessEditView;
	import com.zxl.view.business.BusinessView;
	import com.zxl.view.point.PointEditView;
	import com.zxl.view.point.PointView;
	import com.zxl.view.traslate.TranslateEditView;
	import com.zxl.view.traslate.TranslateView;
	import com.zxl.view.user.UserEditView;
	import com.zxl.view.user.UserView;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import mx.containers.VBox;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	
	import org.puremvc.as3.interfaces.IMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.mediator.Mediator;

	public class HomeMediator extends Mediator implements IMediator
	{
		public static const NAME:String = "HomeMediator";
		private var _view:Home = null;
		
		public function HomeMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			_view = viewComponent as Home;
			
			this.addTab("主页", new HomeTab(), RegIcon.home,"default");
			
			_view.viewPoint.addEventListener(MouseEvent.CLICK,viewPointHandler);
			_view.addPoint.addEventListener(MouseEvent.CLICK,addPointHandler);
			
			_view.viewUser.addEventListener(MouseEvent.CLICK,viewUserHandler);
			_view.addUser.addEventListener(MouseEvent.CLICK,addUserHandler);

			_view.viewTranslate.addEventListener(MouseEvent.CLICK,viewTranslateHandler);
			_view.addTranslate.addEventListener(MouseEvent.CLICK,addTranslateHandler);
			
			_view.viewBusiness.addEventListener(MouseEvent.CLICK,viewBusinessHandler);
			_view.addBusiness.addEventListener(MouseEvent.CLICK,addBusinessHandler);
			
			_view.home.addEventListener(MouseEvent.CLICK,homeHandler);
			_view.exit.addEventListener(MouseEvent.CLICK,exitHandler);
			_view.noreadmessage.addEventListener(MouseEvent.CLICK,noreadmessageHandler);
		}
		
		private function viewPointHandler(event:MouseEvent):void
		{
			this.addTab("网点查询", new PointView(), RegIcon.point);
		}
		
		private function viewUserHandler(event:MouseEvent):void
		{
			this.addTab("用户查询", new UserView(), RegIcon.user);
		}
		
		private function viewTranslateHandler(event:MouseEvent):void
		{
			this.addTab("调度查询", new TranslateView(), RegIcon.translate);
		}
		
		private function viewBusinessHandler(event:MouseEvent):void
		{
			this.addTab("业务查询", new BusinessView(), RegIcon.business);
		}
		
		private function addPointHandler(event:MouseEvent):void
		{
			var editView:PointEditView = new PointEditView();
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		private function addUserHandler(event:MouseEvent):void
		{
			var editView:UserEditView = new UserEditView();
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		private function addTranslateHandler(event:MouseEvent):void
		{
			var editView:TranslateEditView = new TranslateEditView();
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		private function addBusinessHandler(event:MouseEvent):void
		{
			var editView:BusinessEditView = new BusinessEditView();
			PopUpManager.addPopUp(editView,_view,true);
			PopUpManager.centerPopUp(editView);
		}
		
		private function homeHandler(event:MouseEvent):void
		{
			this.addTab("主页", new HomeTab(), RegIcon.home,"default");
		}
		
		private function exitHandler(event:MouseEvent):void
		{
			ZxlAlert.show("exit");
		}
		
		private function noreadmessageHandler(event:MouseEvent):void
		{
			ZxlAlert.show("noreadmessage");
		}
		
		
		
		private function addTab(label:String, component:DisplayObject=null, icon:Class=null, key:String=null):int
		{
			key = null==key?label:key;
			
			var tab:UIComponent = _view._tabNavigator.getChildByName(key) as UIComponent;
			if(null!= tab){
				var index:int = _view._tabNavigator.getChildIndex(tab);
				_view._tabNavigator.selectedIndex = index
				return index;
			}
			
			var child:VBox = new VBox();
			child.label = null==label?"(空)":label;
			child.icon = null==icon?RegIcon.search:icon;
			child.setStyle("closable",true);
			child.name = key;
			
			if(null!=component)
			child.addChild(component);
			_view._tabNavigator.addChild(child);
			_view._tabNavigator.selectedIndex = _view._tabNavigator.numChildren-1;
			_view._tabNavigator.validateNow();
			
			return _view._tabNavigator.numChildren-1;
		}
		
		override public function listNotificationInterests():Array
		{
			return [];
		}
		
		override public function handleNotification(notification:INotification):void
		{
		}
		
	}
}