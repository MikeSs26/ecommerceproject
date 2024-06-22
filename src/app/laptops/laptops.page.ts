import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar, IonGrid, IonRow, IonCol, IonCardSubtitle, IonCard, IonCardHeader, IonCardTitle, IonCardContent, IonButton, IonItemDivider, IonLabel } from '@ionic/angular/standalone';
import { HeaderComponent } from '../header/header.component';
import { FooterComponent } from '../footer/footer.component';
import { FondoComponent } from '../fondo/fondo.component';
import { SelectComponent } from '../select/select.component';
import { Router, RouterLink, RouterLinkActive } from '@angular/router';

@Component({
  selector: 'app-laptops',
  templateUrl: './laptops.page.html',
  styleUrls: ['./laptops.page.scss'],
  standalone: true,
  imports: [IonLabel, IonItemDivider, IonButton, IonCardContent, IonCardTitle, IonCardHeader, IonCard, IonCardSubtitle, IonCol, IonRow, IonGrid, IonContent, 
    IonHeader, 
    IonTitle, 
    IonToolbar, 
    CommonModule, 
    FormsModule, 
    HeaderComponent, 
    FooterComponent, 
    FondoComponent, 
    SelectComponent, 
    RouterLinkActive, 
    RouterLink,
  ]
})
export class LaptopsPage {

  constructor(private router: Router) { }


  goToGaming(){
    this.router.navigate(['/laptops/gaming'])
  }

  goToMacOs(){
    this.router.navigate(['/macos'])
  }

  goToLinux(){
    this.router.navigate(['/linux'])
  }

  goToWindows(){
    this.router.navigate(['/windows'])
  }



}
