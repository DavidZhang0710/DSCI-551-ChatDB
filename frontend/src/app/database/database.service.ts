import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root',
})
export class DatabaseService {
  private apiUrl = `${environment.apiBaseUrl}/tables`;

  constructor(private http: HttpClient) {}

  getDatabases(): Observable<Record<string, Record<string, any[][]>>> {
    return this.http.get<Record<string, Record<string, any[][]>>>(this.apiUrl);
  }
}
