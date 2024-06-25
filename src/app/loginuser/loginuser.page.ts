import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar, IonButton, IonInput, IonItem, IonLabel } from '@ionic/angular/standalone';
import { Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

@Component({
  selector: 'app-loginuser',
  templateUrl: './loginuser.page.html',
  styleUrls: ['./loginuser.page.scss'],
  standalone: true,
  imports: [
    IonContent, IonHeader, IonTitle, IonToolbar,
    IonButton, IonInput, IonItem, IonLabel,
    CommonModule, FormsModule
  ]
})
export class LoginuserPage implements OnInit {
  username: string = '';
  password: string = '';

  constructor(private authService: AuthService, private router: Router) { }

  ngOnInit(): void { }

  onLogin() {
    if (this.authService.login(this.username, this.password)) {
      this.router.navigateByUrl('/home');
    } else {
      alert('Login failed');
    }
  }
}
