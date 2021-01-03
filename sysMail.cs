using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Threading.Tasks;


namespace WebApplication4
{
    public class sysMail : mailServer
    {
        public sysMail()
        {
            senderMile = "soportestoncfoncf@gmail.com";
            password = "oncf@@2020";
            host = "smtp.gmail.com";
            port = 587;
            ssl = true;
            initializeSmtpClient();
        }
    }
}