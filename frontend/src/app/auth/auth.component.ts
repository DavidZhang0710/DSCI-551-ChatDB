import { Component, ViewChild } from '@angular/core';
import { FormsModule, NgModel } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { ActivatedRoute, Router } from '@angular/router';
import { AuthService } from './auth.service';

@Component({
  selector: 'app-auth',
  standalone: true,
  imports: [FormsModule, CommonModule],
  templateUrl: './auth.component.html',
  styleUrl: './auth.component.css'
})

export class AuthComponent {
  user: string = 'admin';
  password: string = '123456';
  isLoginPage: boolean = true;
  loginFailError = '';

  @ViewChild('userModel') fullnameModel?: NgModel;
  @ViewChild('passwordModel') passwordModel?: NgModel;

  constructor(private authService: AuthService, private route: ActivatedRoute, private router: Router) {}

  onSubmit() {
    this.authService.login(this.user, this.password).subscribe(
      (response) => {
        if (response.success) {
          this.router.navigate(['/chat']);
        }
      },
      (error) => {
        console.log('Log in failed', error.message);
        this.loginFailError = 'Invalid user or password.';
      }
    );
  }

  onInputChange() {
    this.loginFailError = '';
  }
}
