import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule, AlertController } from '@ionic/angular';
import { FormBuilder, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { CarritoService } from '../service/carrito.services';
import { FooterComponent } from '../footer/footer.component';
import { Router } from '@angular/router';

@Component({
  selector: 'app-pago',
  templateUrl: './pago.page.html',
  styleUrls: ['./pago.page.scss'],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    IonicModule, 
    ReactiveFormsModule,
    FooterComponent
  ]
})
export class PagoPage implements OnInit {
  paymentTypes: any[] = [];
  selectedPaymentType: number = 0; 
  paymentForm: any;

  constructor(
    public carritoService: CarritoService,
    private formBuilder: FormBuilder,
    private alertController: AlertController, 
    private router: Router
  ) {
    this.paymentForm = this.formBuilder.group({
      cardName: ['', Validators.required],
      cardNumber: ['', Validators.required],
      expiryDate: ['', [Validators.required, Validators.pattern('\\d{2}/\\d{2}')]],
      cvv: ['', [Validators.required, Validators.pattern('\\d{3,4}')]],
    });
  }

  ngOnInit() {
    this.loadPaymentTypes();
  }

  async loadPaymentTypes() {
    try {
      this.paymentTypes = await this.carritoService.getPaymentTypes();
    } catch (error) {
      console.error('Error loading payment types:', error);
    }
  }

  async submitPaymentForm() {
    if (this.selectedPaymentType !== 0) {
      try {
        await this.carritoService.submitPayment(this.selectedPaymentType);
        this.paymentForm.reset(); 
        this.selectedPaymentType = 0;
        this.showConfirmationAlert(); 
      } catch (error) {
        console.error('Error submitting payment:', error);
      }
    } else {
      console.error('Seleccione una forma de pago válida antes de continuar.');
    }
  }

  async showConfirmationAlert() {
    const alert = await this.alertController.create({
      header: 'Compra realizada',
      message: 'Su compra se ha realizado correctamente. ¿Desea seguir comprando?',
      buttons: [
        {
          text: 'No',
          role: 'cancel',
          handler: () => {
            console.log('Compra finalizada');
          }
        },
        {
          text: 'Sí',
          handler: () => {
            this.router.navigate(['/home']);
          }
        }
      ]
    });

    await alert.present();
  }

  handleKeyDown(event: KeyboardEvent, action: Function, ...args: any[]) {
    if (event.key === 'Enter' || event.key === ' ') {
      event.preventDefault();
      action(...args);
    }
  }
}
