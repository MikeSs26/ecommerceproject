import { Component } from '@angular/core';
import { IonApp, IonRouterOutlet,IonContent} from '@ionic/angular/standalone';
import { HeaderComponent } from './header/header.component';
import { SelectComponent } from './select/select.component';
import { FooterComponent } from './footer/footer.component';
import { HomePage } from './home/home.page';
import { FondoComponent } from './fondo/fondo.component';
import { ProductsPage } from './products/products.page';
import { PagoPage } from './pago/pago.page';
import { MenuComponent } from './menu/menu.component'; 
import { BarraBusquedaComponent } from './barra-busqueda/barra-busqueda.component';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  standalone: true,
  imports: [
    IonApp, 
    IonRouterOutlet,
    SelectComponent,
    HeaderComponent,
    FooterComponent,
    IonContent,
    HomePage,
    FondoComponent, 
    ProductsPage, 
    PagoPage,
    MenuComponent,
    BarraBusquedaComponent
     ]})
     
export class AppComponent {
  constructor() {}
}
