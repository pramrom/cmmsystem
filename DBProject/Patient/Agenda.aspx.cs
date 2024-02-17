using DBProject.DAL;
using DocumentFormat.OpenXml.Wordprocessing;
using Newtonsoft.Json;
using OfficeIMO.Word;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;      

namespace DBProject.PatientMG
{
    class WordDocuments
    {        
        public string Name { get; set; }
    }
    public partial class Agenda : System.Web.UI.Page
    {
        //static PatientMG newPaciente = new PatientMG();
        myDAL newmyDal = new myDAL();
        DatosConsulta newObj = new DatosConsulta();

        public string WordConsent;

        static private string varDoctor;
        public int idDoctor = 0;
        public int idPaciente = 0;
        public int idConsulta = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            idPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            if (!IsPostBack)
            {
                GenerateDownloadLinks();

                if (Request.QueryString["Id"] != null)
                {                   
                    DataTable theTable = new DataTable();
                    theTable = newmyDal.LoadDoctors();

                    System.Web.UI.WebControls.ListItem listItem = new System.Web.UI.WebControls.ListItem("Item 1");
                    listItem.Attributes.Add("id", "ListItem-1");

                    DropDownDoctors.Items.Add(new System.Web.UI.WebControls.ListItem("--- Seleccione un Doctor ---", "0"));

                    for (int i = 0; i < theTable.Rows.Count; i++)
                    {
                        int theID = Convert.ToInt32(theTable.Rows[i].ItemArray[0]);
                        string theValue = theTable.Rows[i].ItemArray[1].ToString();
                        DropDownDoctors.Items.Add(new System.Web.UI.WebControls.ListItem(theValue, theID.ToString()));
                    }

                    WordConsent = getallWords();
                    Session["WordConsent"] = WordConsent;

                    StringBuilder sb = new StringBuilder();
                    string strDoctorActual = string.Empty;

                    using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                    {
                        Appointment oAppointments = new Appointment();
                        Pacientes oPacientes = new Pacientes();

                        var newPaciente = baseDatos.Patients.Find(idPaciente);                        

                        TimeSpan timeSpan = (TimeSpan)(DateTime.Now - newPaciente.BirthDate);
                        int age = new DateTime(timeSpan.Ticks).Year - 1;

                        var lst = baseDatos.Appointments.Where(app => app.PatientID == idPaciente).OrderBy(app => app.AppointID).ToList();

                        if (lst.Count() == 0)
                        {
                            sb.AppendLine("<div class='_consultation-schedule-item_vrqzle _consultation-item_yh26d4'><div style='width: 130px;border:1px;'>");
                            sb.AppendLine();
                            sb.AppendLine("</div><div style='width: 400px;border:1px;'><div style='width: 300px;border:1px;'>");
                            sb.AppendLine("No hay citas registradas");
                            sb.AppendLine("</div></div></div>");
                        }
                        else
                        {
                            foreach (var oAppointment in lst)
                            {
                                DataRow drDoctor = newmyDal.LoadDoctor(Convert.ToInt32(oAppointment.DoctorID));

                                string strDoctor = drDoctor[1].ToString();

                                if (idConsulta == 0)
                                {
                                    idConsulta = oAppointment.AppointID;
                                    strDoctorActual = strDoctor;
                                }

                                sb.AppendLine("<div class='_consultation-schedule-item_vrqzle _consultation-item_yh26d4'><div style='width: 130px;border:1px;'>");
                                sb.AppendLine(oAppointment.Date.ToString());
                                sb.AppendLine("</div><div style='width: 400px;border:1px;'><div style='width: 300px;border:1px;'>");
                                sb.AppendLine(nombrePaciente.Text);
                                sb.AppendLine("<br />");
                                sb.AppendLine(strDoctor);
                                sb.AppendLine("<br /><button class='button _delete_16c14z ember-tooltip-target'><i class='fa fa-trash-o'></i></button></div></div></div>");

                            }
                        }

                        nombrePaciente.Text = newPaciente.Name + " " + newPaciente.Apellidos;
                        edadPaciente.Text = age.ToString();
                        DoctorActual.Text = strDoctorActual;
                        lblIdPaciente.Text = newPaciente.PatientID.ToString();
                    }

                    DivINeedToAddStuffTo.InnerHtml = sb.ToString();

                    using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                    {
                        var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == idPaciente);
                        if (result != null)
                        {
                            Otrasalergias.Value = result.palergiadec;

                            chavo3401.Value = result.pfpmens;
                            chavo3407.Value = result.pfumens;
                            chavo34131a.Value = result.pgesta;
                            chavo34132b.Value = result.pp;
                            chavo34133b.Value = result.pc;
                            chavo34134b.Value = result.pa;
                            chavo34135b.Value = result.pile;
                            chavo34137a.Value = result.plcctam;
                            chavo34138c.Value = result.plccsem;
                            chavo34139b.Value = result.psgtam;
                            chavo34130b.Value = result.psgsem;
                            chavo3413ab.Value = result.pai;
                            chavo3413b.Value = result.pacienteusg;
                        }
                    }

                }
            }
            else
            {
                WordConsent = Session["WordConsent"].ToString();
            }
            ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "text", "Func()", true);
        }

        public string getallWords()
        {
            var documentos = new List<WordDocuments>();

            string path = "../TemplatesWord";
            DirectoryInfo directoryInfo = new DirectoryInfo(Server.MapPath(path));

            FileInfo[] files = directoryInfo.GetFiles("*.*", SearchOption.AllDirectories);
            foreach (var fileInfo in files)
            {
                var documento = new WordDocuments()
                {
                    Name = fileInfo.Name
                };

                documentos.Add(documento);
            }

            StringBuilder sb = new StringBuilder();
            using (StringWriter sw = new StringWriter(sb))
            using (JsonTextWriter writer = new JsonTextWriter(sw))
            {
                writer.QuoteChar = '\'';
                //writer.WriteStartArray = 

                JsonSerializer ser = new JsonSerializer();
                ser.Serialize(writer, GetObjectArray(documentos));
            }

            return sb.ToString();
        }
        public IEnumerable<object> GetObjectArray<T>(IEnumerable<T> obj)
        {
            return obj.Select(o => o.GetType().GetProperties().Select(p => p.GetValue(o, null)));
        }

        [WebMethod]
        public static string createConsentimiento(string docto, string doctor, string paciente)
        {
            int idPaciente = Convert.ToInt32(paciente);
            // Get the current app path:
            var currentApplicationPath = HttpContext.Current.Request.PhysicalApplicationPath;

            //Get the full path of the file    
            var fullFilePath = currentApplicationPath + "\\TemplatesWord\\" + docto;

            // Get the destination path
            var copyToPath = currentApplicationPath + "\\Temp-TemplateWord\\" + docto;

            // Copy the file
            File.Copy(fullFilePath, copyToPath,true);

            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {
                Pacientes oPacientes = new Pacientes();
                var newPaciente = baseDatos.Patients.Find(idPaciente);

                using (WordDocument document = WordDocument.Load(copyToPath))
                {
                    var replacedCount = document.FindAndReplace("$pacientenombre", newPaciente.Name);
                    replacedCount = document.FindAndReplace("$pacientecalle", newPaciente.Dirección);
                    Console.WriteLine("Replaced (should be 2): " + replacedCount);

                    TimeSpan timeSpan = (TimeSpan)(DateTime.Now - newPaciente.BirthDate);
                    int age = new DateTime(timeSpan.Ticks).Year - 1;

                    replacedCount = document.FindAndReplace("$pacienteedad", age.ToString());

                    replacedCount = document.FindAndReplace("$pacientenombre", newPaciente.Name);
                    replacedCount = document.FindAndReplace("$pacienteapellidos", newPaciente.Apellidos);
                    replacedCount = document.FindAndReplace("$pacientenacimiento", newPaciente.BirthDate.ToString());
                    replacedCount = document.FindAndReplace("$pacientesexo", newPaciente.Sexo);
                    replacedCount = document.FindAndReplace("$pacientemail", newPaciente.Email);
                    replacedCount = document.FindAndReplace("$pacientecel", newPaciente.Teléfono_móvil);
                    replacedCount = document.FindAndReplace("$pacientetel", newPaciente.Phone);
                    replacedCount = document.FindAndReplace("$pacientecurp", newPaciente.CURP);
                    //replacedCount = document.FindAndReplace("$pacienteservi", newPaciente.serv);
                    replacedCount = document.FindAndReplace("$pacientecalle", newPaciente.Dirección);
                    replacedCount = document.FindAndReplace("$pacientenumero", newPaciente.Número_exterior);
                    replacedCount = document.FindAndReplace("$pacientenumeroint", newPaciente.Número_interior);
                    //replacedCount = document.FindAndReplace("$pacientecolonia", newPaciente.);
                    replacedCount = document.FindAndReplace("$pacientecp", newPaciente.CP);
                    replacedCount = document.FindAndReplace("$pacientecd", newPaciente.Ciudad);
                    replacedCount = document.FindAndReplace("$pacientepais", newPaciente.País);


                    replacedCount = document.FindAndReplace("$doctoranombre", doctor);

                    var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == newPaciente.PatientID);
                    if (result != null)
                    {
                        replacedCount = document.FindAndReplace("$pfpmens", result.pfpmens);
                        replacedCount = document.FindAndReplace("$pfumens", result.pfumens);
                        replacedCount = document.FindAndReplace("$pgesta", result.pgesta);
                        replacedCount = document.FindAndReplace("$pp", result.pp);
                        replacedCount = document.FindAndReplace("$pc", result.pc);
                        replacedCount = document.FindAndReplace("$pa", result.pa);
                        replacedCount = document.FindAndReplace("$pile", result.pile);
                        replacedCount = document.FindAndReplace("$plcctam", result.plcctam);
                        replacedCount = document.FindAndReplace("$plccsem", result.plccsem);
                        replacedCount = document.FindAndReplace("$psgtam", result.psgtam);
                        replacedCount = document.FindAndReplace("$psgsem", result.psgsem);
                        replacedCount = document.FindAndReplace("$pai", result.pai);
                        replacedCount = document.FindAndReplace("$pacienteusg", result.pacienteusg);
                    }
                    
                    document.CleanupDocument();
                    document.Save(false);
                }
            }

            return "The message" + docto;
        }

        public void Selection_Change(Object sender, EventArgs e)
        {

            varDoctor = DropDownDoctors.SelectedItem.Text;

        }
        protected void Button1_Click1(object sender, EventArgs e)
        {
            int intDoctor = Convert.ToInt32(DropDownDoctors.SelectedItem.Value);
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {
                Appointment oAppointment = new Appointment
                {
                    DoctorID = intDoctor,
                    PatientID = intPaciente,
                    Date = DateTime.Today,
                    Appointment_Status = 1
                };

                baseDatos.Appointments.Add(oAppointment);
                baseDatos.SaveChanges();
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            try
            {
                using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                {
                    var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                    if (result != null)
                    {
                        result.palergiadec = strOtA;
                        baseDatos.SaveChanges();
                    }
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

        protected void btnSaveAP(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            try
            {
                using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                {
                    var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                    if (result != null)
                    {
                        result.palergiadec = strOtA;
                        baseDatos.SaveChanges();
                    }
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

        protected void btnSaveANP(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            try
            {
                using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                {
                    var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                    if (result != null)
                    {
                        result.palergiadec = strOtA;
                        baseDatos.SaveChanges();
                    }
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

        protected void btnSaveAHF(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            try
            {
                using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                {
                    var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                    if (result != null)
                    {
                        result.palergiadec = strOtA;
                        baseDatos.SaveChanges();
                    }
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

        protected void btnSaveAGO(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            try
            {
                using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
                {
                    var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                    if (result != null)
                    {
                        result.palergiadec = strOtA;
                        baseDatos.SaveChanges();
                    }
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

        protected void btnSaveAP_Click(object sender, EventArgs e)
        {

        }

        protected void btnSaveANP_Click(object sender, EventArgs e)
        {

        }

        protected void btnSaveAHF_Click(object sender, EventArgs e)
        {

        }

        protected void btnSaveAGO_Click(object sender, EventArgs e)
        {

        }

        protected void btnAP2_Click(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {
                var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                if (result != null)
                {
                    result.phospre = true;

                    baseDatos.SaveChanges();
                }
            }
        }

        protected void btnANP2_Click(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {
                var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                if (result != null)
                {
                    result.palergiadec = strOtA;
                    baseDatos.SaveChanges();
                }
            }
        }

        protected void btnAHF2_Click(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;
            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {
                var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                if (result != null)
                {
                    result.palergiadec = strOtA;
                    baseDatos.SaveChanges();
                }
            }
        }

        protected void btnAGO2_Click(object sender, EventArgs e)
        {
            string strOtA = Otrasalergias.Value;

            string pfpmens = chavo3401.Value;
            string pfumens = chavo3407.Value;
            string pgesta = chavo34131a.Value;
            string pp = chavo34132b.Value;
            string pc = chavo34133b.Value;
            string pa = chavo34134b.Value;
            string pile = chavo34135b.Value;
            string plcctam = chavo34137a.Value;
            string plccsem = chavo34138c.Value;
            string psgtam = chavo34139b.Value;
            string psgsem = chavo34130b.Value;
            string pai = chavo3413ab.Value;
            string pacienteusg = chavo3413b.Value;


            int intPaciente = Convert.ToInt32(Request.QueryString["Id"]);

            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {
                var result = baseDatos.DatosConsultas.SingleOrDefault(b => b.PatientID == intPaciente);
                if (result != null)
                {
                    result.pfpmens = pfpmens;
                    result.pfumens = pfumens;
                    result.pgesta = pgesta;
                    result.pp = pp;
                    result.pc = pc;
                    result.pa = pa;
                    result.pile = pile;
                    result.plcctam = plcctam;
                    result.plccsem = plccsem;
                    result.psgtam = psgtam;
                    result.psgsem = psgsem;
                    result.pai = pai;
                    result.pacienteusg = pacienteusg;
                    baseDatos.SaveChanges();
                }
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //string folderPath = Server.MapPath("~/media/" + idPaciente);
            string folderPath = Server.MapPath("~/media/" + idPaciente + "/");

            //Check whether Directory (Folder) exists.
            if (!Directory.Exists(folderPath))
            {
                //If Directory (Folder) does not exists. Create it.
                Directory.CreateDirectory(folderPath);
            }

            //Save the File to the Directory (Folder).
            //FileUpload1.PostedFile.SaveAs(folderPath + Path.GetFileName(FileUpload1.FileName));

            Stream fs = FileUpload1.PostedFile.InputStream;
            BinaryReader br = new BinaryReader(fs);
            byte[] bytes = br.ReadBytes((Int32)fs.Length);

            //Save the Byte Array as File.
            string filePath = folderPath + Path.GetFileName(FileUpload1.FileName);
            File.WriteAllBytes(filePath, bytes);

            //Display the Image File.
            //Image1.ImageUrl = filePath;
            //Image1.Visible = true;


            //Display the success message.
            lblMessage.Text = Path.GetFileName(FileUpload1.FileName) + " ha sido cargado.";

            GenerateDownloadLinks();
        }

        private void GenerateDownloadLinks()
        {
            int archivos = 0;
            string path = Server.MapPath("~/media/" + idPaciente + "/");
            if (Directory.Exists(path))
            {
                DataTable ShowContent = new DataTable();
                ShowContent.Columns.Add("Icon", typeof(string));
                ShowContent.Columns.Add("DownloadLink", typeof(string));
                ShowContent.Columns.Add("FileName", typeof(string));
                DirectoryInfo di = new DirectoryInfo(path);
                archivos = di.GetFiles().Length;
                List<System.Web.UI.WebControls.ListItem> files = new List<System.Web.UI.WebControls.ListItem>();
                
                foreach (FileInfo fi in di.GetFiles())
                {
                    DataRow dr = ShowContent.NewRow();
                    dr["FileName"] = fi.Name; ;
                    dr["DownloadLink"] = Server.MapPath("~/media/" + idPaciente + "/") + fi.Name;
                    dr["Icon"] = ResolveUrl("~/media/OfficeIMO.ico");

                    files.Add(new System.Web.UI.WebControls.ListItem(Path.GetFileName(path), path));

                    ShowContent.Rows.Add(dr);
                }
                DataListContent.DataSource = ShowContent;
                DataListContent.DataBind();
            }

            lblMessage.Text = "Se han subido los siguientes archivos: " + archivos.ToString();
        }

        protected void DeleteFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument;
            File.Delete(filePath);
            GenerateDownloadLinks();
        }

        protected void ButtonDownloadContent(object sender, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                string path = e.CommandArgument.ToString();
                string name = Path.GetFileName(path);
                string ext = Path.GetExtension(path);
                Response.AppendHeader("content-disposition", "attachment; filename=" + name);
                Response.ContentType = "application/octet-stream";
                Response.WriteFile(path);
                Response.End();
            }
        }
    }
}