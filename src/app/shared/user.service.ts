import { Injectable } from '@angular/core';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';
import { HttpClient, HttpHeaders } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private fb:FormBuilder,private http:HttpClient) {}

  //readonly BaseUri = "https://localhost:5001/api";
  readonly BaseUri = "http://www.cv.ozstudio.co.il/api";

    formModel = this.fb.group({
      UserName:['',Validators.required],
      Email:[''],
      Passwords:this.fb.group({
        Password:['',[Validators.required,Validators.minLength(4)]],
        ConfirmPassword:[''],
      },{validator:this.comparePasswords})
  
    });
    comparePasswords(fb:FormGroup){
let confirmPwdCtrl = fb.get('ConfirmPassword');
if(confirmPwdCtrl.errors==null || 'passwordMismatch' in confirmPwdCtrl.errors){
  if(fb.get('Password').value != confirmPwdCtrl.value)
    confirmPwdCtrl.setErrors({passwordMismatch:true})
         else
            confirmPwdCtrl.setErrors(null)

  

}

    }

    register(){
    var body = {
  UserName: this.formModel.value.UserName,
  Email: this.formModel.value.Email,
  Password: this.formModel.value.Passwords.Password
      };
     return this.http.post(this.BaseUri + "/TestWebApi/js",body);
    }


    login(formData){
      return this.http.post(this.BaseUri + "/TestWebApi/Login",formData);

    }

    getUserProfile(){
     // var tokenHeader = new HttpHeaders({'Authorization':'Bearer ' + localStorage.getItem('token')});
      return this.http.get(this.BaseUri + '/Test123');
    }
   
}
