using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2
{
    public partial class modificar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Menu
                try
                {
                    test.Text = Session["userIdMod"].ToString();
                    if (Session["rol"].ToString() == "0")
                    {
                        adminmen.Visible = true;
                    }
                    else if (Session["rol"].ToString() == "1")
                    {
                        operadormen.Visible = true;
                        rolmod.Visible = false;
                        RequiredFieldValidator5.Visible = false;
                        rollabel.Visible = false;
                    }
                    else if (Session["rol"].ToString() == "2")
                    {
                        instructormen.Visible = true;
                        Response.Redirect("Inicio.aspx");
                    }
                    else
                    {
                        alumnomen.Visible = true;
                        Response.Redirect("Inicio.aspx");
                    }
                }
                catch (Exception exp)
                {
                    Response.Redirect("Login.aspx");
                }
                using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
                {
                    try
                    {
                        connection.Open();
                        SqlDataReader myReader = null;
                        string query = "SELECT * FROM usuario WHERE id_usuario = @userid";
                        using (SqlCommand myCommand = new SqlCommand(query, connection))
                        {
                            myCommand.Parameters.AddWithValue("@userid", Session["userIdMod"]);

                            myReader = myCommand.ExecuteReader();
                            if (myReader.Read())
                            {
                                unamemod.Value = myReader["username"].ToString();
                                contramod.Value = myReader["password"].ToString();
                                nombremod.Value = myReader["nombre"].ToString();
                                apellidomod.Value = myReader["apellido"].ToString();
                                rolmod.Value = myReader["rol"].ToString();
                                carnetmod.Value = myReader["carnet"].ToString();
                                correomod.Value = myReader["correo"].ToString();
                                fechanacmod.Value = myReader["fechanac"].ToString();
                                telefonomod.Value = myReader["telefono"].ToString();
                                pclavemod.Value = myReader["palabraclave"].ToString();
                            }
                            else
                            {
                                unamemod.Value = "El usuario y/o contraseña es incorrecto";
                            }
                            connection.Close();
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(e.ToString());
                        unamemod.Value = ex.Message;
                    }
                }
            }
        }

        protected void Cerrar_Sesion(object sender, EventArgs e)
        {
            Session["nombreusuario"] = null;
            Session["nombre"] = null;
            Session["rol"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void modificarbtn(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
                {
                    string query = "UPDATE usuario SET username = @username, password = @password, nombre = @nombre, apellido = @apellido, rol = @rol, carnet = @carnet, correo = @correo, fechanac = @fechanac, telefono = @telefono, palabraclave = @clave WHERE id_usuario = @idusuario";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@idusuario", Session["userIdMod"]);
                        command.Parameters.AddWithValue("@username", unamemod.Value);
                        command.Parameters.AddWithValue("@password", contramod.Value);
                        command.Parameters.AddWithValue("@nombre", nombremod.Value);
                        command.Parameters.AddWithValue("@apellido", apellidomod.Value);
                        command.Parameters.AddWithValue("@rol", rolmod.Value);
                        command.Parameters.AddWithValue("@carnet", carnetmod.Value);
                        command.Parameters.AddWithValue("@correo", correomod.Value);
                        command.Parameters.AddWithValue("@fechanac", fechanacmod.Value);
                        command.Parameters.AddWithValue("@telefono", telefonomod.Value);
                        command.Parameters.AddWithValue("@clave", pclavemod.Value);

                        connection.Open();

                        int result = command.ExecuteNonQuery();

                        if (result < 1)
                            test.Text = "Error updating data into Database!";
                        else
                        {
                            test.Text = "Usuario Actualizado Exitosamente ";
                            connection.Close();
                            Response.AddHeader("REFRESH", "3;URL=CUsuarios.aspx");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                test.Text = ex.Message;
            }
        }

        protected void cancelar(object sender, EventArgs e)
        {
            Response.Redirect("CUsuarios.aspx");
        }
    }
}