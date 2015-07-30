using System;
using System.Collections.Generic;
using System.Text;
using FluorineFx;
using MySql.Data.MySqlClient;

namespace ZXL.Exchange.Service.Point
{
    [RemotingService]
    class PointService
    {
        public PointService()
        {
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public List<PointVO> GetPointList() 
        {
            return GetPointList("");
        }
        public List<PointVO> GetPointList(string strWhere)
        {
            MySqlConnection con = Db.GetConnection();
            con.Open();

			StringBuilder strSql=new StringBuilder();
			strSql.Append("select pointid,pointname,pointaddress,contactperson,tel ");
			strSql.Append(" FROM point ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
            List<PointVO> list = new List<PointVO>();

            MySqlCommand command = new MySqlCommand(strSql.ToString(),con);
            MySqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                PointVO model = new PointVO();
                model.PointID = reader.GetInt32(0);
                model.PointName = reader.GetString(1);
                model.PointAddress = reader.GetString(2);
                model.ContactPerson = reader.GetString(3);
                model.Tel = reader.GetString(4);
                list.Add(model);
            }

            con.Close();
            return list;
		}
        public void AddPoint(PointVO vo)
        {
            MySqlConnection con = Db.GetConnection();
            con.Open();

            string strSql = "insert into point(pointid,pointname,pointaddress,contactperson,tel) values("
                +vo.PointID+",'"
                +vo.PointName+"','"
                +vo.PointAddress+"','"
                +vo.ContactPerson+"','"
                +vo.Tel+"')";

            MySqlCommand command = new MySqlCommand(strSql.ToString(), con);
            command.ExecuteNonQuery();

            con.Close();
        }
    }
}
