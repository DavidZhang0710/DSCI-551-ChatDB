import { Component } from '@angular/core';
import { NgIf, NgFor, NgClass } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ChatService } from './chat.service';
import { MessageComponent } from '../message/message.component';

@Component({
  selector: 'app-chat',
  standalone: true,
  imports: [NgIf, NgFor, NgClass, FormsModule, MessageComponent],
  templateUrl: './chat.component.html',
  styleUrl: './chat.component.css'
})
export class ChatComponent {
  messages: { text: string; sender: 'user' | 'bot'; danger: boolean; hiddenContent: any; isDetailVisible: boolean; id: number }[] = [];
  inputText: string = '';
  idx: number = 0;
  isloading: boolean = false;

  constructor(private chatService: ChatService) { }

  async sendMessage() {
    if (this.isloading) {
      return;
    }

    if (!this.inputText.trim()) return;

    this.isloading = true;
    const userMessage = this.inputText;
    this.messages.unshift({ text: userMessage, sender: 'user', danger: false, hiddenContent: null, isDetailVisible: false, id: this.idx++ });
    this.inputText = '';
    
    try {
      const res = await this.chatService.sendMessageAsync(userMessage);
      console.log('Response:', res);
      this.messages.unshift({ text: res.result, sender: 'bot', danger: false, hiddenContent: this.formatDetail(res), isDetailVisible: true, id: this.idx++ });
      this.isloading = false;
    } catch (error: any) {
      console.error('Error:', error);
      if (error.status === 400 && error.error?.error) {
        this.messages.unshift({ text: error.error.error, sender: 'bot', danger: true, hiddenContent: null, isDetailVisible: false, id: this.idx++ });
      } else {
        this.messages.unshift({ text: 'Network Error: Failed to get response', sender: 'bot', danger: true, hiddenContent: null, isDetailVisible: false, id: this.idx++ });
      }
      this.isloading = false;
    }
  }

  formatDetail(res: any): { database: string, query: string; result: string } {
    return {
      database: res.Database || 'N/A',
      query: res.SQL_query || 'N/A',
      result: res.SQL_result || 'N/A'
    };
  }
  

  toggleDetail(msg: any) {
    msg.isDetailVisible = !msg.isDetailVisible;
  }
}
