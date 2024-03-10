using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBProject;
using DBProject.DAL;
using DBProject.PatientMG;
using Newtonsoft.Json;
using OfficeIMO.Word;

namespace DB_Project
{
	public partial class Inventario : System.Web.UI.Page
	{
        public string WordConsent;
        protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                WordConsent = getallWords();
                Session["WordConsent"] = WordConsent;
            }
            else
            {
                WordConsent = Session["WordConsent"].ToString();
            }
        }

        public string getallWords()
        {
            StringBuilder sb = new StringBuilder();            

            using (cmmsystemEntities1 baseDatos = new cmmsystemEntities1())
            {
                Inventario oInventario = new Inventario();

                var allRows = baseDatos.Inventarios.ToList();
                
                using (StringWriter sw = new StringWriter(sb))
                using (JsonTextWriter writer = new JsonTextWriter(sw))
                {
                    writer.QuoteChar = '\'';
                    //writer.WriteStartArray = 

                    JsonSerializer ser = new JsonSerializer();
                    //ser.Serialize(writer, GetObjectArray(allRows));
                    ser.Serialize(writer, allRows);
                }

            }
            
            return sb.ToString();
        }

        public IEnumerable<object> GetObjectArray<T>(IEnumerable<T> obj)
        {
            return obj.Select(o => o.GetType().GetProperties().Select(p => p.GetValue(o, null)));
        }
    }
}