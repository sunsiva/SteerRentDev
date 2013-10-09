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

        dal.MasterData objDAL;
        public List<MasterDataModel> GetMasterData()
        {
            objDAL = new dal.MasterData();
            return objDAL.GetMasterData();
        }
    }
}
