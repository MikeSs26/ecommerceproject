import { Component, ViewChild, OnInit, } from '@angular/core';
import {
  IonSelect,
  IonSelectOption,
  IonLabel,
  IonItem,
  IonList,
  IonButton
  } from '@ionic/angular/standalone';
import { Router, RouterLink } from '@angular/router';


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
