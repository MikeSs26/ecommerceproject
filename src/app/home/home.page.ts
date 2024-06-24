import { Component } from '@angular/core';
import { IonContent} from '@ionic/angular/standalone';
import { FondoComponent } from '../fondo/fondo.component';
import { MainCardsComponent } from '../main-cards/main-cards.component';
import { CarruselComponent } from '../carrusel/carrusel.component';
import { FooterComponent } from '../components/footer/footer.component';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  standalone: true,
  imports: [ IonContent, 
    FondoComponent,
    IonContent,
    MainCardsComponent,
    CarruselComponent,
    FooterComponent],
})
export class HomePage {
  constructor() {}
}
