import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ClientService } from '../service/client.service';
import { Router } from '@angular/router';
import { IonicModule } from '@ionic/angular';
import { FooterComponent } from '../footer/footer.component';
import { HeaderComponent } from '../header/header.component';

@Component({
  selector: 'app-register',
  templateUrl: './register.page.html',
  styleUrls: ['./register.page.scss'],
  standalone: true,
  imports: [CommonModule, FormsModule, IonicModule , FooterComponent, HeaderComponent]
})
export class RegisterPage implements OnInit {
  name: string = '';
  lastName: string = '';
  username: string = '';
  email: string = '';
  password: string = '';
  phoneNumber: string = '';
  province: number = 0;
  errorMessage: string = '';
  successMessage: string = '';
  provinces: any[] = [];

  constructor(private clientService: ClientService, private router: Router) {}

  ngOnInit() {
    this.loadProvinces();
  }

  async loadProvinces() {
    try {
      this.provinces = await this.clientService.getProvinces();
    } catch (error) {
      console.error('Error loading provinces:', error);
    }
  }

  async register() {
    this.errorMessage = '';
    this.successMessage = '';

    if (await this.clientService.checkEmailExists(this.email)) {
      this.errorMessage = 'El correo ya está registrado';
      return;
    }
    if (await this.clientService.checkUsernameExists(this.username)) {
      this.errorMessage = 'El nombre de usuario ya está registrado';
      return;
    }

    const newClient = {
      name: this.name,
      last_name: this.lastName,
      username: this.username,
      password: this.password,
      email: this.email,
      phone_number: this.phoneNumber,
      province: { id_province: this.province } 
    };

    try {
      await this.clientService.registerClient(newClient);
      this.successMessage = 'Se ha registrado correctamente';
    } catch (error) {
      this.errorMessage = 'Error al registrar el usuario';
    }
  }

  redirectToHome() {
    this.router.navigate(['/home']); 
  }
}
