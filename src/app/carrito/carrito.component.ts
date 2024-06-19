import { Component } from '@angular/core';
import {IonItem} from '@ionic/angular/standalone';
@Component({
  selector: 'app-carrito',
  templateUrl: './carrito.component.html',
  styleUrls: ['./carrito.component.scss'],
  standalone: true,
  imports: [
    IonItem
    ]
})
export class CarritoComponent {

  imageUrl: string = 'https://drive.google.com/uc?export=view&id=10PeUuNFTrWBpkB3RHWAKO9huLQZPLq2b';

  ErrorImage() {
    this.imageUrl = 'assets/images/carrito.png';}

  constructor() { }
}
