package com.zxl.model.login
{
	public class UserVO
	{
		private var _username:String;
		private var _password:String;
		
		public function UserVO(username:String,password:String)
		{
			this._username = username;
			this._password = password;
		}
		
		public function get Username():String
		{
			return _username;
		}
		
		public function get Password():String
		{
			return _password;
		}
	}
}