import { Injectable } from '@angular/core';
import { HttpClient} from '@angular/common/http';
import { BehaviorSubject, Observable, of, tap } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
    private isLoggedInSubject: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
    private apiUrl = `${environment.apiBaseUrl}/login`

    constructor(private http: HttpClient){};

    get isLoggedIn$() {
      return this.isLoggedInSubject.asObservable();
    }

    login(user: string, password: string): Observable<any> {
      return this.http.post<any>(this.apiUrl, { user, password }).pipe(
        tap((user) => {
          this.isLoggedInSubject.next(true);
        })
      );
    }
  
    logout(): Observable<any> {
      return of({ success: true }).pipe(
        tap(() => {
          this.isLoggedInSubject.next(false);
        })
      );
    }
}
