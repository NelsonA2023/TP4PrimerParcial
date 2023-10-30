using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4PrimerParcial
{
    public partial class Denuncias : System.Web.UI.Page
    {
       

        protected void Button3_Click(object sender, EventArgs e)
        {
            this.SqlDataSourceBaja.DeleteParameters["id"].DefaultValue = this.TextBox1.Text;
            int cant;
            cant = this.SqlDataSourceBaja.Delete();
            if (cant == 1)
            {
                this.Label4.Text = "Se borró la categoria";
                GridView1.DataBind();
            }
            else
                this.Label4.Text = "No existe la categoria";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //SqlDataSourceModificacion.UpdateParameters["id"].DefaultValue = TextBox1.Text;
            SqlDataSourceModificacion.UpdateParameters["texto"].DefaultValue = TextBox2.Text;
            SqlDataSourceModificacion.UpdateParameters["idDenunciaCategoria"].DefaultValue = TextBox3.Text;
            int cant;
            cant = SqlDataSourceModificacion.Update();
            if (cant == 1)
            {
                Label4.Text = "Se modificaron los datos";
                GridView1.DataBind();
            }
            else
                Label4.Text = "No existe dicho codigo de usuario";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            this.SqlDataSourceBuscar.SelectParameters["id"].DefaultValue = this.TextBox1.Text;
            this.SqlDataSourceBuscar.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros;
            registros = (SqlDataReader)SqlDataSourceBuscar.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
            {
                //this.Label1.Text = "Descripcion:" + registros["descriarticulo"] + "<br>" + "Precio:" + registros["precio"] + "<br>" + "Rubro:" + registros["descrirubro"];
                TextBox2.Text = registros["texto"].ToString();
                TextBox3.Text = registros["idDenunciaCategoria"].ToString();
                GridView1.DataBind();
            }
            else
                this.Label4.Text = "No existe esa categoria";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["texto"].DefaultValue = TextBox2.Text;
            SqlDataSource1.InsertParameters["idDenunciaCategoria"].DefaultValue = TextBox2.Text;
            SqlDataSource1.Insert();
            Label4.Text = "se efectuó la carga";
            TextBox1.Text = "";
            TextBox2.Text = "";
            GridView1.DataBind();
        }
    }
}