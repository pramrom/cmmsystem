using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBProject.DAL;
using System.Data;
using Newtonsoft.Json;
using System.IO;
using System.Text;

namespace DBProject.Patient
{
    class PatientReporte
    {
        public string ID { get; set; }
        public string Name { get; set; }                
        public string gender { get; set; }               
        public DateTime? dateOfBirth { get; set; }
    }

    public partial class PatientHome : System.Web.UI.Page
    {

        Patient newObj = new Patient();

        public string AgentOptInStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.AgentOptInStatus = getallJSON();
            patientInfo(sender,e);
        }

        public string getallJSON()
        {
            var pacientes = new List<PatientReporte>();

            if (newObj.LoadAll())
            {
                newObj.Rewind();
                do
                {
                    var paciente = new PatientReporte()
                    {
                        ID = newObj.PatientID.ToString(),
                        Name = newObj.Name.Trim() + " " + newObj.Apellidos.Trim(),
                        //dateOfBirth = newObj.BirthDate,                        
                    };

                    pacientes.Add(paciente);
                } while (newObj.MoveNext());

                StringBuilder sb = new StringBuilder();
                using (StringWriter sw = new StringWriter(sb))
                using (JsonTextWriter writer = new JsonTextWriter(sw))
                {
                    writer.QuoteChar = '\'';
                    //writer.WriteStartArray = 

                    JsonSerializer ser = new JsonSerializer();
                    ser.Serialize(writer, GetObjectArray(pacientes));
                }

                return sb.ToString();
            }

            return string.Empty;
        }

        public IEnumerable<object> GetObjectArray<T>(IEnumerable<T> obj)
        {
            return obj.Select(o => o.GetType().GetProperties().Select(p => p.GetValue(o, null)));
        }

        //-----------------------Function1--------------------------//

        protected void patientInfo (object sender, EventArgs e)
        {
            myDAL objmyDAl = new myDAL();

        //    int pid = (int)Session["idoriginal"];

        //    string name      = "";
        //    string phone     = "";
        //    string address   = "";
        //    string birthDate = "";
        //    int    age       = 0 ;
        //    string gender    = "";


        //    int status = objmyDAl.patientInfoDisplayer(pid, ref name, ref phone, ref address, ref birthDate, ref age, ref gender);

        //    if (status == -1)
        //    {
        //        Response.Write("<script>alert('There was some error in retrieving the Patient's Info.');</script>");
        //    }

        //    else if (status == 0)
        //    {
        //        PName.Text      = name;
        //        PPhone.Text     = phone;
        //        PBirthDate.Text = birthDate;
        //        PatientAge.Text = age.ToString();
        //        PAddress.Text   = address;
        //        PGender.Text    = gender;
        //    }

        //    return;
        }


        //-----------------------Add a new function here------------------//
    }
}