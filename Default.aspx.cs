using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
public partial class _Default : System.Web.UI.Page{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!X.IsAjaxRequest)
        {
            
            this.Store1.DataSource = this.Data;
            this.Store1.DataBind();



            this.Store2.DataSource = this.Data2;
            this.Store2.DataBind();
        }
    }

    protected void MyData_Refresh(object sender, StoreDirectEvents  e)
    {
        this.BindData();
    }

    protected void MyChildData_Refresh(object sender, StoreDirectEvents e)
    {
        this.BindChildData();
    }

    private void BindData()
    {
        Store store = this.GridPanel1.GetStore();

        store.DataSource = this.Data;     
        store.DataBind();
    }

    private void BindChildData()
    {
        Store store = this.gridChild1.GetStore();

        store.DataSource = this.Data2;
        store.DataBind();
    }


    private object[] Data
    {
        get
        {
            DateTime now = DateTime.Now;

            return new object[]
            {
                new object[] { "3m Co", 71.72, 0.02, 0.03, now },
                new object[] { "Alcoa Inc", 29.01, 0.42, 1.47, now },
                new object[] { "Altria Group Inc", 83.81, 0.28, 0.34, now },
                new object[] { "American Express Company", 52.55, 0.01, 0.02, now },
                new object[] { "American International Group, Inc.", 64.13, 0.31, 0.49, now },
                new object[] { "AT&T Inc.", 31.61, -0.48, -1.54, now },
                new object[] { "Boeing Co.", 75.43, 0.53, 0.71, now },
                new object[] { "Caterpillar Inc.", 67.27, 0.92, 1.39, now },
                new object[] { "Citigroup, Inc.", 49.37, 0.02, 0.04, now },
                new object[] { "E.I. du Pont de Nemours and Company", 40.48, 0.51, 1.28, now },
                new object[] { "Exxon Mobil Corp", 68.1, -0.43, -0.64, now },
                new object[] { "General Electric Company", 34.14, -0.08, -0.23, now },
                new object[] { "General Motors Corporation", 30.27, 1.09, 3.74, now },
                new object[] { "Hewlett-Packard Co.", 36.53, -0.03, -0.08, now }
            };
        }
    }


    private object[] Data2
    {
        get
        {
            DateTime now = DateTime.Now;

            return new object[]
            {
                new object[] { "Wipro", 71.72,now },
                new object[] { "Infosys", 29.01,  1.47, now },
                new object[] { "Wal-Mart Stores, Inc.", 45.45,  now }
            };
        }
    }



}