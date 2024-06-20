import { Component } from '@angular/core';
import { IonApp, 
  IonRouterOutlet, 
  IonHeader,
  IonToolbar,
  IonTitle,
  IonMenu,
  IonMenuButton,
  IonButton,
  IonButtons,
  IonIcon,
  IonSegment,
  IonSegmentButton,
  IonLabel,
  IonList,
  IonItem,
  IonContent
 } from '@ionic/angular/standalone';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss'],
  standalone: true,
  imports: [IonApp, 
    IonRouterOutlet, 
    IonHeader, 
    IonToolbar, 
    IonTitle, 
    IonMenu, 
    IonMenuButton, 
    IonButton, 
    IonButtons, 
    IonIcon,
    IonSegment,
    IonSegmentButton,
    IonLabel,
    IonList,
    IonItem,
    IonContent],
})
export class HeaderComponent {
  constructor() { }
}
