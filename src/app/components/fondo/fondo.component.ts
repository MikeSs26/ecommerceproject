import { Component } from '@angular/core';
import { IonContent} from '@ionic/angular/standalone';
@Component({
  selector: 'app-fondo',
  templateUrl: './fondo.component.html',
  styleUrls: ['./fondo.component.scss'],
  standalone: true,
  imports: [IonContent
    ]
})
export class FondoComponent {
  constructor() { }
}
