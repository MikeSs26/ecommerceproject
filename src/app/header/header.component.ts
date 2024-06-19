import { Component } from '@angular/core';
import { IonHeader, IonToolbar, IonTitle,IonContent, IonButtons} from '@ionic/angular/standalone';
import { SelectComponent } from '../select/select.component';
import { CarritoComponent } from '../carrito/carrito.component';
import { MenuComponent } from '../menu/menu.component';
import { LoginComponent } from '../login/login.component';
import { BarraBusquedaComponent } from '../barra-busqueda/barra-busqueda.component';
import {RouterLink, RouterLinkActive } from '@angular/router';


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
    RouterLinkActive
    
    ]
})
export class HeaderComponent  {

  constructor() { }

}
