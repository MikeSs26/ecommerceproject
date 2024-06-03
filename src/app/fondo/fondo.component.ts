import { Component, OnInit } from '@angular/core';
import {
  IonContent} from '@ionic/angular/standalone';
@Component({
  selector: 'app-fondo',
  templateUrl: './fondo.component.html',
  styleUrls: ['./fondo.component.scss'],
  standalone: true,
  imports: [IonContent
    ]
})
export class FondoComponent  implements OnInit {

  imageUrl: string = 'https://drive.google.com/uc?export=view&id=10PeUuNFTrWBpkB3RHWAKO9huLQZPLq2b';

  ErrorImage() {
    this.imageUrl = 'assets/images/universo.jpg';}

  constructor() { }

  ngOnInit() {}

}
