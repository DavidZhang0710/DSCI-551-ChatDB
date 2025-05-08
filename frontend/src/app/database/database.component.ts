import { Component, OnInit } from '@angular/core';
import { DatabaseService } from './database.service';
import { CommonModule } from '@angular/common';
import { DatacardComponent } from '../datacard/datacard.component';

@Component({
  selector: 'app-database',
  standalone: true,
  imports: [CommonModule, DatacardComponent],
  templateUrl: './database.component.html',
  styleUrls: ['./database.component.css']
})

export class DatabaseComponent implements OnInit {
  databases: Record<string, Record<string, any[][]>> = {};
  databaseNames: string[] = [];
  selectedDatabase: string = ''; 
  error: string | null = null;
  isloading: boolean = true;

  constructor(private databaseService: DatabaseService) {}

  ngOnInit(): void {
    this.loadDatabases();
  }

  loadDatabases(): void {
    this.isloading = true;
    this.databaseService.getDatabases().subscribe({
      next: (data) => {
        console.log(data)
        this.databases = data;
        this.databaseNames = Object.keys(data);
        this.selectedDatabase = this.databaseNames[0] || '';
        this.isloading = false;
      },
      error: (err) => {
        this.error = 'Failed to load tables';
        console.error(err);
        this.isloading = false;
      }
    });
  }
}
