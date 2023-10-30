<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Denuncias.aspx.cs" Inherits="TP4PrimerParcial.Denuncias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Id.Categ"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Buscar" />
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Nombre"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Categoria"></asp:Label>
&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="Alta" OnClick="Button2_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Baja" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Modificcion" />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSourceGrilla">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="texto" HeaderText="texto" SortExpression="texto" />
                    <asp:BoundField DataField="idDenunciaCategoria" HeaderText="id Cat" SortExpression="idDenunciaCategoria" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Categoria.aspx">Categorias</asp:HyperLink>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-B1M6VN4;Initial Catalog=IssdTP42023;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT id, nombre FROM DenunciaCategorias" InsertCommand="INSERT INTO Denuncias(texto, idDenunciaCategoria) VALUES (@texto, @idDenunciaCategoria)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="texto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="idDenunciaCategoria" PropertyName="Text" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox3" Name="newparameter" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceModificacion" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" InsertCommand="INSERT INTO Denuncias(texto, idDenunciaCategoria) VALUES (@texto, @idDenunciaCategoria)" SelectCommand="SELECT [texto], [idDenunciaCategoria] FROM [Denuncias]" UpdateCommand="UPDATE Denuncias SET texto = @texto, idDenunciaCategoria = @idDenunciaCategoria WHERE (id = @id)">
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="texto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="idDenunciaCategoria" PropertyName="Text" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="texto" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox3" Name="idDenunciaCategoria" PropertyName="Text" />
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBaja" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" DeleteCommand="DELETE FROM Denuncias where id = @id" InsertCommand="INSERT INTO [DenunciaCategorias] ([nombre]) VALUES (@nombre)" SelectCommand="SELECT * FROM [DenunciaCategorias]" UpdateCommand="UPDATE [DenunciaCategorias] SET [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceBuscar" runat="server" ConnectionString="Data Source=DESKTOP-B1M6VN4;Initial Catalog=IssdTP42023;Integrated Security=True" ProviderName="System.Data.SqlClient" UpdateCommand="UPDATE Denuncias SET texto =, idDenunciaCategoria =" SelectCommand="SELECT id AS Expr1, texto AS Expr2, idDenunciaCategoria AS Expr3, Denuncias.* FROM Denuncias where id = @id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="id" PropertyName="Text" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="newparameter" PropertyName="Text" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSourceGrilla" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString %>" SelectCommand="SELECT * from  Denuncias"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
