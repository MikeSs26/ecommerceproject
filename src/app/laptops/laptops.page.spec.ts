import { ComponentFixture, TestBed } from '@angular/core/testing';
import { LaptopsPage } from './laptops.page';

describe('LaptopsPage', () => {
  let component: LaptopsPage;
  let fixture: ComponentFixture<LaptopsPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(LaptopsPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
