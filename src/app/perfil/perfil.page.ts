import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { IonicModule, ToastController } from '@ionic/angular';
import { AuthService } from '../service/auth.service';
import { FooterComponent } from '../footer/footer.component';
import axios from 'axios';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.page.html',
  styleUrls: ['./perfil.page.scss'],
  standalone: true,
  imports: [ CommonModule, FormsModule, IonicModule, FooterComponent]
})
export class PerfilPage implements OnInit {
  client: any;
  isEditing: boolean = false;
  originalClient: any;

  constructor(
    private authService: AuthService,
    private router: Router,
    private toastController: ToastController
  ) {}

  ngOnInit() {
    this.client = this.authService.getCurrentUser();
    this.originalClient = { ...this.client }; // Guardar una copia original del cliente
  }

  enableEditing() {
    this.isEditing = true;
  }

  async saveChanges() {
    try {
      await this.authService.updateClient(this.client);
      await this.presentToast('Cambios guardados correctamente');
      this.originalClient = { ...this.client }; // Actualizar la copia original con los cambios guardados
      this.isEditing = false;
    } catch (error) {
      console.error('Error al guardar los cambios:', error);
      await this.presentToast('Error al guardar los cambios');
    }
  }

  changesMade(): boolean {
    // Comprobar si se han hecho cambios en los datos del cliente
    return JSON.stringify(this.client) !== JSON.stringify(this.originalClient);
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/loginuser']);
  }

  async presentToast(message: string) {
    const toast = await this.toastController.create({
      message: message,
      duration: 2000,
      position: 'bottom',
    });
    toast.present();
  }
}