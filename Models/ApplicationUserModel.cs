using System;
using Microsoft.AspNetCore.Identity;

namespace AuthSystem.Models
{
    public class ApplicationUserModel
    {
        public int ApplicationUserModelId { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string FullName { get; set; }
        



    }
}
