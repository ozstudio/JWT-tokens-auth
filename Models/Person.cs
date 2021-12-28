using System;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity;

namespace AuthSystem.Models
{
    public class Person:IdentityUser
    {
       // [Column(TypeName ="nvarchar(150)")]
        public string FullName1 { get; set; }


    }
}
