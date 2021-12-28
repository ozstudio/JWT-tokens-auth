using System;
namespace AuthSystem.Models
{
    public class ApplicationSettings
    {
        public string JWT_Secret { get; set; }
        public string Client_URI { get; set; }
    }
}
