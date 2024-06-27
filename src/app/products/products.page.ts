import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar, IonGrid, IonRow, IonCol, IonCard, IonCardHeader, IonCardTitle, IonCardSubtitle, IonCardContent, IonButton } from '@ionic/angular/standalone';
import { FooterComponent } from '../components/footer/footer.component';
import { FondoComponent } from "../fondo/fondo.component";

@Component({
    selector: 'app-products',
    templateUrl: './products.page.html',
    styleUrls: ['./products.page.scss'],
    standalone: true,
    imports: [IonButton, IonCardContent, IonCardSubtitle, IonCardTitle, IonCardHeader, IonCard, IonCol, IonRow, IonGrid, IonContent,
        FooterComponent,
        IonHeader,
        IonTitle,
        IonToolbar,
        CommonModule,
        FormsModule, FondoComponent]
})
export class ProductsPage implements OnInit {

  products = [
    {
      id: 1,
      name: 'Gaming Keyboard',
      price: 99.99,
      image: 'assets/images/keyboard.jpg',
      description: 'A high-quality mechanical keyboard with RGB lighting.'
    },
    {
      id: 2,
      name: 'Gaming Mouse',
      price: 49.99,
      image: 'assets/images/mouse.jpg',
      description: 'Ergonomic gaming mouse with customizable buttons.'
    },
    // Agrega más productos según sea necesario
  ];

  constructor() { }

  ngOnInit() {
    console.log(this.products);
  }

  addToCart(product: any) {
    console.log('Add to cart', product);
    // Aquí podrías agregar la lógica para manejar la adición de productos al carrito
  }
}
