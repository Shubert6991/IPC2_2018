using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect("Registro.aspx");
        }

        protected void Unnamed_ServerClick1(object sender, EventArgs e)
        {
                using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader myReader = null;
                        string query = "SELECT * FROM usuario WHERE username = @username AND password = @password";
                        using (SqlCommand myCommand = new SqlCommand(query, connection))
                        {
                            myCommand.Parameters.AddWithValue("@username", username.Value);
                            myCommand.Parameters.AddWithValue("@password", password.Value);

                            myReader = myCommand.ExecuteReader();
                        if (myReader.Read())
                        {
                            Session["nombreusuario"] = myReader["username"].ToString();
                            Session["nombre"] = myReader["nombre"].ToString();
                            Session["rol"] = myReader["rol"].ToString();
                            Response.Redirect("Inicio.aspx");   
                        }
                        else
                        {
                            test.Text = "El usuario y/o contraseña es incorrecto";
                        }
                            connection.Close();
                        }     
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(e.ToString());
                        test.Text = ex.Message;
                    }
                }
        }
    }
}