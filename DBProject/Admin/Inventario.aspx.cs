using System;
using System.Collections.Generic;
using System.Data;
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
                GenerateDownloadLinks();
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            //string folderPath = Server.MapPath("~/media/" + idPaciente);
            string folderPath = Server.MapPath("~/media/inventario/");

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
            string path = Server.MapPath("~/media/inventario/");
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
                    dr["DownloadLink"] = Server.MapPath("~/media/inventario/") + fi.Name;
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