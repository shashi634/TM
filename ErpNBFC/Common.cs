using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ErpNBFC
{
    public class Common : System.Web.UI.Page
    {
        private string _connectionString = ConfigurationManager.ConnectionStrings["brokingConnectionString"].ConnectionString;
        protected string ConnectionString
        {
            get
            {
                return _connectionString;
            }
            set
            {
                _connectionString = value;
            }
        }
        private bool _isAuthorised = false;

        protected bool IsLoggedIn
        {
            get
            {
                _isAuthorised = Session["TLogin"] != null;
                return _isAuthorised;
            }

            set { _isAuthorised = value; }
        }

        protected DataTable GetData(string query)
        {
            using (var con = new SqlConnection(_connectionString))
            {
                using (var cmd = new SqlCommand(query))
                {
                    using (var sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (var dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }

        protected int EnterSignleValue(string procedureName, string parametrisedValue) {
            try {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand(procedureName, sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@value", SqlDbType.NVarChar).Value = parametrisedValue;
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        return obj.Value.ToString() == "201" ? 201 : 200;
                    }
                }
            }
            catch (Exception)
            {
                return 203;
            }
        }

        protected int EnterOnlyOneValue(string procedureName, string parametrisedValue)
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand(procedureName, sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@value", SqlDbType.NVarChar).Value = parametrisedValue;
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        return obj.Value.ToString() == "201" ? 201 : 200;
                    }
                }
            }
            catch (Exception)
            {
                return 203;
            }
        }

        protected int UpdateSignleValue(string procedureName, string parametrisedValue, int id)
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand(procedureName, sqlConnection))
                    {
                        var userGuid = Session["TLogin"].ToString().Split('|');
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Id", SqlDbType.Int).Value = id;
                        cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = parametrisedValue;
                        cmd.Parameters.AddWithValue("@userId", SqlDbType.UniqueIdentifier).Value = new Guid(userGuid[2]);
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        return obj.Value.ToString() == "201" ? 201 : 200;
                    }
                }
            }
            catch (Exception)
            {
                return 203;
            }
        }
        protected int UpdateSignleValue(string procedureName, string parametrisedValue, string id)
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand(procedureName, sqlConnection))
                    {
                        var userGuid = Session["TLogin"].ToString().Split('|');
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Id", SqlDbType.UniqueIdentifier).Value = id;
                        cmd.Parameters.AddWithValue("@Name", SqlDbType.NVarChar).Value = parametrisedValue;
                        cmd.Parameters.AddWithValue("@userId", SqlDbType.UniqueIdentifier).Value = new Guid(userGuid[2]);
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        return obj.Value.ToString() == "201" ? 201 : 200;
                    }
                }
            }
            catch (Exception ex)
            {
                return 203;
            }
        }

        protected int DeleteData(string procedureName, int id)
        {
            try
            {
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand(procedureName, sqlConnection))
                    {
                        var userGuid = Session["TLogin"].ToString().Split('|');
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Id", SqlDbType.Int).Value = id;
                        cmd.Parameters.AddWithValue("@userId", SqlDbType.UniqueIdentifier).Value = new Guid(userGuid[2]);
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        return obj.Value.ToString() == "201" ? 201 : 200;
                    }
                }
            }
            catch (Exception)
            {
                return 203;
            }
        }

        protected int DeleteData(string procedureName, Guid id)
        {
            try
            {
                var userGuid = Session["TLogin"].ToString().Split('|');
                if (userGuid[1].ToString() == "Agent" ) {
                    return 500;
                }
                using (var sqlConnection = new SqlConnection(ConnectionString))
                {
                    using (var cmd = new SqlCommand(procedureName, sqlConnection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Id", SqlDbType.UniqueIdentifier).Value = id;
                        cmd.Parameters.AddWithValue("@userId", SqlDbType.UniqueIdentifier).Value = userGuid[2].ToString();
                        var obj = new SqlParameter("@msg", SqlDbType.NVarChar, 100)
                        {
                            Direction = ParameterDirection.ReturnValue
                        };
                        cmd.Parameters.Add(obj);
                        sqlConnection.Open();
                        cmd.ExecuteNonQuery();
                        if (obj.Value.ToString() == "201") {
                            return 201;
                        }
                        else if (obj.Value.ToString() == "200") { return 200; }
                        else { return 203; }
                    }
                }
            }
            catch (Exception ex)
            {
                var message = ex.Message;
                return 204;
            }
        }
        protected void PopulateDropDown(string query, DropDownList dropDown, string valueField, string idField)
        {
            dropDown.DataSource = GetData(query);
            dropDown.DataTextField = valueField;
            dropDown.DataValueField = idField;
            dropDown.DataBind();
        }

        protected decimal GenerateRandonNumber()
        {
            var rm = new Random();
            return rm.Next();
        }
    }
}