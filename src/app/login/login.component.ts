import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  standalone: true,
  imports: [],
})
export class LoginComponent  implements OnInit {

  imageUrl: string = 'https://drive.google.com/uc?export=view&id=10PeUuNFTrWBpkB3RHWAKO9huLQZPLq2b';

  ErrorImage() {
    this.imageUrl = 'assets/images/login.png';}

  constructor() { }

  ngOnInit() {}

}
