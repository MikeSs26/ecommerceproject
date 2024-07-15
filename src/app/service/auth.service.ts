import { Injectable } from '@angular/core';
import { ToastController } from '@ionic/angular';
import axios from 'axios';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  private apiUrl = 'http://localhost:8080/api/clients';

  constructor(private toastController: ToastController) { }

  async login(username: string, password: string): Promise<boolean> {
    try {
      const url = `${this.apiUrl}?username=${username}`;

      const response = await axios.get(url);

      const clients = response.data;

      const client = clients.find((c: any) => c.username === username && c.password === password);

      if (client) {
        localStorage.setItem('currentUser', JSON.stringify(client));

        await this.presentToast('Inicio de sesión exitoso');
        return true;
      } else {
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
      duration: 2000,
      position: 'bottom'
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

  async updateClient(client: any): Promise<void> {
    try {
      const url = `${this.apiUrl}/${client.id_client}`;
      await axios.put(url, client);
    } catch (error) {
      console.error('Error al actualizar el cliente:', error);
      throw new Error('Error al actualizar el cliente');
    }
  }
}