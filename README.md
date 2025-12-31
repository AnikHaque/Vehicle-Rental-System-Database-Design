# Vehicle Rental System

## Overview
This prject contains SQL queries for a simple **Vehicle Rental System** database.
The database includes information about users, vehicles, and bookings.
The goal of this assignment is to retrieve meaningful data suing SQL concepts such as `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, and subqueries.

---

## Database Tables Used

- **Users** - stores customer information
- **Vehicles** - stores vehicle details
- **Bookings** stores booking records with linked Users and Vehicles

---

## queries.sql - Explanation of Queries
### Query 1: Booking Details with Customer and Vehicle

This query retrieves booking information along with customer name and vehicle name.
It uses `JOIN` oparations to combine `bookings`, `users`, and `vehicles` tables.

**Purpose:**
To view all the bookings with related customer and vehicle details.

---

### Query 2: Vehicles Without Any Bookings

This query retrieves all vehicles that have never been booked.
It uses a `NOT EXISTS` subquery to filter out vehicles that appear in the `bookings` table .

**Purpose:**
To identify unsed or idle vehicles.

---

### Query 3: Available Cars

This query retrieves all available vehicles of a specific type. In this case, of type `car`.
It uses `SELECT` and `WHERE`.

**Purpose:** 
To find all vehicles of a specific type that are ready for booking.

---

### Query 4: Vehicles with More Than Two Bookings

This query retrieves all the vehicles with how many times each vehicle has been booked.
It uses `GROUP BY` and `HAVING` to return only vehicles with more than two bookings.

**Purpose:**
To identify frequently booked vehicles.

---

## Conclusion
This project demonstrates the use of SQL queries to analyze and retrieve data from a realtional database.
Key SQL concepts such as joins, filtering, aggregation, and subqueries are applied here effectively.
