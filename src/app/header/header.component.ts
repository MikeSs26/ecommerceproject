import { Component, OnInit } from '@angular/core';
import { IonHeader, IonToolbar, IonTitle,IonContent, IonButtons,IonMenuButton } from '@ionic/angular/standalone';
import { SelectComponent } from '../select/select.component';
import { CarritoComponent } from '../carrito/carrito.component';
import { MenuComponent } from '../menu/menu.component';
import { LoginComponent } from '../login/login.component';
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
    LoginComponent
    
    ]
})
export class HeaderComponent  implements OnInit {

  constructor() { }

  ngOnInit() {}

}
