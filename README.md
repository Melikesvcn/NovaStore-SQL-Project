# NovaStore: E-Commerce Database Management System 🚀

This repository contains a comprehensive SQL database project designed for an e-commerce platform called **NovaStore**. It covers the entire lifecycle of a database project, from schema design to complex analytical reporting.

## 📌 Project Overview
As a **Junior iOS Developer**, I built this project to master the relational database logic that powers modern mobile applications. Understanding how data is structured on the backend is crucial for building robust models and handling local persistence (like SwiftData or CoreData) in iOS apps.

## 🛠 Tech Stack
- **Database Engine:** Microsoft SQL Server / Azure SQL Edge
- **Environment:** Docker Desktop (Mac)
- **Tool:** Azure Data Studio
- **Language:** T-SQL (Transact-SQL)

## 📁 Database Schema
The system consists of 5 interconnected tables:
1.  **Categories:** Product groupings.
2.  **Products:** Detailed item information (Price, Stock, etc.).
3.  **Customers:** User profiles and contact details.
4.  **Orders:** Header-level transaction data.
5.  **OrderDetails:** Line-item details for each order.

## 🔍 Key Features & Queries
The project includes advanced SQL scripts for:
- **Relational Mapping:** Established using Primary and Foreign Keys.
- **Data Integrity:** Implemented via constraints (Unique, Not Null, Identity).
- **Business Intelligence:**
    - Low stock alerts for inventory management.
    - Sales reports using multi-table **JOINs**.
    - Customer distribution analysis with **GROUP BY**.
    - Store performance summaries using **Aggregate Functions**.

## 🚀 How to Run
1. Ensure you have **Docker** and **Azure Data Studio** installed.
2. Run the SQL Server container on Docker.
3. Execute the `MelikeSevencan_NovaStore.sql` script to build the DB and populate it with sample data.

---
*Developed by **Melike Sevencan** as part of a Database Management Systems project.*
