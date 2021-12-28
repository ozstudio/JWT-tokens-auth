using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using AuthSystem.Models;

namespace AuthSystem.DAL
{
    public class MySqlContext:IdentityDbContext <ApplicationUser>
    {
        public MySqlContext(DbContextOptions<MySqlContext> options):base(options) 
        {
           // this.Database.EnsureCreated();
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
        }
         public virtual DbSet<ApplicationUserModel> users { get; set; }
        //public DbSet<ApplicationUserModel> users { get; set; }
    }
}
