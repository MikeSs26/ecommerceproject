import { Component, OnInit } from '@angular/core';
import { SearchService } from '../service/search.service';
import { ProductService } from '../service/product.service';
import { CommonModule } from '@angular/common';
import { IonicModule,  } from '@ionic/angular';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';

@Component({
  selector: 'app-search-results',
  templateUrl: './search-results.component.html',
  styleUrls: ['./search-results.component.scss'],  standalone: true,
  imports: [ 
    CommonModule, 
    IonicModule, FormsModule]
})
export class SearchResultsComponent implements OnInit {
  searchResults: any[] = [];
  showResults: boolean = false; // Variable para controlar la visibilidad del contenedor de resultados

  constructor(
    private productService: ProductService,
    private searchService: SearchService,
    private router: Router
  ) {}

  ngOnInit() {
    this.searchService.searchQuery$.subscribe(query => {
      this.performSearch(query);
    });
  }

  async performSearch(query: string) {
    if (query.trim() !== '') {
      try {
        this.searchResults = await this.productService.searchProductsByName(query);
        this.showResults = true; // Mostrar resultados cuando la búsqueda es exitosa
      } catch (error) {
        console.error('Error searching products:', error);
      }
    } else {
      this.searchResults = [];
      this.showResults = false; // Ocultar resultados si la búsqueda está vacía
    }
  }

  navigateToProduct(product: any) {
    // Navegar a la página de detalle del producto con el ID del producto
    this.router.navigateByUrl(`/product-detail/${product.id_product}`).then(() => {
      this.showResults = false; // Cerrar contenedor de resultados después de la navegación
    });
  }
  closeResultsContainer() {
    this.showResults = false; // Método para cerrar el contenedor de resultados
  }
}