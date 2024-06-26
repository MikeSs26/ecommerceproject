import { HttpClientModule } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { IonButton, IonButtons } from '@ionic/angular/standalone'; // Asegúrate de importar correctamente desde '@ionic/angular'

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
  standalone: true,
  imports: [IonButton, IonButtons]
})
export class LoginComponent implements OnInit {

  imageUrl: string = 'https://drive.google.com/uc?export=view&id=10PeUuNFTrWBpkB3RHWAKO9huLQZPLq2b';

  constructor(private router: Router) {}

  ngOnInit(): void {
    // Implementa aquí la lógica de inicialización necesaria
  }

  ErrorImage() {
    this.imageUrl = 'assets/images/login.png';
  }

  navigateToLogin() {
    this.router.navigateByUrl('/loginuser');
  }

}
