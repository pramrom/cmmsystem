using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Data.Entity.Validation;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using DBProject.DAL;
using DocumentFormat.OpenXml.Vml;

namespace DBProject.PatientMG
{
    public partial class Pacientes : System.Web.UI.Page
    {
        PatientMG newObj = new PatientMG();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string idPaciente = Request.QueryString["Id"];
                if (!String.IsNullOrEmpty(idPaciente))
                {
                    lblTitulo.Text = "Editar paciente";
                    using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                    {
                        var newPaciente = baseDatos.Patients.Find(Convert.ToInt32(idPaciente));

                        personfirstname.Value = newPaciente.Name;
                        personlastname.Value = newPaciente.Apellidos;
                        personbornat.Value = newPaciente.BirthDate.ToString().Substring(0, 10);
                        persontelephone.Value = newPaciente.Phone;
                        personCURP.Value = newPaciente.CURP;
                        personSerSol.Value = newPaciente.pacienteservi;
                        pedociv.Value = newPaciente.pedociv;
                        pnedu.Value = newPaciente.pnedu;
                        pocupa.Value = newPaciente.pocupa;
                        personPais.Value = newPaciente.País;
                        personEstado.Value = newPaciente.Estado;
                        personaddress.Value = newPaciente.Address;
                        personaddressexternalnumber.Value = newPaciente.Número_exterior;
                        personaddressinternalnumber.Value = newPaciente.Número_interior;
                        personColonia.Value = newPaciente.Colonia;
                        personzipcode.Value = newPaciente.CP;
                        citaprogam.Value = newPaciente.citaprogram;
                        hora.Value = newPaciente.hora;
                        Capturo.Value = newPaciente.Capturo;
                    }
                }
                else
                {
                    lblTitulo.Text = "Alta de nuevo paciente";
                }
            }
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
            string idPaciente = Request.QueryString["Id"];
            if (!String.IsNullOrEmpty(idPaciente))
            {
                DateTime resultDate = DateTime.ParseExact(personbornat.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                {
                    int intPaciente = Convert.ToInt32(idPaciente);

                    var newPaciente = baseDatos.Patients.SingleOrDefault(b => b.PatientID == intPaciente);
                    if (newPaciente != null)
                    {
                        newPaciente.Name = personfirstname.Value.Trim();
                        newPaciente.Apellidos = personlastname.Value.Trim();
                        newPaciente.BirthDate = resultDate;
                        newPaciente.Phone = persontelephone.Value.Trim();
                        newPaciente.CURP = personCURP.Value.Trim();
                        newPaciente.pacienteservi = personSerSol.Value.Trim();
                        newPaciente.pedociv = pedociv.Value.Trim();
                        newPaciente.pnedu = pnedu.Value.Trim();
                        newPaciente.pocupa = pocupa.Value.Trim();
                        newPaciente.País = personPais.Value.Trim();
                        newPaciente.Estado = personEstado.Value.Trim();
                        newPaciente.Address = personaddress.Value.Trim();
                        newPaciente.Número_exterior = personaddressexternalnumber.Value.Trim();
                        newPaciente.Número_interior = personaddressinternalnumber.Value.Trim();
                        newPaciente.Colonia = personColonia.Value.Trim();
                        newPaciente.CP = personzipcode.Value.Trim();
                        newPaciente.citaprogram = citaprogam.Value.Trim();
                        newPaciente.hora = hora.Value.Trim();
                        newPaciente.Capturo = Capturo.Value.Trim(); 

                        baseDatos.SaveChanges();
                    }
                }
            }
            else
            {
                try
                {
                    int newID = 0;

                    DateTime result = DateTime.ParseExact(personbornat.Value, "dd/MM/yyyy", CultureInfo.InvariantCulture);

                    using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                    {
                        Patient oPaciente = new Patient
                        {
                            Name = personfirstname.Value.Trim(),
                            Apellidos = personlastname.Value.Trim(),
                            BirthDate = result,
                            Phone = persontelephone.Value.Trim(),
                            pacientecurp = personCURP.Value.Trim(),
                            pacienteservi = personSerSol.Value.Trim(),
                            pedociv = pedociv.Value.Trim(),
                            pnedu = pnedu.Value.Trim(),
                            pocupa = pocupa.Value.Trim(),
                            País = personPais.Value.Trim(),
                            Estado = personEstado.Value.Trim(),
                            Address = personaddress.Value.Trim(),
                            Colonia = personColonia.Value.Trim(),
                            CP = personzipcode.Value.Trim(),
                            Número_interior = personaddressinternalnumber.Value.Trim(),
                            Número_exterior = personaddressexternalnumber.Value.Trim(),
                            citaprogram = citaprogam.Value.Trim(),
                            hora = hora.Value.Trim(),
                            Capturo = Capturo.Value.Trim()
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

                    if (!directoryInfo.Exists)
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
            }

            Response.Redirect("PatientHome.aspx");
        }
    }
}