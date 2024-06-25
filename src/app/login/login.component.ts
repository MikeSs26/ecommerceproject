import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import {IonButton,IonButtons} from '@ionic/angular/standalone';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  standalone: true,
  imports: [
    IonButton, IonButtons
  ],
})
export class LoginComponent  implements OnInit {

  imageUrl: string = 'https://drive.google.com/uc?export=view&id=10PeUuNFTrWBpkB3RHWAKO9huLQZPLq2b';

  ErrorImage() {
    this.imageUrl = 'assets/images/login.png';}

    constructor(private router: Router) {}
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

    navigateToLogin() {
      this.router.navigateByUrl('/loginuser');
    }

}
