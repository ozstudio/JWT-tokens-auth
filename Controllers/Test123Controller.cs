using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AuthSystem.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AuthSystem.Controllers
{
    [Route("api/[controller]")]
    public class Test123Controller : ControllerBase

    {
        public UserManager<ApplicationUser> _userManager;
        public Test123Controller(UserManager<ApplicationUser> userManager)
        {

            _userManager = userManager;

        }
     
        [HttpGet]      
        [Authorize]
        public async Task<object> Get()
        {

            string userId = User.Claims.First(c => c.Type == "UserId").Value;
            var user = await _userManager.FindByIdAsync(userId);

            return new
            {
                user.UserName,
                user.Id
            };
        }

    }
}
