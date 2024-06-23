import { Component, ViewEncapsulation } from '@angular/core';
import { CarouselModule } from '@syncfusion/ej2-angular-navigations';

@Component({
  selector: 'app-carrusel',
  templateUrl: './carrusel.component.html',
  styleUrls: ['./carrusel.component.scss'],
  standalone: true,
  imports: [CarouselModule],
})
export class CarruselComponent {
  constructor() { }
}