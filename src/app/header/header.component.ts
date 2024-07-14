import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule,  } from '@ionic/angular';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink, RouterLinkActive, RouterModule } from '@angular/router';
import { SelectComponent } from '../select/select.component';
import { MenuComponent } from '../menu/menu.component';
import { AuthService } from '../service/auth.service';
import { BarraBusquedaComponent } from '../barra-busqueda/barra-busqueda.component';
import { SearchResultsComponent } from '../search-results/search-results.component';


@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
  standalone: true,
  imports: [
    RouterLink, 
    RouterLinkActive, 
    CommonModule, 
    RouterModule, IonicModule, FormsModule, MenuComponent, SelectComponent,
    BarraBusquedaComponent, SearchResultsComponent
    ]
})
export class HeaderComponent {
  showSubMenu: string | null = null;
  
  

  constructor(private router: Router, private authService: AuthService) {}

  toggleSubMenu(menuItem: string) {
    if (this.showSubMenu === menuItem) {
      this.showSubMenu = null;
    } else {
      this.showSubMenu = menuItem;
    }
  }

  ngOnInit(): void {
    // Implementa aquí la lógica de inicialización necesaria
  }

  openProfile() {
    if (this.authService.isAuthenticated()) {
      this.router.navigateByUrl('/perfil');
    } else {
      this.router.navigateByUrl('/loginuser');
    }
  }

  openCart() {
    console.log('Open cart');
    this.router.navigateByUrl('/pago');  }

    Inicio() {
      console.log('Open cart');
      this.router.navigateByUrl('/home');  }
      
}