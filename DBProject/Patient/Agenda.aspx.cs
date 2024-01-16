using DocumentFormat.OpenXml.Wordprocessing;
using Newtonsoft.Json;
using OfficeIMO.Word;
using System;
using System.Collections.Generic;
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
        public string WordConsent;

        protected void Page_Load(object sender, EventArgs e)
        {
            WordConsent = getallWords();
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
    }
}