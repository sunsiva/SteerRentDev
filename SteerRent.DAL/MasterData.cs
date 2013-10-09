using SteerRent.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SteerRent.DAL
{
   public class MasterData
    {
        public List<MasterDataModel> GetMasterData()
        {
            string connectionString = Helper.Helper.GetConnectionString();
            List<MasterDataModel> lstOfData = new List<MasterDataModel>();
            string queryString =
                "SELECT LookupCategoryID,[LookupCategoryCode], [LookupCategoryDesc] FROM dbo.[LookupCategories];";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand command = con.CreateCommand();
                command.CommandText = queryString;

                try
                {
                    con.Open();

                    //SqlDataReader reader = command.ExecuteReader();

                    //while (reader.Read())
                    //{
                    //    Console.WriteLine("\t{0}\t{1}",
                    //        reader[0], reader[1]);
                    //}
                    command.CommandType = CommandType.Text;
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    da.Fill(ds);
                    lstOfData = ds.Tables[0].AsEnumerable().Select(row =>
                    new MasterDataModel
                    {

                        LookupCategoryID = row.Field<decimal>("LookupCategoryID"),
                        LookupCategoryCode = row.Field<string>("LookupCategoryCode"),
                        LookupCategoryDesc = row.Field<string>("LookupCategoryDesc")

                    }).ToList();

                    //reader.Close();
                }
                catch (Exception ex)
                {
                    //Console.WriteLine(ex.Message);
                }
            }

            //type 1
            //var q = from role in ds.Role
            //        select role;

            //DataTable dtRole = q.CopyToDataTable();

            //type2
            //var query = from p in dtRole.AsEnumerable()
            //            where p.Field<string>("RoleDescription")
            //            == "Manager"
            //            select p;

            //foreach (var record in query)
            //{
            //    Console.WriteLine("Role: {0} {1}",
            //      record.Field<int>("ID"),
            //      record.Field<string>("RoleDescription"));
            //}

            //Type3
        //        IList<Class1> items = dt.AsEnumerable().Select(row =>
        //new Class1
        //{
        //    id = row.Field<string>("id"),
        //    name = row.Field<string>("name")
        //}).ToList();

            //Dynamic - type4
            //to convert entity collections to a dataset?
            //forums.asp.net/t/1559861.aspx

            return lstOfData;

        }
    }
}
