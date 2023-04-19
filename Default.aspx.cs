using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace hw4_part2_WebApplication
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // xml validation
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get XML and XSD URLs from input fields
            string xmlUrl = TextBox1.Text;
            string xsdUrl = TextBox2.Text;

            // Download XML and XSD files
            string xmlContent = DownloadFile(xmlUrl);
            string xsdContent = DownloadFile(xsdUrl);

            // Load XML and XSD files
            XmlReaderSettings settings = new XmlReaderSettings();
            settings.ValidationType = ValidationType.Schema;
            settings.Schemas.Add(null, XmlReader.Create(new StringReader(xsdContent)));
            XmlReader xmlReader = XmlReader.Create(new StringReader(xmlContent), settings);

            // Validate XML against XSD
            bool isValid = true;
            try
            {
                while (xmlReader.Read()) { }
            }
            catch (XmlException ex)
            {
                isValid = false;
                Label3.Text = $"Error: {ex.Message}, line {ex.LineNumber}, column {ex.LinePosition}";
            }

            if (isValid)
            {
                Label3.Text = "No Error";
            }
        }

        //xml quarries
        protected void Button2_Click(object sender, EventArgs e)
        {
            // Get XML URL and path expression from input fields
            string xmlUrl = TextBox3.Text;
            string pathExpr = TextBox4.Text;

            // Download XML file
            string xmlContent = DownloadFile(xmlUrl);

            // Load XML file
            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.LoadXml(xmlContent);

            // Evaluate path expression and get result
            XmlNodeList resultNodes = xmlDoc.SelectNodes(pathExpr);
            string result = "";
            foreach (XmlNode node in resultNodes)
            {
                result += node.OuterXml + "\n";
            }

            // Display result
            Label6.Text = result;
        }

        // Download file from URL
        private string DownloadFile(string url)
        {
            //refresh string content
            string content = "";
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            using (HttpWebResponse response = (HttpWebResponse)request.GetResponse())
            {
                using (Stream stream = response.GetResponseStream())
                {
                    using (StreamReader reader = new StreamReader(stream))
                    {
                        content = reader.ReadToEnd();
                    }
                }
            }
            return content;
        }


    }
}