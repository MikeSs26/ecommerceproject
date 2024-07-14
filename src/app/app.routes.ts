import { Routes } from '@angular/router';
import { ProductDetailPage } from './product-detail/product-detail.page';



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
  },
  {
    path: 'register',
    loadComponent: () => import('./register/register.page').then( m => m.RegisterPage)
  },
  {
    path: 'perfil',
    loadComponent: () => import('./perfil/perfil.page').then( m => m.PerfilPage)
  },

  { path: 'product-detail/:productId', component: ProductDetailPage },
  {
    path: 'product-detail',
    loadComponent: () => import('./product-detail/product-detail.page').then( m => m.ProductDetailPage)
  },

];
  
