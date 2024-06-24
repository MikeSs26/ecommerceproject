import { Component } from '@angular/core';
import { IonicModule } from '@ionic/angular';
import { SwiperStandaloneModule } from '../Modules/swiper-standalone/swiper-standalone.module';

@Component({
  selector: 'app-carrusel',
  templateUrl: './carrusel.component.html',
  styleUrls: ['./carrusel.component.scss'],
  standalone: true,
  imports: [IonicModule, SwiperStandaloneModule],
})
export class CarruselComponent {

  constructor() { }
}