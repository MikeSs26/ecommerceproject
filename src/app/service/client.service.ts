import { Injectable } from '@angular/core';
import axios from 'axios';

@Injectable({
  providedIn: 'root',
})
export class ClientService {
  private apiUrl = 'http://localhost:8080/api/clients';
  private provincesUrl = 'http://localhost:8080/api/provinces'; // Ajusta la URL si es necesario


  constructor() {}

  async checkEmailExists(email: string): Promise<boolean> {
    const response = await axios.get(`${this.apiUrl}?email=${email}`);
    return response.data.length > 0;
  }

  async checkUsernameExists(username: string): Promise<boolean> {
    const response = await axios.get(`${this.apiUrl}?username=${username}`);
    return response.data.length > 0;
  }

  async registerClient(client: any): Promise<void> {
    await axios.post(this.apiUrl, client);
  }

  async getProvinces(): Promise<any[]> {
    const response = await axios.get(this.provincesUrl);
    return response.data;
  }

}
