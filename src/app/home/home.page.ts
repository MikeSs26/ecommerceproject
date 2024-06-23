import { Component } from '@angular/core';
import { IonContent} from '@ionic/angular/standalone';
import { FondoComponent } from '../fondo/fondo.component';
import { MainCardsComponent } from '../main-cards/main-cards.component';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  standalone: true,
  imports: [ IonContent, 
    FondoComponent,
    IonContent,
    MainCardsComponent],
})
export class HomePage {

  constructor() {}
}
