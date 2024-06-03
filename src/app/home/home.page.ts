import { Component } from '@angular/core';
import { IonContent} from '@ionic/angular/standalone';
import { HeaderComponent } from '../header/header.component';
import { SelectComponent } from '../select/select.component';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  standalone: true,
  imports: [HeaderComponent, SelectComponent,IonContent ],
})
export class HomePage {

  constructor() {}
}
