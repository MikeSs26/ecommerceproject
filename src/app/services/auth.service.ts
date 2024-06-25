import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  constructor() { }

  login(username: string, password: string): boolean {
    // Simular una autenticación simple
    if (username === 'user' && password === 'password') {
      return true;
    }
    return false;
  }
}
