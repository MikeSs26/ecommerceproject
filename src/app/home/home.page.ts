  import { Component } from '@angular/core';
  import { FondoComponent } from '../fondo/fondo.component';
  import { MainCardsComponent } from '../components/main-cards/main-cards.component';
  import { FooterComponent } from '../components/footer/footer.component';
  import { IonContent,
      IonGrid,
      IonRow,
      IonCol,
      IonCard,
      IonCardHeader,
      IonCardTitle,
      IonCardContent,
  } from '@ionic/angular/standalone';

  @Component({
    selector: 'app-home',
    templateUrl: 'home.page.html',
    styleUrls: ['home.page.scss'],
    standalone: true,
    imports: [ IonContent,
      FondoComponent,
      MainCardsComponent,
      FooterComponent,
      IonGrid,
      IonRow,
      IonCol,
      IonCard,
      IonCardHeader,
      IonCardTitle,
      IonCardContent
    ],
  })
  export class HomePage {
    constructor() {}
  }
