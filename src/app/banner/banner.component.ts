import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { FormsModule } from '@angular/forms';
import { RouterLink } from '@angular/router';
import { ProductService } from '../service/product.service';
import { trigger, transition, style, animate } from '@angular/animations';

@Component({
  selector: 'app-banner',
  templateUrl: './banner.component.html',
  styleUrls: ['./banner.component.scss'],
  standalone: true,
  imports: [CommonModule, IonicModule, FormsModule, RouterLink], 
  animations: [
    trigger('fadeInOut', [
      transition(':enter', [
        style({ opacity: 0 }),
        animate('500ms ease-out', style({ opacity: 1 }))
      ]),
      transition(':leave', [
        animate('500ms ease-in', style({ opacity: 0 }))
      ])
    ])
  ]
})
export class BannerComponent implements OnInit {
  productos: any[] = [];
  currentIndex = 0;
  urlimages: any[] = [];
  intervalId: any;

  constructor(private productService: ProductService) { }

  ngOnInit() {
    this.loadProductosSeleccionados();
    this.loadImagesSeleccionados();
    this.startAutoSlide();
  }

  ngOnDestroy() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
    }
  }

  async loadProductosSeleccionados() {
    this.productos = await this.productService.getProductosSeleccionados();
  }

  async loadImagesSeleccionados() {
    this.urlimages = await this.productService.getProductImage(); // Assuming it returns an array of images
  }

  startAutoSlide() {
    this.intervalId = setInterval(() => {
      this.nextProduct();
    }, 5000); // Cambia 5000 por el intervalo en milisegundos que desees
  }

  nextProduct() {
    this.currentIndex = (this.currentIndex + 1) % this.productos.length;
  }

  previousProduct() {
    this.currentIndex = (this.currentIndex - 1 + this.productos.length) % this.productos.length;
  }

  trackByFn(index: number, item: any) {
    return item.id_product; // Cambia por el campo único de identificación de tu producto
  }
}