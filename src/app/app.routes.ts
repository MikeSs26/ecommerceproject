<<<<<<< HEAD
import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'home',
    loadComponent: () => import('./home/home.page').then((m) => m.HomePage),
  },
  {
    path: 'products',
    loadComponent: () => import('./products/products.page').then( m => m.ProductsPage)
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full',
  },
  {
    path: 'pago',
    loadComponent: () => import('./pago/pago.page').then( m => m.PagoPage)
  },
  {
    path: 'loginuser',
    loadComponent: () => import('./loginuser/loginuser.page').then( m => m.LoginuserPage)
=======
import { Routes } from '@angular/router';

export const routes: Routes = [
  {
    path: 'home',
    loadComponent: () => import('./home/home.page').then((m) => m.HomePage),
  },
  {
    path: 'products',
    loadComponent: () => import('./products/products.page').then( m => m.ProductsPage)
  },
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full',
  },
  {
    path: 'carrito',
    loadComponent: () => import('./carrito/carrito.page').then( m => m.CarritoPage)
  },
  {
    path: 'loginuser',
    loadComponent: () => import('./loginuser/loginuser.page').then( m => m.LoginuserPage)
  },  {
    path: 'client-list',
    loadComponent: () => import('./client-list/client-list.page').then( m => m.ClientListPage)
>>>>>>> fdb171bf751f4d63c765971231a34f79d52046aa
  },

  
  



];