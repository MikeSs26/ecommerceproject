import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent,
  IonHeader,
  IonTitle,
  IonToolbar,
  IonGrid,
  IonRow,
  IonCol,
  IonCard,
  IonCardHeader,
  IonCardTitle,
  IonCardContent,
   } from '@ionic/angular/standalone';

@Component({
  selector: 'app-products',
  templateUrl: './products.page.html',
  styleUrls: ['./products.page.scss'],
  standalone: true,
  imports: [IonContent,
    IonHeader,
    IonTitle,
    IonToolbar,
    CommonModule,
    FormsModule,
    IonGrid,
    IonRow,
    IonCol,
    IonCard,
    IonCardHeader,
    IonCardTitle,
    IonCardContent]
})
export class ProductsPage implements OnInit {

  products = [
    {
      name: 'Laptop Gamer',
      description: 'Laptop HP 15.6" con 16GB de RAM y 256GB SSD.',
      image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnBjCFAcg2aJsDj2qYkovl82huTackdsiEUA&s'
    },
    {
      name: 'Celular Gaming',
      description: 'Teléfono gaming con 16GB de RAM.',
      image: 'https://www.powerplanetonline.com/cdnassets/blog/mejores-moviles-gaming.webp'
    },
    {
      name: 'PC Gaming',
      description: 'PC Gaming con 32GB de RAM y 2TB SSD.',
      image: 'https://www.pcspecialist.es/images/landing/pcs/gaming-pc/bundle.jpg'
    },
    {
      name: 'AMD Ryzen 7 7800X',
      description: 'Procesador AMD Ryzen 7 7800X.',
      image: 'https://www.amd.com/content/dam/amd/en/images/products/processors/ryzen/2505503-ryzen-7-7800x3d.jpg'
    },
    // productos provisionales, deben ser agregados desde la base de datos
  ];

  constructor() { }

  ngOnInit() {
    console.log(this.products);
  }
}
