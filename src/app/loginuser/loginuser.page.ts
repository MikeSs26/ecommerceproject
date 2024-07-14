import { Component, OnInit } from '@angular/core';
import { AuthService } from '../service/auth.service';
import { CommonModule } from '@angular/common';
import { IonicModule, AlertController } from '@ionic/angular';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { FooterComponent } from '../footer/footer.component';
import { HeaderComponent } from '../header/header.component';

@Component({
  selector: 'app-loginuser',
  templateUrl: './loginuser.page.html',
  styleUrls: ['./loginuser.page.scss'],
  standalone: true,
  imports: [CommonModule, IonicModule, FormsModule, FooterComponent, HeaderComponent]
})
export class LoginuserPage implements OnInit {
  username: string = '';
  password: string = '';
  errorMessage: string = '';

  constructor(private authService: AuthService, private router: Router, private alertController: AlertController) {}

  ngOnInit(): void {}

  async onLogin() {
    try {
      const isValid = await this.authService.login(this.username, this.password);
      if (isValid) {
        this.errorMessage = '';
        this.showSuccessAlert();
      } else {
        this.errorMessage = 'Credenciales incorrectas';
      }
    } catch (error) {
      console.error('Error logging in:', error);
      this.errorMessage = 'Error al iniciar sesión';
    }
  }

  async showSuccessAlert() {
    const alert = await this.alertController.create({
      header: 'Login exitoso',
      message: 'Iniciada sesión correctamente',
      buttons: [
        {
          text: 'Listo',
          handler: () => {
            this.router.navigate(['/home']); // Redirigir a la página de inicio
          }
        }
      ]
    });

    await alert.present();
  }

  goToRegister() {
    this.router.navigate(['/register']);
  }
}
