import { Component} from '@angular/core';
import { IonFooter, IonToolbar, IonTitle, IonSegmentButton , IonSegment, IonButton} from '@ionic/angular/standalone';
import { Router, RouterLink, RouterLinkActive, RouterModule } from '@angular/router';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.scss'],
  standalone: true,
  imports: [
    IonFooter,
    IonToolbar,
    IonTitle,
    IonSegmentButton,
    IonSegment, 
    IonButton,
    RouterLink, 
    RouterLinkActive, 
    RouterModule
  ]
})
export class FooterComponent {
 

  constructor(private router: Router) { }
  Inicio() {
    console.log('Open cart');
    this.router.navigateByUrl('/home');  }
}
