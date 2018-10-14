using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_IPC2
{
    public partial class ASalones : System.Web.UI.Page
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

        protected void crearReservacion_ServerClick(object sender, EventArgs e)
        {

        }
    }
}