import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { FormsModule } from '@angular/forms';
import { SearchService } from '../service/search.service';

@Component({
  selector: 'app-barra-busqueda',
  standalone: true,
  imports: [CommonModule, IonicModule, FormsModule],
  templateUrl: './barra-busqueda.component.html',
  styleUrls: ['./barra-busqueda.component.scss'],
})
export class BarraBusquedaComponent { searchQuery: string = '';

  constructor(private searchService: SearchService) {}

  ngOnInit() {}

  onSearch() {
    this.searchService.setSearchQuery(this.searchQuery);
  }
}