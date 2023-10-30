using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TP4PrimerParcial
{
    public partial class Categoria : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["nombre"].DefaultValue = TextBox2.Text;
            SqlDataSource1.Insert();
            Label3.Text = "se efectuó la carga";
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            this.SqlDataSourceBaja.DeleteParameters["id"].DefaultValue = this.TextBox1.Text;
            int cant;
            cant = this.SqlDataSourceBaja.Delete();
            if (cant == 1)
                this.Label3.Text = "Se borró la categoria";
            else
                this.Label3.Text = "No existe la categoria";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlDataSourceModificacion.UpdateParameters["id"].DefaultValue = TextBox1.Text;
            SqlDataSourceModificacion.UpdateParameters["nombre"].DefaultValue = TextBox2.Text;
            SqlDataSourceModificacion.UpdateParameters["nombre"].DefaultValue = TextBox2.Text;
            int cant;
            cant = SqlDataSourceModificacion.Update();
            Label3.Text = "Llego hasta aca";
            if (cant == 1)
                Label3.Text = "Se modificaron los datos";
            else
                Label3.Text = "No existe dicho codigo de usuario";
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
                TextBox2.Text = registros["nombre"].ToString();
            }
            else
                this.Label3.Text = "No existe esa categoria";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Label3.Text = "Llego hasta aca";
            SqlDataSourceModificacion.UpdateParameters["id"].DefaultValue = TextBox1.Text;
            SqlDataSourceModificacion.UpdateParameters["nombre"].DefaultValue = TextBox2.Text;
            int cant;
            cant = SqlDataSourceModificacion.Update();
            Label3.Text = "Llego hasta aca";
            if (cant == 1)
                Label3.Text = "Se modificaron los datos";
            else
                Label3.Text = "No existe dicho codigo de usuario";
        }

        protected void Button5_Click1(object sender, EventArgs e)
        {
            Label3.Text = "Llego hasta aca";
            SqlDataSourceModificacion.UpdateParameters["id"].DefaultValue = TextBox1.Text;
            SqlDataSourceModificacion.UpdateParameters["nombre"].DefaultValue = TextBox2.Text;
            int cant;
            cant = SqlDataSourceModificacion.Update();
            Label3.Text = "Llego hasta aca";
            if (cant == 1)
                Label3.Text = "Se modificaron los datos";
            else
                Label3.Text = "No existe dicho codigo de usuario";
        }
    }
}