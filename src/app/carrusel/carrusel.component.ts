import { Component } from '@angular/core';
import { IonicModule } from '@ionic/angular';
import { SwiperStandaloneModule } from '../Modules/swiper-standalone/swiper-standalone.module';
import { IonicSlides } from '@ionic/angular';
import { Autoplay } from 'swiper';

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
