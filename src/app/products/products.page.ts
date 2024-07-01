import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonTitle, IonToolbar, IonButton, IonIcon } from '@ionic/angular/standalone';
import { Router } from '@angular/router';
import axios from 'axios';
import { CarritoService } from '../service/carrito.services';

interface Brand {
  id_brand: number;
  name: string;
}

interface Product {
  id_product: number;
  name: string;
  price: number;
  brand: Brand;
  image: string;
}

interface ProductImage {
  id_images: number;
  url: string;
  fk_product: number;
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
  seleccion: number;
  selectedProductId?: number;
  urlimages: ProductImage[] = [];

  constructor(private router: Router, public CarritoService: CarritoService) {
    this.seleccion = parseInt(localStorage.getItem('seleccion') || '0', 10);
    this.fetchProducts();
  }

  fetchProducts() {
    axios.get(`http://localhost:8080/api/products?fk_subcategory=${this.seleccion}`)
      .then(response => {
        if (response.data) {
          this.products = response.data.map((product: any) => ({
            id_product: product.id_product,
            name: product.name,
            price: product.price,
            brand: product.brand
          }));

          return Promise.all(this.products.map(product => this.fetchProductsImage(product.id_product)));
        }
        return [];
      })
      .then(imagesArray => {
        if (imagesArray) {
          this.products = this.products.map((product, index) => {
            const image = imagesArray[index];
            return {
              ...product,
              image: image ? image.url : 'default-image-url'
            };
          });
        }
      })
      .catch(error => {
        console.error('Error fetching products or images:', error);
      });
  }

  fetchProductsImage(productId: number): Promise<ProductImage | null> {
    return axios.get(`http://localhost:8080/api/productimages?fk_product=${productId}`)
      .then(response => {
        if (response.data && response.data.length > 0) {
          return response.data[0];
        }
        return null;
      })
      .catch(error => {
        console.error(`Error fetching image for product ${productId}:`, error);
        return null;
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
