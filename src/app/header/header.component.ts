import { Component } from '@angular/core';
import { IonHeader, IonToolbar, IonTitle, IonContent, IonButtons} from '@ionic/angular/standalone';
import { SelectComponent } from '../select/select.component';
import { CarritoComponent } from '../carrito/carrito.component';
import { MenuComponent } from '../menu/menu.component';
import { LoginComponent } from '../login/login.component';
import { BarraBusquedaComponent } from '../barra-busqueda/barra-busqueda.component';
import { Router, RouterLink, RouterLinkActive, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';



@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
  standalone: true,
  imports: [
    IonHeader ,
    IonToolbar,
    IonTitle, 
    IonContent,
    IonButtons,
    SelectComponent,
    CarritoComponent,
    MenuComponent,
    LoginComponent,
    BarraBusquedaComponent, 
    RouterLink, 
    RouterLinkActive, 
    CommonModule, 
    RouterModule
    ]
})
export class HeaderComponent  {

  constructor(private router: Router) {}

  navigateToLogin() {
    this.router.navigateByUrl('/loginuser');
  }
}
