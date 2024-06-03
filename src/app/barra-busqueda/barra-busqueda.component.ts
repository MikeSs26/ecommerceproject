import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-barra-busqueda',
  standalone: true,
  imports: [CommonModule, IonicModule, FormsModule],
  templateUrl: './barra-busqueda.component.html',
  styleUrls: ['./barra-busqueda.component.scss'],
})
export class BarraBusquedaComponent {
  QueryBusqueda: string = '';
  items: string[] = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  ProductosFiltrados: string[] = [];

  constructor() {
    this.ProductosFiltrados = [];
  }

  onSearch() {
    const query = this.QueryBusqueda.toLowerCase();
    if (query.trim() !== '') {
      this.ProductosFiltrados = this.items.filter(item => item.toLowerCase().includes(query));
    } else {
      this.ProductosFiltrados = [];
    }
    console.log('Filtered Items:', this.ProductosFiltrados);
  }
}
