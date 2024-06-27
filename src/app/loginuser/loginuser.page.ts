import { Component, OnInit } from '@angular/core';
import { AuthService } from '../service/auth.service';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-loginuser',
  templateUrl: './loginuser.page.html',
  styleUrls: ['./loginuser.page.scss'],
  standalone: true,
  imports: [CommonModule, IonicModule, FormsModule]
})
export class LoginuserPage implements OnInit {
  username: string = '';
  password: string = '';
  errorMessage: string = '';

  constructor(private authService: AuthService) {}

  ngOnInit(): void {}

  async onLogin() {
    try {
      const isValid = await this.authService.login(this.username, this.password);
      if (isValid) {
        // Login exitoso, redirigir a la página principal o realizar acciones necesarias
        console.log('Login successful');
        this.errorMessage = '';
      } else {
        // Contraseña incorrecta o usuario no encontrado
        this.errorMessage = 'Credenciales incorrectas';
      }
    } catch (error) {
      console.error('Error logging in:', error);
      this.errorMessage = 'Error al iniciar sesión';
    }
  }
}
