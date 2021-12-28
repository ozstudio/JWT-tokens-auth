import { Component, OnInit } from '@angular/core';
import { UserService } from 'src/app/shared/user.service';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent implements OnInit {

  constructor(public service:UserService) { }

  ngOnInit(): void {
  }

  onSubmit(){
    this.service.register().subscribe(
     (res:any) =>{
       if(res.succeeded){
         this.service.formModel.reset()
       }else {
         res.errors.array.forEach(element => {
           switch (element.code) {
             case "DuplicateUserName":
               //duplicate user
               break;
           
             default:
               //registration failed
               break;
           }
         });
       }
     },
      err =>{
        console.log(err)
      }
    );
  }

}
