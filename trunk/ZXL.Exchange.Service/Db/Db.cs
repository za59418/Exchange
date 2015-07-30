using System;
using System.Collections.Generic;
using System.Text;
using MySql.Data.MySqlClient;

namespace ZXL.Exchange.Service
{
    class Db
    {
        private const string MYSQL_CONNECTION_STRING="server=localhost;user id=root;password=123;database=xx";
        private static MySqlConnection connection = null;

        public static MySqlConnection GetConnection()
        {
            if(null==connection)
                connection = new MySqlConnection(MYSQL_CONNECTION_STRING);
            return connection;
        }
    }
}
