import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

interface Product {
  title: string;
  price: number;
  image: string;
}

interface CartItem extends Product {
  quantity: number;
}

@Injectable({
  providedIn: 'root'
})

export class CarritoService {
  private cartItemsSubject = new BehaviorSubject<CartItem[]>([]);
  cartItems$ = this.cartItemsSubject.asObservable();

  get cartItems(): CartItem[] {
    return this.cartItemsSubject.getValue();
  }

  addToCart(product: Product) {
    const items = this.cartItems;
    const existingItem = items.find(item => item.title === product.title);
    if (existingItem) {
      existingItem.quantity++;
    } else {
      items.push({ ...product, quantity: 1 });
    }
    this.cartItemsSubject.next(items);
  }

  removeFromCart(item: CartItem) {
    const items = this.cartItems.filter(cartItem => cartItem.title !== item.title);
    this.cartItemsSubject.next(items);
  }

  increaseQuantity(item: CartItem) {
    item.quantity++;
    this.cartItemsSubject.next(this.cartItems);
  }

  decreaseQuantity(item: CartItem) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      this.removeFromCart(item);
    }
    this.cartItemsSubject.next(this.cartItems);
  }

  getTotalPrice() {
    return this.cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
  }

  clearCart() {
    this.cartItemsSubject.next([]);
  }
}