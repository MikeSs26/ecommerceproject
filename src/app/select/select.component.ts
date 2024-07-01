import { Component, ViewChild, OnInit, } from '@angular/core';
import {
  IonSelect,
  IonSelectOption,
  IonLabel,
  IonItem,
  IonList,
  IonButton
  } from '@ionic/angular/standalone';
import { Router } from '@angular/router';


@Component({
  selector: 'app-select',
  templateUrl: './select.component.html',
  styleUrls: ['./select.component.scss'],
  standalone: true,
  imports: [IonLabel,
    IonItem,
    IonSelect,
    IonSelectOption, 
    IonList, IonButton
    ]
})


 // Número de clics para considerar como doble clic


export class SelectComponent  implements OnInit {
  clickCount: number = 0;
  static seleccion: number;
  doubleClickThreshold: number = 2;
  
  
  constructor(private router: Router) {}

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
        SelectComponent.seleccion = 1;
        break;
      case 'opcion2':
        SelectComponent.seleccion = 2;
        break;
      case 'opcion3':
        SelectComponent.seleccion = 3;
        break;
      case 'opcion4':
        SelectComponent.seleccion = 4;
        break;
      case 'opcion5':
        SelectComponent.seleccion = 5;
        break;
      case 'opcion6':
        SelectComponent.seleccion = 6;
        break;
      case 'opcion7':
        SelectComponent.seleccion = 7;
        break;
      case 'opcion8':
        SelectComponent.seleccion = 8;
        break;
      case 'opcion9':
        SelectComponent.seleccion = 9;
        break;
      case 'opcion10':
        SelectComponent.seleccion = 10;
        break;
      case 'opcion11':
        SelectComponent.seleccion = 11;
        break;
      case 'opcion12':
        SelectComponent.seleccion = 12;
        break;
      case 'opcion13':
        SelectComponent.seleccion = 13;
        break;
      case 'opcion14':
        SelectComponent.seleccion = 14;
        break;
      case 'opcion15':
        SelectComponent.seleccion = 15;
        break;
        case 'opcion16':
        SelectComponent.seleccion = 16;
        break;
      case 'opcion17':
        SelectComponent.seleccion = 17;
        break;
      default:
        SelectComponent.seleccion = 0;
        break;
    }

    localStorage.setItem('seleccion', SelectComponent.seleccion.toString());
    window.location.href = "products";
  }

  handleDoubleClick(destination: string) {
    this.clickCount++;

    if (this.clickCount === this.doubleClickThreshold) {
      // Realizar la navegación a la página de productos (o cualquier otra página)
      this.router.navigate([destination]);
      // Reiniciar el contador después de realizar la acción
      this.clickCount = 0;
    } else {
      // Reiniciar el contador si no se alcanza el umbral
      setTimeout(() => {
        this.clickCount = 0;
      }, 15000); // Reiniciar después de 300 ms (ajusta según tus necesidades)
    }
  }
  
   navigateToCategory(category: string) {
    this.router.navigate(['/product-list', { category }]);
  }
}
