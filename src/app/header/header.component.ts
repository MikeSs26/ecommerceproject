import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule,  } from '@ionic/angular';
import { FormsModule } from '@angular/forms';
import { RouterLink, RouterLinkActive, RouterModule } from '@angular/router';
import { MenuController } from '@ionic/angular';
import { MenuComponent } from '../menu/menu.component';


@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
  standalone: true,
  imports: [
    RouterLink, 
    RouterLinkActive, 
    CommonModule, 
    RouterModule, IonicModule, FormsModule, MenuComponent
    ]
})
export class HeaderComponent {
  showSubMenu: string | null = null;

  constructor() {}

  toggleSubMenu(menuItem: string) {
    if (this.showSubMenu === menuItem) {
      this.showSubMenu = null;
    } else {
      this.showSubMenu = menuItem;
    }
  }

  openCart() {
    console.log('Open cart');
    // Implementa la lógica para abrir el carrito
  }

  openProfile() {
    console.log('Open profile');
    // Implementa la lógica para abrir el perfil
  }
}