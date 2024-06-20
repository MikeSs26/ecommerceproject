import { Component, OnInit } from '@angular/core';
import { IonFooter, 
  IonToolbar,
  IonTitle,
  IonIcon,
  IonButton,
  IonButtons} from '@ionic/angular/standalone';


@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss'],
  standalone: true,
  imports: [IonFooter, 
    IonToolbar, 
    IonTitle, 
    IonIcon, 
    IonButton, 
    IonButtons],
})
export class FooterComponent  {
  constructor() { }
}
