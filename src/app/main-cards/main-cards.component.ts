import { Component } from '@angular/core';
import { IonGrid, 
  IonRow,
  IonCol,
  IonCard,
  IonCardHeader,
  IonCardTitle,
  IonCardContent
 } from '@ionic/angular/standalone';

@Component({
  selector: 'app-main-cards',
  templateUrl: './main-cards.component.html',
  styleUrls: ['./main-cards.component.scss'],
  standalone: true,
  imports: [IonGrid,
    IonRow,
    IonCol,
    IonCard,
    IonCardHeader,
    IonCardTitle,
    IonCardContent
  ]
})
export class MainCardsComponent {
  constructor() { }
}
