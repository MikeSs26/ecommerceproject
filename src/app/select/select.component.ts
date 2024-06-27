import { HttpClientModule } from '@angular/common/http';
import { Component, ViewChild, OnInit, } from '@angular/core';
import {
  IonSelect,
  IonSelectOption,
  IonLabel,
  IonItem,
  IonList,
  } from '@ionic/angular/standalone';

@Component({
  selector: 'app-select',
  templateUrl: './select.component.html',
  styleUrls: ['./select.component.scss'],
  standalone: true,
  imports: [IonLabel,
    IonItem,
    IonSelect,
    IonSelectOption, 
    IonList
    ]
})
export class SelectComponent  implements OnInit {

  constructor() { }

  ngOnInit() {}

  @ViewChild('select1') select1!: IonSelect;

  openSelect(select: IonSelect) {
    select.open();
  }

  closeSelect(select: IonSelect) {
    new select.ionDismiss();
  }

  redireccionar(opcionSeleccionada: string) {
    switch (opcionSeleccionada) {
      case 'opcion1':
        window.location.href = "products";
        break;
      case 'opcion2':
        window.location.href = "products";
        break;
      case 'opcion3':
        window.location.href = "products";
        break;
        case 'opcion4':
        window.location.href = "products";
        break;
      default:
        break;
    }
  }
  
}
