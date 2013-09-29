using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SteerRent
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void aspbtn_Click(object sender, EventArgs e)
        {
            Text1.Value = txtMarkSale.Value;
            Text2.Value = txtMarkSale.Value;
            lblMsg.Visible = true;
        }

    }
}