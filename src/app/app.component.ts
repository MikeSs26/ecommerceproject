import { Component } from '@angular/core';
import { IonApp, IonRouterOutlet,IonContent} from '@ionic/angular/standalone';
import { HeaderComponent } from './header/header.component';
import { SelectComponent } from './select/select.component';
import { FooterComponent } from './footer/footer.component';
import { HomePage } from './home/home.page';
import { FondoComponent } from './fondo/fondo.component';
import { ProductsPage } from './products/products.page';
import { PagoPage } from './pago/pago.page';
import { CarritoComponent } from './carrito/carrito.component';
import { LoginComponent } from './login/login.component';
import { MenuComponent } from './menu/menu.component'; 
import { BarraBusquedaComponent } from './barra-busqueda/barra-busqueda.component';
<<<<<<< HEAD
import { LoginuserPage } from './loginuser/loginuser.page';
=======
import { HttpClientModule } from '@angular/common/http';
>>>>>>> fdb171bf751f4d63c765971231a34f79d52046aa

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
    CarritoComponent,
    LoginComponent,
    MenuComponent,
    BarraBusquedaComponent
     ]})
     
export class AppComponent {
  constructor() {}
}
