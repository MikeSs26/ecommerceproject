import { Component   } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonBreadcrumbs, IonBreadcrumb, IonLabel, IonItem,IonButton, IonInput } from '@ionic/angular/standalone';
import {CarritoService} from '../service/carrito.services';

@Component({
  selector: 'app-pago',
  templateUrl: './pago.page.html',
  styleUrls: ['./pago.page.scss'],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    IonContent, 
    IonBreadcrumb,
    IonItem, 
    IonLabel, 
    IonButton,
    IonInput, 
    IonBreadcrumbs
  ]
})
export class PagoPage {
  constructor (public CarritoService: CarritoService) {}


  submitPaymentForm() {
    alert('Pago realizado con éxito :D');
    this.CarritoService.clearCart();
}

handleKeyDown(event: KeyboardEvent, action: Function, ...args: any[]) {
  if (event.key === 'Enter' || event.key === ' ') {
    event.preventDefault();
    action(...args);
  }
}
}