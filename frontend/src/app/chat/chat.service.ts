import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, firstValueFrom } from 'rxjs';
import { environment } from '../../environments/environment';

interface ApiResponse {
  SQL_query: string;
  SQL_result: string;
  result: string;
  error: string;
}

@Injectable({
  providedIn: 'root'
})
export class ChatService {
  private apiUrl = `${environment.apiBaseUrl}/query`;

  constructor(private http: HttpClient) {}

  sendMessage(query: string): Observable<ApiResponse> {
    return this.http.post<ApiResponse>(this.apiUrl, { query });
  }

  async sendMessageAsync(query: string) {
    try {
      const response = await firstValueFrom(this.sendMessage(query));
      return response;
    } catch (error: any) {
      throw error;
    }
  }
}
