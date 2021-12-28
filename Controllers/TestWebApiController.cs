using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AuthSystem.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using System.Security.Claims;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.Extensions.Options;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AuthSystem.Controllers
{
    [Route("api/[controller]")]
    public class TestWebApiController : Controller
    {

        private UserManager<ApplicationUser> _userManager;
        private SignInManager<ApplicationUser> _signInManager;
        private readonly ApplicationSettings _applicationSettings;



        public TestWebApiController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager,IOptions<ApplicationSettings> appSettings)
        {
            _userManager = userManager;
            _signInManager = signInManager;
            _applicationSettings = appSettings.Value;

        }


        // GET: api/values
        [HttpPost]
        [Route("js")]
       // public JsonResult JsonResult ([FromBody] ApplicationUserModel s)
       // {
          //  var t = s;
          //  return Json(new {success = true,result = t});


       // }




        public async Task<Object> PostAppUser([FromBody] ApplicationUserModel model)
        {
           

            var appUser = new ApplicationUser()
            {

                UserName = model.UserName,
                Email = model.Email,


            };
            try
            {

                var result =await  _userManager.CreateAsync(appUser,model.Password);

                return Ok(result);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        [HttpPost]
        [Route("Login")]
        public async Task<IActionResult> Login([FromBody] LoginModel model)
        {
            var user = await _userManager.FindByNameAsync(model.Username);


            if (user != null && await _userManager.CheckPasswordAsync(user, model.Password))
            {
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = new System.Security.Claims.ClaimsIdentity(new Claim[]
                    {
                        new Claim("UserId",user.Id.ToString())

                    }),
                    Expires = DateTime.UtcNow.AddDays(1),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_applicationSettings.JWT_Secret)), SecurityAlgorithms.HmacSha256Signature)

                };
                var tokenHandler = new JwtSecurityTokenHandler();
                var securityToken = tokenHandler.CreateToken(tokenDescriptor);
                var token = tokenHandler.WriteToken(securityToken);
                return Ok(new { token });


            }
            else
                return BadRequest(new {message = "Username or Password is incorect" } );

        }

    }
}
