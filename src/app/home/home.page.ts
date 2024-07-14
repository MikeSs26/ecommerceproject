import { Component } from '@angular/core';
import { IonContent} from '@ionic/angular/standalone';
import { HeaderComponent } from '../header/header.component';
import { SelectComponent } from '../select/select.component';
import { FondoComponent } from '../fondo/fondo.component';
import { MenuComponent } from '../menu/menu.component';
import { FooterComponent } from '../footer/footer.component';
import { BannerComponent } from '../banner/banner.component';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  standalone: true,
  imports: [HeaderComponent, 
    SelectComponent,
    IonContent, 
    FondoComponent,
   IonContent, 
   MenuComponent,
   FooterComponent, BannerComponent],
})
export class HomePage {

  constructor() {}
}
