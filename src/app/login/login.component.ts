import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { IonButton, IonButtons } from '@ionic/angular/standalone';
import { AuthService } from '../service/auth.service'; // Importar AuthService

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  standalone: true,
  imports: [IonButton, IonButtons]
})
export class LoginComponent implements OnInit {
  imageUrl: string = 'https://drive.google.com/uc?export=view&id=10PeUuNFTrWBpkB3RHWAKO9huLQZPLq2b';

  constructor(private router: Router, private authService: AuthService) {}

  ngOnInit(): void {
    // Implementa aquí la lógica de inicialización necesaria
  }

  ErrorImage() {
    this.imageUrl = 'assets/images/login.png';
  }

  navigateToLogin() {
    if (this.authService.isAuthenticated()) {
      this.router.navigateByUrl('/perfil');
    } else {
      this.router.navigateByUrl('/loginuser');
    }
  }
}
