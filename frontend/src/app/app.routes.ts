import { Routes } from '@angular/router';
import { ChatComponent } from './chat/chat.component';
import { DatabaseComponent } from './database/database.component';
import { AuthComponent } from './auth/auth.component';

export const routes: Routes = [
  { path: '', redirectTo: 'auth', pathMatch: 'full' },
  { path: 'chat', component: ChatComponent},
  { path: 'database', component: DatabaseComponent},
  { path: 'auth', component: AuthComponent }
];