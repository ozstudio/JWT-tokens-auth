using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AuthSystem.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AuthSystem.Controllers
{


    [Route("api/[controller]")]
    [ApiController]
    public class AppUserController : ControllerBase
    {
        private UserManager<ApplicationUser> _userManager;
        private SignInManager<ApplicationUser> _signInManager;


        public AppUserController(UserManager<ApplicationUser> userManager,SignInManager<ApplicationUser> signInManager)
        {
            _userManager = userManager;
            _signInManager = signInManager;
        }

        [HttpPost]
        [Route("Register")]
        public async Task <Object> PostAppUser(ApplicationUserModel model)
        {
            var appUser = new ApplicationUser()
            {

                UserName = model.UserName,
                Email = model.Email,
                FullName = model.FullName1

            };
            try
            {
                var result =await  _userManager.CreateAsync(appUser, model.Password);
                return Ok(result);
            }
            catch (Exception ex)
            {
                throw ex; 
            }

        }


        [Route("api/[controller]/reg")]
        public ActionResult Reg()
        {
            return Content("ok");
            
        }


    }
}
