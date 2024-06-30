import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { IonicModule } from '@ionic/angular';
import { AuthService } from '../service/auth.service';
import { FooterComponent } from '../footer/footer.component';

@Component({
  selector: 'app-perfil',
  templateUrl: './perfil.page.html',
  styleUrls: ['./perfil.page.scss'],
  standalone: true,
  imports: [ CommonModule, FormsModule, IonicModule, FooterComponent]
})
export class PerfilPage implements OnInit {
  client: any;

  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit() {
    this.client = this.authService.getCurrentUser();
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/loginuser']);
  }
}