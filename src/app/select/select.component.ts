import { Component, ViewChild, OnInit, } from '@angular/core';
import { Router } from '@angular/router';
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
    IonList,
    ]
})
export class SelectComponent  implements OnInit {

  constructor(private router: Router) { }

  goToLaptops(){
    this.router.navigate(['/laptops'])
  }

  ngOnInit() {}

  // @ViewChild('select1') select1!: IonSelect;

  // openSelect(select: IonSelect) {
  //   select.open();
  // }

  // closeSelect(select: IonSelect) {
  //   new select.ionDismiss();
  // }

  // redireccionar(opcionSeleccionada: string) {
  //   switch (opcionSeleccionada) {
  //     case 'opcion1':
  //       window.location.href = "/laptops";
  //       break;
  //     case 'opcion2':
  //       window.location.href = "https://ionicframework.com/docs/api/datetime";
  //       break;
  //     case 'opcion3':
  //       window.location.href = "https://ionicframework.com/docs/api/picker";
  //       break;
  //     default:
  //       break;
  //   }
  // }


  laptops1(opcionSeleccionada: string) {
    switch (opcionSeleccionada) {
      case 'opcion1':
        window.location.href = "/laptops";
        break;
      case 'opcion2':
        window.location.href = "/macos";
        break;
      case 'opcion3':
        window.location.href = "/linux";
        break
      case 'opcion4':
        window.location.href = "/windows";
        break;
      default:
        break;
    }
  }
  
}
