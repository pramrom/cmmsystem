using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using DBProject.DAL;

namespace DBProject.Patient
{
    public partial class Pacientes : System.Web.UI.Page
    {
        Patient newObj = new Patient();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        public string getallJSON()
        {
            var pacientes = new List<Patient>();

            if (newObj.LoadAll())
            {
                newObj.Rewind();
                while (newObj.MoveNext())
                {
                    var paciente = new Patient()
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
            newObj.AddNew();

            newObj.Name = personfirstname.Value;
            newObj.Apellidos = personlastname.Value;
            //newObj.BirthDate = personbornat.Value;
            newObj.Email = personemail.Value;
            newObj.Teléfono_móvil = personmobile.Value;
            newObj.Phone = persontelephone.Value;
            newObj.CURP =personidentitynumber.Value;
            newObj.Address = personaddress.Value;
            newObj.Ciudad = personcity.Value;
            newObj.CP = personzipcode.Value;
            newObj.Número_exterior = personaddressexternalnumber.Value;
            newObj.Número_interior = addressinternalnumber.Value;

            newObj.Save();
        }
    }
}