import { Component } from '@angular/core';
import { IonContent} from '@ionic/angular/standalone';
import { HeaderComponent } from '../header/header.component';
import { SelectComponent } from '../select/select.component';
import { FondoComponent } from '../fondo/fondo.component';
import { MenuComponent } from '../menu/menu.component';
import { FooterComponent } from '../footer/footer.component';
import { HttpClientModule } from '@angular/common/http';

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
   FooterComponent],
})
export class HomePage {

  constructor() {}
}
