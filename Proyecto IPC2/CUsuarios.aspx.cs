using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2
{
    public partial class CUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cancel.CausesValidation = false;
            //Menu
            try
            {
                if (Session["rol"].ToString() == "0")
                {
                    adminmen.Visible = true;
                    rol.Visible = true;
                    roloperador.Visible = false;
                }
                else if (Session["rol"].ToString() == "1")
                {
                    operadormen.Visible = true;
                    rol.Visible = false;
                    roloperador.Visible = true;
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
        }

        protected void Cerrar_Sesion(object sender, EventArgs e)
        {
            Session["nombreusuario"] = null;
            Session["nombre"] = null;
            Session["rol"] = null;
            Response.Redirect("Login.aspx");
        }

        protected void crear_ServerClick(object sender, EventArgs e)
        {
            crear_usuario.Visible = true;
            modificar.Visible = false;
            uname.Visible = false;
            carnet.Visible = false;
            Lusuario.Visible = false;
            lcarnet.Visible = false;
            crear.Visible = false;
            tablamodificar.Visible = false;
        }

        protected void modificar_ServerClick(object sender, EventArgs e)
        {
            string query;
            if (Session["rol"].ToString() == "0")
            {
                query = @"SELECT id_usuario as 'codigo de usuario',username AS 'nombre de usuario',nombre,correo FROM usuario";
            }
            else
            {
                query = @"SELECT id_usuario as 'codigo de usuario',username AS 'nombre de usuario',nombre,correo FROM usuario WHERE rol > 1";
            }
            using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
            using (SqlCommand cmd = new SqlCommand(query, connection))
            {
                connection.Open();
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());

                tablamodificar.DataSource = dt;
                tablamodificar.DataBind();
            }

        }

        protected void registro(object sender, EventArgs e)
        {
            try
            {
                if(uname.Value == null)
                {
                    uname.Value = carnet.Value;
                } else if(carnet.Value == null)
                {
                    carnet.Value = "0";
                }
                using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
                {
                    string query = "INSERT INTO usuario (username,password,nombre,apellido,rol,carnet,correo,fechanac,telefono,palabraclave) VALUES (@username,@password, @nombre, @apellido, @rol, @carnet, @correo, @fechanac, @telefono, @palabraclave)";
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@username", uname.Value);
                        command.Parameters.AddWithValue("@password", contraseña.Value);
                        command.Parameters.AddWithValue("@nombre", nombre.Value);
                        command.Parameters.AddWithValue("@apellido", apellido.Value);
                        command.Parameters.AddWithValue("@rol", rol.SelectedValue);
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
                            formulario.Visible = false;
                            test.Text = "Usuario Creado con Exito";
                            connection.Close();
                            Response.AddHeader("REFRESH", "5;URL=CUsuarios.aspx");
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

        protected void rol_ServerChange(object sender, EventArgs e)
        {
            if(rol.SelectedValue == "0")
            {
                Lusuario.Visible = true;
                uname.Visible = true;
                carnet.Visible = false;
                lcarnet.Visible = false;
            } else if(rol.SelectedValue == "1")
            {
                Lusuario.Visible = true;
                uname.Visible = true;
                carnet.Visible = false;
                lcarnet.Visible = false;
            } else if(rol.SelectedValue == "2")
            {
                Lusuario.Visible = true;
                uname.Visible = true;
                carnet.Visible = false;
                lcarnet.Visible = false;
            } else
            {
                Lusuario.Visible = false;
                uname.Visible = false;
                carnet.Visible = true;
                lcarnet.Visible = true;
            }
        }
        protected void rol_ServerChange2(object sender, EventArgs e)
        {
            if (roloperador.SelectedValue == "0")
            {
                Lusuario.Visible = true;
                uname.Visible = true;
                carnet.Visible = false;
                lcarnet.Visible = false;
            }
            else if (roloperador.SelectedValue == "1")
            {
                Lusuario.Visible = true;
                uname.Visible = true;
                carnet.Visible = false;
                lcarnet.Visible = false;
            }
            else if (roloperador.SelectedValue == "2")
            {
                Lusuario.Visible = true;
                uname.Visible = true;
                carnet.Visible = false;
                lcarnet.Visible = false;
            }
            else
            {
                Lusuario.Visible = false;
                uname.Visible = false;
                carnet.Visible = true;
                lcarnet.Visible = true;
            }
        }

        protected void tablamodificar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = tablamodificar.Rows[index];
                Session["userIdMod"] = row.Cells[2].Text;
                Response.Redirect("modificar.aspx");
            } else if (e.CommandName == "Delete")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = tablamodificar.Rows[index];
                try
                {
                    using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
                    {
                        string query = "DELETE FROM usuario WHERE id_usuario = @idusuario ;";
                        using (SqlCommand command = new SqlCommand(query, connection))
                        {
                            command.Parameters.AddWithValue("@idusuario", row.Cells[2].Text);

                            connection.Open();

                            int result = command.ExecuteNonQuery();

                            if (result < 0)
                                test.Text = "Error deleting data into Database!";
                            else
                            {
                                test.Text = "Usuario Eliminaldo Exitosamente";
                                connection.Close();
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    test.Text = ex.Message;
                }
            }
        }

        protected void tablamodificar_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            test.Text = "Usuario Eliminado Exitosamente";
            Response.AddHeader("REFRESH", "1;URL=CUsuarios.aspx");
            //tablamodificar.DataBind();
        }
    }
}