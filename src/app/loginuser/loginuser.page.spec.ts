import { ComponentFixture, TestBed } from '@angular/core/testing';
import { LoginuserPage } from './loginuser.page';

describe('LoginuserPage', () => {
  let component: LoginuserPage;
  let fixture: ComponentFixture<LoginuserPage>;
  
  beforeEach(() => {
    fixture = TestBed.createComponent(LoginuserPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
