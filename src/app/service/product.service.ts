import { Injectable } from '@angular/core';
import axios from 'axios';

@Injectable({
  providedIn: 'root'
})
export class ProductService {
  private apiUrl = 'http://localhost:8080/api/products';
  private apiUrl2 = 'http://localhost:8080/api/productimages';
  private productosIds = [1, 5]; // IDs de productos seleccionados


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

  getProductById(productId: string): Promise<any> {
    const url = `${this.apiUrl}/${productId}`;
    return axios.get(url)
      .then(response => response.data)
      .catch(error => {
        // Manejo de errores, por ejemplo, lanzar un error o devolver un valor por defecto
        console.error('Error fetching product details: ', error);
        throw error;
      });
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

  async getProductosSeleccionados(): Promise<any[]> {
    try {
      const response = await axios.get<any[]>(this.apiUrl);
      // Filtrar productos basados en los IDs predefinidos
      const productosSeleccionados = response.data.filter(producto =>
        this.productosIds.includes(producto.id_product)
      );
      return productosSeleccionados;
    } catch (error) {
      console.error('Error al obtener productos seleccionados:', error);
      return [];
    }
  }

  async getProductImage(): Promise<any[]> {
    try {
      const response = await axios.get<any[]>(this.apiUrl2);
      // Filtrar productos basados en los IDs predefinidos
      const urlSeleccionados = response.data.filter(image =>
        this.productosIds.includes(image.fk_product)
      );
      return urlSeleccionados;
    } catch (error) {
      console.error('Error al obtener productos seleccionados:', error);
      return [];
    }
}




getProductsByCategory(categoryId: number): Promise<any[]> {
  const url = `${this.apiUrl}?fk_subcategory=${categoryId}`;
  return axios.get<any[]>(url)
    .then(response => response.data)
    .catch(error => {
      console.error(`Error fetching products for category ${categoryId}`, error);
      throw error; // Puedes manejar el error según tus necesidades
    });
}

getImageById(productId: string): Promise<any> {
  const url = `${this.apiUrl2}?fk_product=${productId}`;
  return axios.get(url)
    .then(response => response.data)
    .catch(error => {
      // Manejo de errores, por ejemplo, lanzar un error o devolver un valor por defecto
      console.error('Error fetching product details: ', error);
      throw error;
    });
}

}