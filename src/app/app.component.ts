import { Component } from '@angular/core';
import { IonApp, IonRouterOutlet,IonContent} from '@ionic/angular/standalone';
import { HeaderComponent } from './header/header.component';
import { SelectComponent } from './select/select.component';
import { FooterComponent } from './footer/footer.component';
import { HomePage } from './home/home.page';
import { Router } from '@angular/router';
@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  standalone: true,
  imports: [IonApp, IonRouterOutlet,
    SelectComponent,
    HeaderComponent,
    FooterComponent,
    IonContent,
    HomePage
  ],
})
export class AppComponent {
  constructor() {}
}
