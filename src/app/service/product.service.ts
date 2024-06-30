import { Injectable } from '@angular/core';
import axios from 'axios';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private apiUrl = 'http://localhost:8080/api/products';

  constructor() {}

  async getProducts(): Promise<any[]> {
    try {
      const response = await axios.get(this.apiUrl);
      return response.data;
    } catch (error) {
      console.error('Error fetching products:', error);
      throw error;
    }
  }

  async searchProductsByName(query: string): Promise<any[]> {
    try {
      const response = await axios.get(this.apiUrl, {
        params: {
          name: query
        }
      });
      return response.data;
    } catch (error) {
      console.error('Error searching products by name:', error);
      throw error;
    }
  }
}



