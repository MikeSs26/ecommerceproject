import { Injectable } from '@angular/core';
import { ToastController } from '@ionic/angular';
import axios from 'axios';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private apiUrl = 'http://localhost:8080/api/clients'; // URL base de la API

  constructor(private toastController: ToastController) { }

  async login(username: string, password: string): Promise<boolean> {
    try {
      const url = `${this.apiUrl}?username=${username}`;

      // Realizar la solicitud GET con Axios
      const response = await axios.get(url);

      // Obtener los clientes del cuerpo de la respuesta
      const clients = response.data;

      // Verificar si se encontró un cliente con las credenciales proporcionadas
      const client = clients.find((c: any) => c.username === username && c.password === password);

      if (client) {
        // Guardar datos del usuario en localStorage
        localStorage.setItem('currentUser', JSON.stringify(client));

        // Autenticación exitosa
        await this.presentToast('Inicio de sesión exitoso');
        return true;
      } else {
        // Credenciales incorrectas
        await this.presentToast('Credenciales incorrectas');
        return false;
      }
    } catch (error) {
      console.error('Error en la autenticación:', error);
      throw new Error('Error en la autenticación');
    }
  }

  logout() {
    localStorage.removeItem('currentUser');
    this.presentToast('Cierre de sesión exitoso');
  }

  async presentToast(message: string) {
    const toast = await this.toastController.create({
      message: message,
      duration: 2000, // Duración del toast en milisegundos
      position: 'bottom' // Posición del toast en la pantalla
    });
    toast.present();
  }

  getCurrentUser() {
    const user = localStorage.getItem('currentUser');
    return user ? JSON.parse(user) : null;
  }

  isAuthenticated(): boolean {
    return !!this.getCurrentUser();
  }
}
