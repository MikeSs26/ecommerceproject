import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-carrito',
  templateUrl: './carrito.component.html',
  styleUrls: ['./carrito.component.scss'],
  standalone: true,
  imports: [
    ]
})
export class CarritoComponent  implements OnInit {

  imageUrl: string = 'https://drive.google.com/uc?export=view&id=10PeUuNFTrWBpkB3RHWAKO9huLQZPLq2b';

  ErrorImage() {
    this.imageUrl = 'assets/images/carrito.png';}

  constructor() { }

  ngOnInit() {}

}
