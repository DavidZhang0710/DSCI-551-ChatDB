import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-datacard',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './datacard.component.html',
  styleUrls: ['./datacard.component.css']
})

export class DatacardComponent {
  @Input() tableName!: string;
  @Input() tableData!: any[][];

  expanded: boolean = false;

  get columns(): string[] {
    return this.tableData.length > 0 ? this.tableData[0] : [];
  }

  get rows(): any[][] {
    return this.tableData.length > 1 ? this.tableData.slice(1) : [];
  }

  toggleExpand(): void {
    this.expanded = !this.expanded;
  }
}
