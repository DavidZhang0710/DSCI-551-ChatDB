import { Component, Input, SimpleChanges } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-message',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './message.component.html',
  styleUrls: ['./message.component.css']
})
export class MessageComponent {
  @Input() message: any;

  constructor() {}

  ngOnChanges(changes: SimpleChanges): void {
    if (changes['message']) {
      console.log('Received new message:', changes['message'].currentValue);
    }
  }
}
