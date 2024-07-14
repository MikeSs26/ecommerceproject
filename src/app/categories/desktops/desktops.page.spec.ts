import { ComponentFixture, TestBed } from '@angular/core/testing';
import { DesktopsPage } from './desktops.page';

describe('DesktopsPage', () => {
  let component: DesktopsPage;
  let fixture: ComponentFixture<DesktopsPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(DesktopsPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
