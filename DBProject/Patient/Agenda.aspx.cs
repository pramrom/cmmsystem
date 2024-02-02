using DBProject.DAL;
using DocumentFormat.OpenXml.Wordprocessing;
using Newtonsoft.Json;
using OfficeIMO.Word;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DBProject.Patient
{
    class WordDocuments
    {        
        public string Name { get; set; }
    }
    public partial class Agenda : System.Web.UI.Page
    {
        Patient newPaciente = new Patient();
        myDAL newmyDal = new myDAL();
        DatosConsulta newObj = new DatosConsulta();

        public string WordConsent;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"] != null)
            {
                newPaciente.LoadByPrimaryKey(Convert.ToInt32(Request.QueryString["Id"]));

                nombrePaciente.Text = newPaciente.Name + " " + newPaciente.Apellidos;

                DataTable theTable = new DataTable();
                theTable = newmyDal.LoadDoctors();

                DropDownDoctors.Items.Add("--- Seleccione un Doctor ---");

                for (int i = 0; i < theTable.Rows.Count; i++)
                {
                    string theValue = theTable.Rows[i].ItemArray[1].ToString();
                    DropDownDoctors.Items.Add(theValue);
                }
                
                WordConsent = getallWords();
            }
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
        public static string createConsentimiento(string message)
        {
            string filePath = @"F:\0 - Trabajos\Plan - Proyecto\CMMSystem\DBProject\Temp-TemplateWord\CONSENTIMIENTO mini silver.docx";

            using (WordDocument document = WordDocument.Load(filePath))
            {
                var listFound = document.Find("$Nombre");
                Console.WriteLine("Replaced (should be 2): " + listFound.Count);

                var replacedCount = document.FindAndReplace("$Nombre", "Pablito Clavo un clavito");
                Console.WriteLine("Replaced (should be 2): " + replacedCount);

                // should be 2 because it stretches over 2 paragraphs
                var replacedCount1 = document.FindAndReplace("$Edad", "56 añejos");
                Console.WriteLine("Replaced (should be 2): " + replacedCount1);

                document.CleanupDocument();

                // cleanup should merge paragraphs making it easier to find and replace text
                // this only works for same formatting though
                // may require improvement in the future to ignore formatting completely, but then it's a bit tricky which formatting to apply
                var replacedCount2 = document.FindAndReplace("This is a text more text", "Shorter text");
                Console.WriteLine("Replaced (should be 0): " + replacedCount2);

                var replacedCount3 = document.FindAndReplace("even longer", "not longer");
                Console.WriteLine("Replaced (should be 4): " + replacedCount3);

                document.Save(false);
            }

            return "The message" + message;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string a = Otrasalergias.Value;

            a = chavo3120.Value;
            a = chavo3122.Value;
            a = chavo3127.Value;
            a = chavo3129.Value;
            a = chavo3134.Value;
            a = chavo3136.Value;
            a = chavo3141.Value;
            a = chavo3143.Value;
            a = chavo3148.Value;
            a = chavo3150.Value;
            a = chavo3155.Value;
            a = chavo3157.Value;
            a = chavo3162.Value;
            a = chavo3164.Value;
            a = chavo3169.Value;
            a = chavo3171.Value;
            a = chavo3176.Value;
            a = chavo3178.Value;
            a = chavo3183.Value;
            a = chavo3185.Value;
            a = chavo3190.Value;
            a = chavo3192.Value;
            a = chavo3197.Value;
            a = chavo3199.Value;
            a = chavo3204.Value;
            a = chavo3206.Value;
            a = chavo3211.Value;
            a = chavo3213.Value;
            a = chavo3218.Value;
            a = chavo3220.Value;
            a = chavo3274.Value;
            a = chavo3276.Value;
            a = chavo3281.Value;
            a = chavo3283.Value;
            a = chavo3288.Value;
            a = chavo3290.Value;
            a = chavo3295.Value;
            a = chavo3297.Value;
            a = chavo3302.Value;
            a = chavo3304.Value;
            a = chavo3309.Value;
            a = chavo3311.Value;
            a = chavo3338.Value;
            a = chavo3340.Value;
            a = chavo3345.Value;
            a = chavo3347.Value;
            a = chavo3352.Value;
            a = chavo3354.Value;
            a = chavo3359.Value;
            a = chavo3361.Value;
            a = chavo3366.Value;
            a = chavo3368.Value;
            a = chavo3373.Value;
            a = chavo3375.Value;
            a = chavo3420.Value;
            a = chavo3422.Value;
            a = chavo3427.Value;
            a = chavo3429.Value;
            a = chavo3434.Value;
            a = chavo3436.Value;
            a = chavo3441.Value;
            a = chavo3443.Value;
            a = chavo3448.Value;
            a = chavo3461.Value;
            a = chavo3463.Value;
            a = chavo3480.Value;
            a = chavo3482.Value;


        }
    }
}