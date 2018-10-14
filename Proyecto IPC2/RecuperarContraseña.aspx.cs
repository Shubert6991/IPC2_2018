using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2
{
    public partial class RecuperarContraseña : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void recuperar_ServerClick(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
            {
                try
                {
                    connection.Open();
                    SqlDataReader myReader = null;
                    string query = "SELECT * FROM usuario WHERE correo = @correo AND palabraclave = @clave";
                    using (SqlCommand myCommand = new SqlCommand(query, connection))
                    {
                        myCommand.Parameters.AddWithValue("@correo", correo.Value);
                        myCommand.Parameters.AddWithValue("@clave", palabraclave.Value);

                        myReader = myCommand.ExecuteReader();
                        if (myReader.Read())
                        {
                            MailMessage mail = new MailMessage();
                            mail.To.Add(myReader["correo"].ToString());
                            mail.From = new MailAddress("alonzoshubert1996@gmail.com", "Contraseña proyecto IPC2", System.Text.Encoding.UTF8);
                            mail.Subject = "Recuperar Contraseña";
                            mail.SubjectEncoding = System.Text.Encoding.UTF8;
                            mail.Body = "Su nombre de usuario es: " + myReader["username"].ToString() + @"<br \> y su contraseña es: " + myReader["password"].ToString();
                            mail.BodyEncoding = System.Text.Encoding.UTF8;
                            mail.IsBodyHtml = true;
                            mail.Priority = MailPriority.High;
                            SmtpClient client = new SmtpClient();
                            client.Credentials = new System.Net.NetworkCredential("ipc22s2018@gmail.com", "proyecto2018");
                            client.Port = 587;
                            client.Host = "smtp.gmail.com";
                            client.EnableSsl = true;
                            try
                            {
                                client.Send(mail);
                                Page.RegisterStartupScript("UserMsg", "<script>alert('Correo enviado Exitosamente..');if(alert){ window.location='Login.aspx';}</script>");
                            }
                            catch (Exception ex)
                            {
                                Exception ex2 = ex;
                                string errorMessage = string.Empty;
                                while (ex2 != null)
                                {
                                    errorMessage += ex2.ToString();
                                    ex2 = ex2.InnerException;
                                }
                                Page.RegisterStartupScript("UserMsg", "<script>alert('No se pudo enviar el correo');if(alert){ window.location='RecuperarContraseña.aspx';}</script>");
                            }
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
                    Console.WriteLine(ex.ToString());
                    test.Text = ex.Message;
                }
            }
        }
    }
}