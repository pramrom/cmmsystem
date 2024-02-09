using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using DBProject.DAL;

namespace DBProject.PatientMG
{
    public partial class Pacientes : System.Web.UI.Page
    {
        PatientMG newObj = new PatientMG();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string getallJSON()
        {
            var pacientes = new List<PatientMG>();

            if (newObj.LoadAll())
            {
                newObj.Rewind();
                while (newObj.MoveNext())
                {
                    var paciente = new PatientMG()
                    {
                        Name = newObj.Name + " " + newObj.Apellidos,
                        BirthDate = newObj.BirthDate,
                        Sexo = newObj.Sexo
                    };

                    pacientes.Add(paciente);                    
                }

                var js = new JavaScriptSerializer();
                
                return js.Serialize(pacientes);
            }

            return string.Empty;
        }

        protected void ember6454_ServerClick(object sender, EventArgs e)
        {                        

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            try
            {
                int newID = 0;

                using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                {
                    Patient oPaciente = new Patient
                    {
                        Name = personfirstname.Value,
                        Apellidos = personlastname.Value,
                        BirthDate = Convert.ToDateTime(personbornat.Value),
                        Phone = persontelephone.Value,                        
                        País = personPais.Value,                        
                        Estado = personEstado.Value,
                        Address = personaddress.Value,
                        CP = personzipcode.Value,
                        Número_interior = personaddressinternalnumber.Value,
                        Número_exterior = personaddressexternalnumber.Value                        
                    };
                    baseDatos.Patients.Add(oPaciente);
                    baseDatos.SaveChanges();

                    newID = oPaciente.PatientID;

                    DBProject.DatosConsulta oDatosConsulta = new DBProject.DatosConsulta
                    {
                        PatientID = newID
                    };

                    baseDatos.DatosConsultas.Add(oDatosConsulta);
                    baseDatos.SaveChanges();
                }

                string path = "../media/" + newID.ToString();
                DirectoryInfo directoryInfo = new DirectoryInfo(Server.MapPath(path));

                if(!directoryInfo.Exists)
                {
                    directoryInfo.Create();
                }
            }
            catch (DbEntityValidationException ex)
            {
                foreach (var eve in ex.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Value: \"{1}\", Error: \"{2}\"",
                            ve.PropertyName,
                            eve.Entry.CurrentValues.GetValue<object>(ve.PropertyName),
                            ve.ErrorMessage);
                    }
                }
                throw;
            }

            Response.Redirect("PatientHome.aspx");
        }
    }
}