import { Component, OnInit, CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar } from '@ionic/angular/standalone';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from '../service/product.service';
import { CarritoService } from '../service/carrito.services';
import axios  from 'axios';



@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.page.html',
  styleUrls: ['./product-detail.page.scss'],
  standalone: true,
  imports: [IonContent, IonHeader, IonTitle, IonToolbar, CommonModule, FormsModule],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class ProductDetailPage implements OnInit {
  productId: string;
  product: any; // Define el tipo de tu producto aquí
  urlimages: any;
  seleccion: any;
  products: any;

  

  constructor(private route: ActivatedRoute, private productService: ProductService, public CarritoService: CarritoService) {
    this.productId = ''; // Inicializar productId como string vacío
  }

  ngOnInit() {
    const productIdParam = this.route.snapshot.paramMap.get('productId');
    if (productIdParam !== null) {
      this.productId = productIdParam;
      this.loadProductDetail();
      this.loadProducImages();
    } else {
      console.error('Product ID is null');
      // Puedes manejar el caso donde productId es null, por ejemplo, redirigiendo o mostrando un mensaje de error
    }
  }

  loadProductDetail() {
    this.productService.getProductById(this.productId)
      .then((product) => {
        this.product = product;
      })
      .catch((error) => {
        console.error('Error fetching product details: ', error);
      });
  }

  handleKeyDown(event: KeyboardEvent, action: Function, ...args: any[]) {
    if (event.key === 'Enter' || event.key === ' ') {
      event.preventDefault();
      action(...args);
    }
  }
  loadProducImages() {
    this.productService.getImageById(this.productId)
      .then((image) => {
        this.urlimages = image;
      })
      .catch((error) => {
        console.error('Error fetching product details: ', error);
      });
  }

  
}