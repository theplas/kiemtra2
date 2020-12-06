using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace BookStroreDB.DAL
{
   public  class BaseRepository
    {
        protected IDbConnection connect;
        public BaseRepository()
        {
            connect = new SqlConnection(@"Data Source=DESKTOP-CM3G3FU\SQLEXPRESS;Initial Catalog=BookStroreDB;Integrated Security=True");
        }
    }
}
