using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2
{
    public partial class Inicio : System.Web.UI.Page
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
            } catch(Exception exp)
            {
                Response.Redirect("Login.aspx");
            }

            DateTime dateTime = DateTime.Now;
            DataRow dr;
            DataTable dt = new DataTable();
            dt.Columns.Add("Lunes");
            dt.Columns.Add("Martes");
            dt.Columns.Add("Miercoles");
            dt.Columns.Add("Jueves");
            dt.Columns.Add("Viernes");
            dt.Columns.Add("Sabado");
            dt.Columns.Add("Domingo");
            dr = dt.NewRow();
            //Nombre del mes
            if(int.Parse(dateTime.Month.ToString()) == 1)
            {
                mes.InnerText = "Enero";
            } else if (int.Parse(dateTime.Month.ToString()) == 2)
            {
                mes.InnerText = "Febrero";
            } else if(int.Parse(dateTime.Month.ToString()) == 3)
            {
                mes.InnerText = "Marzo";
            } else if(int.Parse(dateTime.Month.ToString()) == 4)
            {
                mes.InnerText = "Abril";
            }
            else if (int.Parse(dateTime.Month.ToString()) == 5)
            {
                mes.InnerText = "Mayo";
            }
            else if (int.Parse(dateTime.Month.ToString()) == 6)
            {
                mes.InnerText = "Junio";
            }
            else if (int.Parse(dateTime.Month.ToString()) == 7)
            {
                mes.InnerText = "Julio";
            }
            else if (int.Parse(dateTime.Month.ToString()) == 8)
            {
                mes.InnerText = "Agosto";
            }
            else if (int.Parse(dateTime.Month.ToString()) == 9)
            {
                mes.InnerText = "Septiembre";
            }
            else if (int.Parse(dateTime.Month.ToString()) == 10)
            {
                mes.InnerText = "Octubre";
            }
            else if (int.Parse(dateTime.Month.ToString()) == 11)
            {
                mes.InnerText = "Noviembre";
            } else
            {
                mes.InnerText = "Diciembre";
            }
            //Calendario
            for (int i = 0; i < DateTime.DaysInMonth(dateTime.Year, dateTime.Month); i += 1)
            {
                if (Convert.ToDateTime(dateTime.AddDays(i)).ToString("dddd") == "Monday")
                {
                    dr["Lunes"] = i + 1;
                }
                if (dateTime.AddDays(i).ToString("dddd") == "Tuesday")
                {
                    dr["Martes"] = i + 1;
                }
                if (dateTime.AddDays(i).ToString("dddd") == "Wednesday")
                {
                    dr["Miercoles"] = i + 1;

                }
                if (dateTime.AddDays(i).ToString("dddd") == "Thursday")
                {
                    dr["Jueves"] = i + 1;
                }
                if (dateTime.AddDays(i).ToString("dddd") == "Friday")
                {
                    dr["Viernes"] = i + 1;
                }
                if (dateTime.AddDays(i).ToString("dddd") == "Saturday")
                {
                    dr["Sabado"] = i + 1;
                }
                if (dateTime.AddDays(i).ToString("dddd") == "Sunday")
                {
                    dr["Domingo"] = i + 1;
                    dt.Rows.Add(dr);
                    dr = dt.NewRow();
                    continue;
                }
                if (i == DateTime.DaysInMonth(dateTime.Year, dateTime.Month) - 1)
                {
                    dt.Rows.Add(dr);
                    dr = dt.NewRow();

                }

            }

            GridView1.DataSource = dt;
            GridView1.DataBind();
            foreach (GridViewRow row in GridView1.Rows)
            {
                for(int o = 0; o < row.Cells.Count; o++)
                {
                    if (row.Cells[o].Text == dateTime.Day.ToString())
                    {
                        row.Cells[o].CssClass = "current-day";
                        mes.InnerText += " " + dateTime.Year;
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
    }
}