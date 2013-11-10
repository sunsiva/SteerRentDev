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
       static string connectionString = Helper.Helper.GetConnectionString();

       #region "Lookup"
       public List<MasterDataModel> GetMasterData(string str)
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

       public LookupCategoryModel GetLookupData(LookupCategoryModel obj)
        {
            string connectionString = Helper.Helper.GetConnectionString();
            LookupCategoryModel objLookup = new LookupCategoryModel();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                try
                {
                    con.Open();

                    //DATAREADER EXAMPLE : BEGIN
                    //SqlDataReader reader = command.ExecuteReader();
                    //string GetOutputFileInfoCmd = "SELECT Content.PathName(), GET_FILESTREAM_TRANSACTION_CONTEXT() FROM tableName WHERE containerID = @ContainerID";
                    //SqlTransaction txn = null;
                    //SqlCommand cmd = new SqlCommand(GetOutputFileInfoCmd, con, txn);
                    //cmd.Parameters.Add("@ContainerID", SqlDbType.UniqueIdentifier).Value = fileID;
                    //using (SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.SingleRow))
                    //{
                    //    rdr.Read();
                    //    txnToken = rdr.GetSqlBinary(1).Value;
                    //    filePath = rdr.GetSqlString(0).Value;
                    //    rdr.Close();
                    //}
                    //DATAREADER EXAMPLE : END

                    SqlCommand cmd = con.CreateCommand();
                    DataSet ds = new DataSet();
                    SqlDataAdapter da = new SqlDataAdapter();

                    if (obj.ActionMode == GlobalEnum.Flag.Select && (obj.PageMode == GlobalEnum.MasterPages.Lookup || obj.PageMode == GlobalEnum.MasterPages.GAndLookup || obj.PageMode == GlobalEnum.MasterPages.HAndLookup))
                    {
                        cmd.CommandText = "SELECT[LookupCategoryID],[LookupCategoryCode],[LookupCategoryDesc],IsActive,IsGLookup FROM [LookupCategories]";// "usp_LookupCategoriesSelect";
                        cmd.CommandType = CommandType.Text;
                        //cmd.Parameters.AddWithValue("@LookupCategoryID", DBNull.Value);
                        ds = new DataSet();
                        da = new SqlDataAdapter(cmd);
                        da.Fill(ds);

                        objLookup.LookupCategoryList = ds.Tables[0].AsEnumerable().Select(row =>
                        new LookupCategoryModel
                        {
                            LookupCategoryID = row.Field<decimal>("LookupCategoryID"),
                            LookupCategoryCode = row.Field<string>("LookupCategoryCode"),
                            LookupCategoryDesc = row.Field<string>("LookupCategoryDesc"),
                            IsActive = row.Field<bool>("IsActive"),
                            IsGLookup = row.Field<bool>("IsGLookup")
                        }).ToList();
                    }

                    if ((obj.ActionMode == GlobalEnum.Flag.Select || obj.ActionMode == GlobalEnum.Flag.Insert) && (obj.PageMode == GlobalEnum.MasterPages.GLookup || obj.PageMode == GlobalEnum.MasterPages.GAndLookup))
                    {
                        if (obj.ActionMode == GlobalEnum.Flag.Insert)
                        {
                            cmd = con.CreateCommand();
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "usp_GLookupInsert";
                            cmd.Parameters.AddWithValue("@LookupCategoryID", obj.LookupCategoryID);
                            cmd.Parameters.AddWithValue("@GLookupDesc", obj.LookupCategoryCode);
                            cmd.Parameters.AddWithValue("@CreatedBy", obj.UserId);
                            cmd.Parameters.AddWithValue("@IsActive", obj.IsActive);
                            cmd.ExecuteNonQuery();
                        }

                        cmd = con.CreateCommand();
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandText = "usp_GLookupSelect";
                        if (obj.LookupCategoryID > 0)
                            cmd.Parameters.AddWithValue("@GLookupID", obj.LookupCategoryID);
                        else
                            cmd.Parameters.AddWithValue("@GLookupID", DBNull.Value);
                        ds = new DataSet();
                        da = new SqlDataAdapter(cmd);
                        da.Fill(ds);

                         objLookup.GLookupList = ds.Tables[0].AsEnumerable().Select(row =>
                         new GLookupDataModel
                         {
                             GLookupID = row.Field<decimal>("GLookupID"),
                             LookupCategoryID = row.Field<decimal>("LookupCategoryID"),
                             GLookupDesc = row.Field<string>("GLookupDesc"),
                             IsActive = row.Field<bool>("IsActive")
                         }).ToList();
                    }

                    if (obj.PageMode == GlobalEnum.MasterPages.GLookup && obj.ActionMode == GlobalEnum.Flag.StatusUpdate)
                    {
                        cmd = con.CreateCommand();
                        cmd.CommandText = "usp_GLookupUpdate";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@GLookupID", obj.LookupCategoryID);
                        cmd.Parameters.AddWithValue("@GLookupDesc", obj.LookupCategoryDesc);
                        cmd.Parameters.AddWithValue("@UpdatedBy", obj.UserId);
                        cmd.Parameters.AddWithValue("@IsActive", obj.IsActive);
                        cmd.Parameters.AddWithValue("@FlexField1", "StatusUpdate");
                        cmd.ExecuteNonQuery();
                    }

                    if ((obj.ActionMode == GlobalEnum.Flag.Select || obj.ActionMode == GlobalEnum.Flag.Insert) && obj.PageMode == GlobalEnum.MasterPages.HLookup)
                    {
                        if (obj.ActionMode == GlobalEnum.Flag.Insert)
                        {
                            cmd = con.CreateCommand();
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.CommandText = "usp_HLookupInsert";
                            cmd.Parameters.AddWithValue("@LookupCategoryID", obj.LookupCategoryID);
                            cmd.Parameters.AddWithValue("@GLookupID", obj.HLookupList[0].GLookupID);
                            cmd.Parameters.AddWithValue("@HLookupDesc", obj.HLookupList[0].GLookupDesc);
                            cmd.Parameters.AddWithValue("@GLookupDesc", obj.HLookupList[0].HLookupDesc);
                            cmd.Parameters.AddWithValue("@CreatedBy", obj.UserId);
                            cmd.Parameters.AddWithValue("@IsActive", obj.IsActive);
                            cmd.ExecuteNonQuery();
                        }

                        string qry = "select HL.HLookupID,HL.HLookupDesc,GL.GLookupID,GL.GLookupDesc,LC.LookupCategoryID,HL.IsActive from HLookup HL join GLookup GL on HL.GlookupID=GL.GLookupID join LookupCategories LC on LC.LookupCategoryID = GL.LookupCategoryID AND IsGLookup=0";
                        if (obj.LookupCategoryID > 0)
                            qry = qry + " where GL.LookupCategoryID=" + obj.LookupCategoryID;
                        cmd.CommandText = qry;
                        cmd.CommandType = CommandType.Text;
                        ds = new DataSet();
                        da = new SqlDataAdapter(cmd);
                        da.Fill(ds);

                        objLookup.HLookupList = ds.Tables[0].AsEnumerable().Select(row =>
                        new HLookupDataModel
                        {
                            LookupCategoryID = row.Field<decimal>("LookupCategoryID"),
                            HLookupID = row.Field<decimal>("HLookupID"),
                            GLookupID = row.Field<decimal>("GLookupID"),
                            GLookupDesc = row.Field<string>("GLookupDesc"),
                            HLookupDesc = row.Field<string>("HLookupDesc"),
                            IsActive = row.Field<string>("IsActive")=="1"?true:false
                        }).ToList();
                    }

                    if (obj.PageMode == GlobalEnum.MasterPages.HLookup && obj.ActionMode == GlobalEnum.Flag.StatusUpdate)
                    {
                        cmd = con.CreateCommand();
                        cmd.CommandText = "usp_HLookupUpdate";
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@HLookupID", obj.LookupCategoryID);
                        cmd.Parameters.AddWithValue("@HLookupDesc", obj.LookupCategoryDesc);
                        cmd.Parameters.AddWithValue("@UpdatedBy", obj.UserId);
                        cmd.Parameters.AddWithValue("@IsActive", obj.IsActive);
                        cmd.Parameters.AddWithValue("@FlexField1", "StatusUpdate");
                        cmd.ExecuteNonQuery();
                    }

                    //reader.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

            return objLookup;

        }

       /// <summary>
       /// Insert General lookup category data
       /// </summary>
       /// <param name="objData"></param>
       /// <returns></returns>
       public LookupCategoryModel LookupInsertUpdate(LookupCategoryModel objData)
       {
           LookupCategoryModel objReturn = new LookupCategoryModel();
           using (SqlConnection con = new SqlConnection(connectionString))
           {
               try
               {
                   con.Open();
                   SqlCommand cmd = con.CreateCommand();
                   cmd.CommandType = CommandType.StoredProcedure;
                   if (objData.ActionMode == GlobalEnum.Flag.Insert)
                   {
                       cmd.CommandText = "usp_GLookupInsert";
                       cmd.Parameters.AddWithValue("@LookupCategoryID", objData.LookupCategoryID);
                       cmd.Parameters.AddWithValue("@GLookupDesc", objData.LookupCategoryDesc);
                       cmd.Parameters.AddWithValue("@CreatedBy", objData.UserId);
                       cmd.Parameters.AddWithValue("@IsActive", objData.IsActive);
                       cmd.ExecuteNonQuery();
                       objReturn.PageMode = GlobalEnum.MasterPages.GLookup;
                       objReturn = GetLookupData(objReturn);
                   }
                   //if (objData.Mode == GlobalEnum.Flag.Update)
                   //{
                   //    cmd.CommandText = "usp_LocationsUpdate";
                   //    cmd.Parameters.AddWithValue("@LocationId", objData.LocationId);
                   //    cmd.Parameters.AddWithValue("@IsActive", objData.IsActive);
                   //    cmd.ExecuteNonQuery();
                   //}

               }
               catch (Exception ex)
               {
                   throw ex;
               }
           }

           return objReturn;
       }
       #endregion

       #region "Location"
       /// <summary>
       /// Get location data
       /// </summary>
       /// <returns></returns>
       public LocationModel GetLocationData(decimal LocId)
       {
           LocationModel objData = new LocationModel();
           using (SqlConnection con = new SqlConnection(connectionString))
           {
               try
               {
                   con.Open();
                   SqlCommand cmd = con.CreateCommand();
                   cmd.CommandText = "usp_LocationsSelect";
                   cmd.CommandType = CommandType.StoredProcedure;
                   if(LocId>0)
                    cmd.Parameters.AddWithValue("@LocationId", LocId);
                   else
                       cmd.Parameters.AddWithValue("@LocationId", DBNull.Value);
                   DataSet ds = new DataSet();
                   SqlDataAdapter da = new SqlDataAdapter(cmd);
                   da.Fill(ds);
                   List<LocationModel> lstData = new List<LocationModel>();
                   foreach (DataRow item in ds.Tables[0].Rows)
                   {
                       objData = new LocationModel();
                       objData.LocationId = Convert.ToInt32(item["LocationId"]);
                       objData.LocationCode = item["LocationCode"].ToString();
                       objData.LocationName = item["LocationName"].ToString();
                       objData.ListedInWeb = item["ListedInWeb"].ToString()== ""? false : Convert.ToBoolean(item["ListedInWeb"]);
                       objData.WorkingHrs = item["WorkingHrs"].ToString()== ""? 0 :Convert.ToDecimal(item["WorkingHrs"]);
                       objData.WorkFrom = item["WorkFrom"].ToString() == "" ? DateTime.Now : Convert.ToDateTime(item["WorkFrom"].ToString());
                       objData.WorksTill = item["WorksTill"].ToString() == "" ? DateTime.Now : Convert.ToDateTime(item["WorksTill"].ToString());
                       objData.Phone = item["Phone"].ToString();
                       objData.Fax = item["Fax"].ToString();
                       objData.Email = item["Email"].ToString();
                       objData.ReciptNoStart = Convert.ToInt32(item["ReciptNoStart"]);
                       objData.ReceiptNoCurrent = Convert.ToInt32(item["ReceiptNoCurrent"]);
                       objData.RentalAgreementNoStart = Convert.ToInt32(item["RentalAgreementNoStart"]);
                       objData.RentalAgreementNoCurrent = Convert.ToInt32(item["RentalAgreementNoCurrent"]);
                       objData.LeaseAgreementNoStart = Convert.ToInt32(item["LeaseAgreementNoStart"]);
                       objData.LeaseAgreementNoCurrent = Convert.ToInt32(item["LeaseAgreementNoCurrent"]);
                       objData.IsARevenue = item["IsARevenue"].ToString() == "" ? false : Convert.ToBoolean(item["IsARevenue"]);
                       objData.IsACounter = item["IsACounter"].ToString() == "" ? false : Convert.ToBoolean(item["IsACounter"]);
                       objData.IsAWorkShop = item["IsAWorkShop"].ToString() == "" ? false : Convert.ToBoolean(item["IsAWorkShop"]);
                       objData.IsAVirtual = item["IsAVirtual"].ToString() == "" ? false : Convert.ToBoolean(item["IsAVirtual"]);
                       objData.LeasingAllowed = item["LeasingAllowed"].ToString() == "" ? false : Convert.ToBoolean(item["LeasingAllowed"]);
                       objData.RentingAllowed = item["RentingAllowed"].ToString() == "" ? false : Convert.ToBoolean(item["RentingAllowed"]);
                       objData.BuId = Convert.ToInt32(item["BuId"]);
                       objData.UserId = Convert.ToInt32(item["CreatedBy"]);
                       objData.IsActive = Convert.ToBoolean(item["IsActive"]);
                       lstData.Add(objData);
                       objData.lstLocation = lstData;
                   }

                   //objGetData = ds.Tables[0].AsEnumerable().Select(row =>
                   //new LocationModel
                   //{
                   //    LocationId = row.Field<decimal>("LocationId"),
                   //    LocationCode = row.Field<string>("LocationCode"),
                   //    LocationName = row.Field<string>("LocationName")
                       //ListedInWeb = row.Field<bool>("ListedInWeb"),
                       //WorkingHrs = row.Field<int>("WorkingHrs"),
                       //WorkFrom = row.Field<DateTime>("WorkFrom"),
                       //WorksTill = row.Field<DateTime>("WorksTill"),
                       //Phone = row.Field<string>("Phone"),
                       //Fax = row.Field<string>("Fax"),
                       //Email = row.Field<string>("Email"),
                       //ReciptNoStart = row.Field<int>("ReciptNoStart"),
                       //ReceiptNoCurrent = row.Field<int>("ReceiptNoCurrent"),
                       //RentalAgreementNoStart = row.Field<int>("RentalAgreementNoStart"),
                       //RentalAgreementNoCurrent = row.Field<int>("RentalAgreementNoCurrent"),
                       //LeaseAgreementNoStart = row.Field<int>("LeaseAgreementNoStart"),
                       //LeaseAgreementNoCurrent = row.Field<int>("LeaseAgreementNoCurrent"),
                       //IsARevenue = row.Field<bool>("IsARevenue"),
                       //IsACounter = row.Field<bool>("IsACounter"),
                       //IsAWorkShop = row.Field<bool>("IsAWorkShop"),
                       //IsAVirtual = row.Field<bool>("IsAVirtual"),
                       //LeasingAllowed = row.Field<bool>("LeasingAllowed"),
                       //RentingAllowed = row.Field<bool>("RentingAllowed"),
                       //BuId = row.Field<int>("BuId"),
                       //UserId = row.Field<int>("CreatedBy"),
                       //IsActive = row.Field<bool>("IsActive")

                   //}).AsQueryable<LocationModel>();

                   //reader.Close();
               }
               catch (Exception ex)
               {
                   throw ex;
               }
           }

           return objData;
       }

       /// <summary>
       /// Insert location data
       /// </summary>
       /// <param name="objData"></param>
       /// <returns></returns>
       public LocationModel LocationInsertUpdate(LocationModel objData)
       {
           LocationModel objReturn = new LocationModel();
           using (SqlConnection con = new SqlConnection(connectionString))
           {
               try
               {
                   con.Open();
                   SqlCommand cmd = con.CreateCommand();
                   cmd.CommandType = CommandType.StoredProcedure;
                   int returnData = 0;
                   if (objData.ActionMode == GlobalEnum.Flag.Select)
                   {
                       objReturn = GetLocationData(objData.LocationId);
                   }
                   if (objData.ActionMode == GlobalEnum.Flag.Insert)
                   {
                       cmd.CommandText = "usp_LocationsInsert";
                       returnData = ExecuteLocationInsertUpdate(cmd, objData);
                       objReturn = GetLocationData(returnData);
                   }
                   if (objData.ActionMode == GlobalEnum.Flag.Update)
                   {
                       cmd.CommandText = "usp_LocationsUpdate";
                       returnData = ExecuteLocationInsertUpdate(cmd, objData);
                       objReturn = GetLocationData(returnData);
                   }
                   if (objData.ActionMode == GlobalEnum.Flag.StatusUpdate)
                   {
                       cmd.CommandText = "usp_LocationsStatusUpdate";
                       cmd.Parameters.AddWithValue("@LocationID", objData.LocationId);
                       cmd.Parameters.AddWithValue("@BuId", objData.BuId);
                       cmd.Parameters.AddWithValue("@UpdatedBy", objData.UserId);
                       cmd.Parameters.AddWithValue("@IsActive", objData.IsActive);
                       cmd.ExecuteNonQuery();
                       objReturn = GetLocationData(objData.LocationId);
                   }
               }
               catch (Exception ex)
               {
                   throw ex;
               }
           }

           return objReturn;
       }

       private int ExecuteLocationInsertUpdate(SqlCommand cmd, LocationModel objData)
       {
           if (objData.ActionMode == GlobalEnum.Flag.Update)
           {
               cmd.Parameters.AddWithValue("@LocationID", objData.LocationId);
               cmd.Parameters.AddWithValue("@UpdatedBy", objData.UserId);
           }
           else
           { cmd.Parameters.AddWithValue("@CreatedBy", objData.UserId); }
           cmd.Parameters.AddWithValue("@LocationCode", objData.LocationCode);
           cmd.Parameters.AddWithValue("@LocationName", objData.LocationName);
           cmd.Parameters.AddWithValue("@ListedInWeb", objData.ListedInWeb);
           cmd.Parameters.AddWithValue("@WorkingHrs", objData.WorkingHrs);
           cmd.Parameters.AddWithValue("@WorkFrom", objData.WorkFrom);
           cmd.Parameters.AddWithValue("@WorksTill", objData.WorksTill);
           cmd.Parameters.AddWithValue("@Phone", objData.Phone);
           cmd.Parameters.AddWithValue("@Fax", objData.Fax);
           cmd.Parameters.AddWithValue("@Email", objData.Email);
           cmd.Parameters.AddWithValue("@ReciptNoStart", objData.ReciptNoStart);
           cmd.Parameters.AddWithValue("@ReceiptNoCurrent", objData.ReceiptNoCurrent);
           cmd.Parameters.AddWithValue("@RentalAgreementNoStart", objData.RentalAgreementNoStart);
           cmd.Parameters.AddWithValue("@RentalAgreementNoCurrent", objData.RentalAgreementNoCurrent);
           cmd.Parameters.AddWithValue("@LeaseAgreementNoStart", objData.LeaseAgreementNoStart);
           cmd.Parameters.AddWithValue("@LeaseAgreementNoCurrent", objData.LeaseAgreementNoCurrent);
           cmd.Parameters.AddWithValue("@IsARevenue", objData.IsARevenue);
           cmd.Parameters.AddWithValue("@IsACounter", objData.IsACounter);
           cmd.Parameters.AddWithValue("@IsAWorkShop", objData.IsAWorkShop);
           cmd.Parameters.AddWithValue("@IsAVirtual", objData.IsAVirtual);
           cmd.Parameters.AddWithValue("@LeasingAllowed", objData.LeasingAllowed);
           cmd.Parameters.AddWithValue("@RentingAllowed", objData.RentingAllowed);
           cmd.Parameters.AddWithValue("@BuId", objData.BuId);
           cmd.Parameters.AddWithValue("@IsActive", objData.IsActive);

           int id = cmd.ExecuteNonQuery();
           return id;
       }
       #endregion

   }
}
