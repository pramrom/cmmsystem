using System;
using System.Collections.Generic;
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
            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {
                Patient oPaciente = new Patient
                {
                    Name = personfirstname.Value,
                    Apellidos = personlastname.Value,
                    BirthDate = Convert.ToDateTime(personbornat.Value),
                    Phone = persontelephone.Value,
                    Address = personaddress.Value,
                    Ciudad = personcity.Value,
                    CP = personzipcode.Value,
                    Número_exterior = personaddressexternalnumber.Value,
                    Número_interior = addressinternalnumber.Value
                };
                baseDatos.Patients.Add(oPaciente);
                baseDatos.SaveChanges();

                int newID = oPaciente.PatientID;

                DBProject.DatosConsulta oDatosConsulta = new DBProject.DatosConsulta
                {
                    PatientID = newID
                };

                baseDatos.DatosConsultas.Add(oDatosConsulta);
                baseDatos.SaveChanges();
            }

            Response.Redirect("PatientHome.aspx");
        }
    }
}