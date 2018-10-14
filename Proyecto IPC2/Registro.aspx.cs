using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cancel.CausesValidation = false;
        }

        protected void registro(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
                {
                    string query = "INSERT INTO usuario (username,password,nombre,apellido,rol,carnet,correo,fechanac,telefono,palabraclave) VALUES (@username,@password, @nombre, @apellido, @rol, @carnet, @correo, @fechanac, @telefono, @palabraclave)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@username", carnet.Value);
                        command.Parameters.AddWithValue("@password", contraseña.Value);
                        command.Parameters.AddWithValue("@nombre", nombre.Value);
                        command.Parameters.AddWithValue("@apellido", apellido.Value);
                        command.Parameters.AddWithValue("@rol", 3);
                        command.Parameters.AddWithValue("@carnet", carnet.Value);
                        command.Parameters.AddWithValue("@correo", correo.Value);
                        command.Parameters.AddWithValue("@fechanac", fechanac.Value);
                        command.Parameters.AddWithValue("@telefono", tel.Value);
                        command.Parameters.AddWithValue("@palabraclave", clave.Value);

                        connection.Open();

                        int result = command.ExecuteNonQuery();

                        if (result < 0)
                            test.Text = "Error inserting data into Database!";
                        else
                        {
                            test.Text = "Usuario Creado con Exito";
                            Response.AddHeader("REFRESH", "5;URL=Login.aspx");
                            connection.Close();
                        }
                    }
                }
            } catch(Exception ex)
            {
                test.Text = ex.Message;
            }
        }
        protected void cancelar(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}