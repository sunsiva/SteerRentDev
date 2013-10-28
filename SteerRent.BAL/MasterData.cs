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
    }
}
