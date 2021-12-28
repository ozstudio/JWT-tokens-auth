using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AuthSystem.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AuthSystem.Controllers
{
    public class UserProfileController : ControllerBase
    {
        private UserManager<ApplicationUser> _userManager;


        public UserProfileController(UserManager<ApplicationUser> userManager)
        {

            _userManager = userManager;

        }
        // GET: /<controller>/
        // api/UserProfile
        [HttpGet]
        
        [Route("G")]
        //[Authorize]
        public async Task<object> GetUserProfile()
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