import { Component } from '@angular/core';
import { IonContent,
  IonGrid, IonRow, IonCol, IonCard, IonCardTitle, IonCardHeader, IonCardContent } from '@ionic/angular/standalone';

@Component({
  selector: 'app-carrusel',
  templateUrl: './carrusel.component.html',
  styleUrls: ['./carrusel.component.scss'],
  standalone: true,
  imports: [IonCardContent, IonCardHeader, IonCardTitle, IonCard, IonCol, IonRow, IonContent,
    IonGrid],
})
export class CarruselComponent {

  constructor() { }
}
