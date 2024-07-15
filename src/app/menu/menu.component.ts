import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { IonicModule } from '@ionic/angular';
import { IonContent } from '@ionic/angular/standalone';
@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss'],
  standalone: true,
  imports: [CommonModule, 
    IonicModule, 
    IonContent]
})
export class MenuComponent {
  navigateTo(option: string) {
  
    console.log('Navigating to:', option);
  
  }

}