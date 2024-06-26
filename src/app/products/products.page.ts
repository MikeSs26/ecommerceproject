import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
<<<<<<< HEAD
import { IonContent,  IonTitle, IonToolbar, IonButton, IonIcon } from '@ionic/angular/standalone';
import { Router } from '@angular/router';
import {CarritoService} from '../services/carrito.services';
=======
import { IonContent, IonHeader, IonTitle, IonToolbar, IonButton, IonIcon } from '@ionic/angular/standalone';
import { HttpClientModule } from '@angular/common/http';
>>>>>>> fdb171bf751f4d63c765971231a34f79d52046aa

interface Product {
  title: string;
  price: number;
  image: string;
}

@Component({
  selector: 'app-products',
  templateUrl: './products.page.html',
  styleUrls: ['./products.page.scss'],
  standalone: true,
  imports: [
    IonContent, 
    IonTitle, 
    IonToolbar, 
    CommonModule, 
    FormsModule, 
    IonButton, 
    IonIcon
  ]
})

  export class ProductsPage {
    products: Product[] = [
      { title: 'Articulo 1', price: 150.00, image: '' },
      { title: 'Articulo 2', price: 2500.00, image: '' },
      // Agregar productos 
    ];
  
    constructor(private router: Router, public CarritoService: CarritoService) {}

    checkout() {
      this.router.navigate(['/pago']);
    }

    handleKeyDown(event: KeyboardEvent, action: Function, ...args: any[]) {
      if (event.key === 'Enter' || event.key === ' ') {
        event.preventDefault();
        action(...args);
      }
  }
}