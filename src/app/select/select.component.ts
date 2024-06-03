import { Component, Input, OnInit, } from '@angular/core';
import {
  IonSelect,
  IonSelectOption,
  IonLabel,
  IonItem } from '@ionic/angular/standalone';

@Component({
  selector: 'app-select',
  templateUrl: './select.component.html',
  styleUrls: ['./select.component.scss'],
  standalone: true,
  imports: [IonLabel,
    IonItem,
    IonSelect,
    IonSelectOption,
    ]
})
export class SelectComponent  implements OnInit {

  constructor() { }

  ngOnInit() {}

  redireccionar(opcionSeleccionada: string) {
    switch (opcionSeleccionada) {
      case 'opcion1':
        window.location.href = "https://ionicframework.com/docs/api/content";
        break;
      case 'opcion2':
        window.location.href = "https://ionicframework.com/docs/api/datetime";
        break;
      case 'opcion3':
        window.location.href = "https://ionicframework.com/docs/api/picker";
        break;
      default:
        break;
    }
  }
}
