import { Component, OnInit, CUSTOM_ELEMENTS_SCHEMA, ViewChild, AfterViewInit, ElementRef  } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar } from '@ionic/angular/standalone';
import { ActivatedRoute } from '@angular/router';
import { ProductService } from '../service/product.service';
import { CarritoService } from '../service/carrito.services';
import { FooterComponent } from '../footer/footer.component';
import { CustomButtonComponent } from '../custom-button/custom-button.component';
import axios from 'axios';

interface ProductImage {
  id_images: number;
  url: string;
  fk_product: number;
}

@Component({
  selector: 'app-product-detail',
  templateUrl: './product-detail.page.html',
  styleUrls: ['./product-detail.page.scss'],
  standalone: true,
  imports: [IonContent, 
    IonHeader, 
    IonTitle, 
    IonToolbar, 
    CommonModule, 
    FormsModule, 
    FooterComponent, 
    CustomButtonComponent
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA]
})
export class ProductDetailPage implements OnInit, AfterViewInit {
  @ViewChild('slider') slider!: ElementRef<HTMLDivElement>;
  productId: string;
  product: any; 
  urlimages: ProductImage[] = [];
  seleccion: any;
  products: any;

  constructor(private route: ActivatedRoute, private productService: ProductService, public CarritoService: CarritoService) {
    this.productId = ''; 
  }

  ngOnInit() {
    const productIdParam = this.route.snapshot.paramMap.get('productId');
    if (productIdParam !== null) {
      this.productId = productIdParam;
      this.loadProductDetail();
      this.fetchProductsImage(); 
    } else {
      console.error('Product ID is null');
     
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

  fetchProductsImage() {
    return axios.get(`http://localhost:8080/api/productimages?fk_product=${this.productId}`)
      .then(response => {
        if (response.data) {
          this.urlimages = response.data.map((image: any) => ({
            url: image.url,
          }));
          return response.data; 
        }
      })
      .catch(error => {
        console.error(`Error fetching image for product ${this.productId}:`, error);
        return null;
      });
  }

  ngAfterViewInit() {
    this.slider.nativeElement.scrollLeft = 0;
  }

  navigateToSlide(index: number) {
    const slideWidth = this.slider.nativeElement.clientWidth;
    this.slider.nativeElement.scroll({
      left: slideWidth * index,
      behavior: 'smooth'
    });
  }


}
