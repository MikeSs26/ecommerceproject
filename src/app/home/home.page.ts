import { Component, ElementRef, ViewChild, AfterViewInit } from '@angular/core';
import { HeaderComponent } from '../header/header.component';
import { SelectComponent } from '../select/select.component';
import { FondoComponent } from '../fondo/fondo.component';
import { MenuComponent } from '../menu/menu.component';
import { FooterComponent } from '../footer/footer.component';
import { BannerComponent } from '../banner/banner.component';
import { IonContent, IonGrid,IonRow,IonCol,IonCard,IonCardHeader,IonCardTitle,IonCardContent,} from '@ionic/angular/standalone';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
  standalone: true,
  imports: [
    HeaderComponent, 
    SelectComponent,
    IonContent, 
    FondoComponent,
    IonContent, 
    MenuComponent,
    FooterComponent, 
    BannerComponent,
    FondoComponent,
    FooterComponent,
    IonGrid,
    IonRow,
    IonCol,
    IonCard,
    IonCardHeader,
    IonCardTitle,
    IonCardContent
  ],
})

export class HomePage implements AfterViewInit {
  @ViewChild('slider') slider!: ElementRef<HTMLDivElement>;

  constructor() {}

  ngAfterViewInit() {
    this.slider.nativeElement.scrollLeft = 0;
  }

  navigateToSlide(index: number) {
    const slideWidth = this.slider.nativeElement.clientWidth;
    this.slider.nativeElement.scroll({
      left: slideWidth * index,
      behavior: 'smooth'
    });
  }
}