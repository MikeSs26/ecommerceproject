import { Injectable } from '@angular/core';
import axios from 'axios';
import { BehaviorSubject } from 'rxjs';
import { AuthService } from './auth.service';

interface Product {
  id_product : number;
  name: string;
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
  private cartItemsSubject = new BehaviorSubject<CartItem[]>(this.loadCartItems());
  cartItems$ = this.cartItemsSubject.asObservable();

  constructor(
    private authService: AuthService
  ) {}

  get cartItems(): CartItem[] {
    return this.cartItemsSubject.getValue();
  }

  private loadCartItems(): CartItem[] {
    const storedItems = localStorage.getItem('cartItems');
    return storedItems ? JSON.parse(storedItems) : [];
  }

  private saveCartItems(items: CartItem[]) {
    localStorage.setItem('cartItems', JSON.stringify(items));
  }

  addToCart(product: Product) {
    const items = this.cartItems;
    const existingItem = items.find(item => item.name === product.name);
    if (existingItem) {
      existingItem.quantity++;
    } else {
      items.push({ ...product, quantity: 1 });
    }
    this.cartItemsSubject.next(items);
    this.saveCartItems(items);
  }

  removeFromCart(item: CartItem) {
    const items = this.cartItems.filter(cartItem => cartItem.name !== item.name);
    this.cartItemsSubject.next(items);
    this.saveCartItems(items);
  }

  increaseQuantity(item: CartItem) {
    item.quantity++;
    this.cartItemsSubject.next(this.cartItems);
    this.saveCartItems(this.cartItems);
  }

  decreaseQuantity(item: CartItem) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      this.removeFromCart(item);
    }
    this.cartItemsSubject.next(this.cartItems);
    this.saveCartItems(this.cartItems);
  }

  getTotalPrice() {
    return this.cartItems.reduce((total, item) => total + item.price * item.quantity, 0);
  }

  clearCart() {
    this.cartItemsSubject.next([]);
    this.saveCartItems([]);
  }

 
  async getPaymentTypes() {
    try {
      const response = await axios.get('http://localhost:8080/api/typepays');
      return response.data; 
    } catch (error) {
      console.error('Error loading payment types:', error);
      throw error;
    }
  }

  async submitPayment(paymentType: number) {
    try {
      const currentUser = this.authService.getCurrentUser();
      const date = new Date().toLocaleDateString('en-GB');
      const payload = {
        date: date,
        fk_client: currentUser.id_client,
        fk_status: 1, 
        fk_type_pay: paymentType,
      };
  
      const response = await axios.post('http://localhost:8080/api/bills', payload);
      const lastInsertedBillId = response.data.id_bill; 
  
      const cartItems = this.cartItems;
  
      for (const item of cartItems) {
        const productPayload = {
          fk_product: item.id_product, 
          fk_bill: lastInsertedBillId,
        };
        await axios.post('http://localhost:8080/api/billproducts', productPayload);
      }
  
      this.clearCart(); 
  
    } catch (error) {
      console.error('Error al realizar el pago:', error);
      throw error;
    }
  }
  
  private padNumber(num: number, length: number): string {
    return num.toString().padStart(length, '0');
  }
}
