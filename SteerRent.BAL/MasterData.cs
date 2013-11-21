using SteerRent.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using dal=SteerRent.DAL;

namespace SteerRent.BAL
{
    public class MasterData
    {

        dal.MasterData objDAL=new dal.MasterData();
        public LookupCategoryModel GetLookupData(LookupCategoryModel obj)
        {
            return objDAL.GetLookupData(obj);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public List<GLookupDataModel> GetGLookupDataByLookup(string str)
        {
            return objDAL.GetGLookupDataByLookup(str);
        }

        #region Location

               /// <summary>
       /// Get location data
       /// </summary>
       /// <returns></returns>
        public LocationModel GetLocationData(int LocId)
 {
            return objDAL.GetLocationData(LocId);
        }
        /// <summary>
       /// Insert location data
       /// </summary>
       /// <param name="objData"></param>
       /// <returns></returns>
        public LocationModel LocationInsertUpdate(LocationModel objData)
       {
           return objDAL.LocationInsertUpdate(objData);
       }
        #endregion

         #region "Company Setup"

          /// <summary>
       /// Getting the company details
       /// </summary>
       /// <param name="id"></param>
       /// <returns></returns>
        public CompanySetup GetCompanyDetails(int id)
        { return objDAL.GetCompanyDetails(id); }

       /// <summary>
       /// Inserting/Updating company data
       /// </summary>
       /// <param name="item"></param>
       /// <returns></returns>
        public int CompanyInsertUpdate(CompanySetup objData)
        {
            return objDAL.CompanyInsertUpdate(objData);
        }
        #endregion
    }
}
