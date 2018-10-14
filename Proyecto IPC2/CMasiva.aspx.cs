using Microsoft.Office;
using System;
using Microsoft.Office.Core;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Globalization;
using System.Data;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2
{
    public partial class CMasiva : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Menu
            try
            {
                if (Session["rol"].ToString() == "0")
                {
                    adminmen.Visible = true;
                }
                else if (Session["rol"].ToString() == "1")
                {
                    operadormen.Visible = true;
                }
                else if (Session["rol"].ToString() == "2")
                {
                    instructormen.Visible = true;
                }
                else
                {
                    alumnomen.Visible = true;
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

        protected void IniciarCarga(object sender, EventArgs e)
        {
            try
            {
                Microsoft.Office.Interop.Excel.Application xlApp = new Microsoft.Office.Interop.Excel.Application();
                Microsoft.Office.Interop.Excel.Workbook xlWorkbook = xlApp.Workbooks.Open(fileToUpload.PostedFile.FileName);
                xlWorkbook.SaveAs(@"D:\test.csv", Microsoft.Office.Interop.Excel.XlFileFormat.xlCSV);
                xlWorkbook.Close();
                tabladatos.DataSource = GetDataTableFromCsv(@"D:\test.csv", true);
                tabladatos.DataBind();
                foreach (GridViewRow row in tabladatos.Rows)
                {
                    for (int o = 0; o < row.Cells.Count; o++)
                    {
                        if (row.Cells[o].Text == "&nbsp;")
                        {
                            row.Cells[o].Text = null;
                        }
                    }

                }
                using (SqlConnection connection = new SqlConnection("Data Source=SHUBERT-I3168\\SQLEXPRESS; Initial Catalog=Proyecto 1; Integrated Security=True"))
                {
                        for (var i = 0; i < tabladatos.Rows.Count; i++)
                        {
                            string query = "INSERT INTO usuario (username,password,nombre,apellido,rol,carnet,correo,fechanac,telefono,palabraclave) VALUES (@user,@password, @nombre, @apellido, @rol, @carnet, @correo, @fechanac, @telefono, @palabraclave)";
                            using (SqlCommand command = new SqlCommand(query, connection))
                            {
                                command.Parameters.AddWithValue("@user", tabladatos.Rows[i].Cells[0].Text);
                                command.Parameters.AddWithValue("@password", tabladatos.Rows[i].Cells[1].Text);
                                command.Parameters.AddWithValue("@nombre", tabladatos.Rows[i].Cells[2].Text);
                                command.Parameters.AddWithValue("@apellido", tabladatos.Rows[i].Cells[3].Text);
                                command.Parameters.AddWithValue("@rol", tabladatos.Rows[i].Cells[4].Text);
                                command.Parameters.AddWithValue("@carnet", tabladatos.Rows[i].Cells[5].Text);
                                command.Parameters.AddWithValue("@correo", tabladatos.Rows[i].Cells[6].Text);
                                command.Parameters.AddWithValue("@fechanac", tabladatos.Rows[i].Cells[7].Text);
                                command.Parameters.AddWithValue("@telefono", tabladatos.Rows[i].Cells[8].Text);
                                command.Parameters.AddWithValue("@palabraclave", tabladatos.Rows[i].Cells[9].Text);
                                connection.Open();
                                int result = command.ExecuteNonQuery();
                                if (result < 0)
                                {
                                    prueba.InnerText = "Error inserting data into Database!";
                                    File.Delete(@"D:\test.csv");
                                }
                                else
                                {
                                    connection.Close();
                                }
                            }
                        }
                        prueba.InnerText = "Usuarios Creados con Exito";
                        File.Delete(@"D:\test.csv");
                    }
                }
            catch (Exception ex)
            {
                prueba.InnerText = ex.Message;
                File.Delete(@"D:\test.csv");
            }
        }

        static DataTable GetDataTableFromCsv(string path, bool isFirstRowHeader)
        {
            string header = isFirstRowHeader ? "Yes" : "No";

            string pathOnly = Path.GetDirectoryName(path);
            string fileName = Path.GetFileName(path);

            string sql = @"SELECT * FROM [" + fileName + "]";

            using (OleDbConnection connection = new OleDbConnection(
                      @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + pathOnly +
                      ";Extended Properties=\"Text;HDR=" + header + "\""))
            using (OleDbCommand command = new OleDbCommand(sql, connection))
            using (OleDbDataAdapter adapter = new OleDbDataAdapter(command))
            {
                DataTable dataTable = new DataTable();
                dataTable.Locale = CultureInfo.CurrentCulture;
                adapter.Fill(dataTable);
                for (int i = dataTable.Rows.Count - 1; i >= 0; i--)
                {
                    DataRow dr = dataTable.Rows[i];
                    if (dr["usuario"].ToString() == "")
                    {
                        dr.Delete();
                    }
                }

                return dataTable;
            }
        }

    }   
}