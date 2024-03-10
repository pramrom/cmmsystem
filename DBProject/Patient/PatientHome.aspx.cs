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
using DocumentFormat.OpenXml.Wordprocessing;

namespace DBProject.PatientMG
{
    class PatientReporte
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string SerSol { get; set; }
        public string CitaProg { get; set; }
        public string CitaHora { get; set; }
        public string Capturo{ get; set; }
    }

    public partial class PatientHome : System.Web.UI.Page
    {

        PatientMG newObj = new PatientMG();

        public string AgentOptInStatus;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.AgentOptInStatus = getallJSON();
            patientInfo(sender,e);
        }

        public string getallJSON()
        {
            var pacientes = new List<PatientReporte>();

            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {                
                Pacientes oPacientes = new Pacientes();

                foreach (var entity in baseDatos.Patients)
                {
                    var paciente = new PatientReporte()
                    {
                        ID = entity.PatientID,
                        Name = entity.Name.Trim() + " " + entity.Apellidos.Trim(),
                        SerSol = entity.pacienteservi.Trim(),
                        CitaProg = entity.citaprogram.Trim(),
                        CitaHora = entity.hora.Trim(),
                        Capturo = entity.Capturo.Trim()
                    };
                    pacientes.Add(paciente);
                }

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