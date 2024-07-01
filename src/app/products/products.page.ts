import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent,  IonTitle, IonToolbar, IonButton, IonIcon } from '@ionic/angular/standalone';
import { Router } from '@angular/router';
import { CarritoService } from '../service/carrito.services';
import axios from 'axios';
import { Title } from '@angular/platform-browser';

interface Product {
  name: string;
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
  products: Product[] = [];
  constructor(private router: Router, public CarritoService: CarritoService) {
    this.fetchProducts();
  }
  
  fetchProducts() {
    axios.get('http://localhost:8080/api/products?fk_subcategory=1')
      .then(response => {
        // Asigna los datos de la respuesta al array products
        this.products = response.data.map((product: any) => ({
          name: product.name,
          price: product.price,
          image: product.image
        }));
      })
      .catch(error => {
        console.error('Error fetching products:', error);
      });
  }

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