import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar, IonButton, IonIcon } from '@ionic/angular/standalone';

interface Product {
  title: string;
  price: number;
  image: string;
}

interface CartItem extends Product {
  quantity: number;
}

@Component({
  selector: 'app-products',
  templateUrl: './products.page.html',
  styleUrls: ['./products.page.scss'],
  standalone: true,
  imports: [
    IonContent, 
    IonHeader, 
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
      { title: 'Articulo 1', price: 150.00, image: 'assets/images/carrito.png' },
      { title: 'Articulo 2', price: 2500.00, image: 'assets/images/carrito.png' },
      // Agrega el resto de productos aquí
    ];
  
    cartItems: CartItem[] = [];
  
    addToCart(product: Product) {
      const existingItem = this.cartItems.find(item => item.title === product.title);
      if (existingItem) {
        existingItem.quantity++;
      } else {
        this.cartItems.push({ ...product, quantity: 1 });
      }
    }
  
    removeFromCart(item: CartItem) {
      this.cartItems = this.cartItems.filter(cartItem => cartItem.title !== item.title);
    }
  
    increaseQuantity(item: CartItem) {
      item.quantity++;
    }
  
    decreaseQuantity(item: CartItem) {
      if (item.quantity > 1) {
        item.quantity--;
      } else {
        this.removeFromCart(item);
      }
    }
  
    getTotalPrice() {
      return this.cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
    }
  
    checkout() {
      alert("Gracias por la compra");
      this.cartItems = [];
    }

    handleKeyDown(event: KeyboardEvent, action: Function, ...args: any[]) {
      if (event.key === 'Enter' || event.key === ' ') {
        event.preventDefault();
        action(...args);
      }
  }
}