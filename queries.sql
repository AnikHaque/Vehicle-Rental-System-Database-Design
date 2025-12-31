/* ==========
   TABLES
   ========== */

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    role ENUM('Customer', 'Admin') NOT NULL
);

CREATE TABLE vehicles (
    vehicle_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('car', 'bike', 'truck') NOT NULL,
    model VARCHAR(50) NOT NULL,
    registration_number VARCHAR(50) UNIQUE NOT NULL,
    rental_price DECIMAL(10,2) NOT NULL,
    status ENUM('available', 'rented', 'maintenance') NOT NULL
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status ENUM('pending', 'confirmed', 'completed', 'cancelled') NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);


/* =================
   SAMPLE DATA
   ================= */

INSERT INTO users (user_id, name, email, phone, role) VALUES
(1, 'Alice', 'alice@example.com', '1234567890', 'Customer'),
(2, 'Bob', 'bob@example.com', '0987654321', 'Admin'),
(3, 'Charlie', 'charlie@example.com', '1122334455', 'Customer');

INSERT INTO vehicles (vehicle_id, name, type, model, registration_number, rental_price, status) VALUES
(1, 'Toyota Corolla', 'car', '2022', 'ABC-123', 50, 'available'),
(2, 'Honda Civic', 'car', '2021', 'DEF-456', 60, 'rented'),
(3, 'Yamaha R15', 'bike', '2023', 'GHI-789', 30, 'available'),
(4, 'Ford F-150', 'truck', '2020', 'JKL-012', 100, 'maintenance');

INSERT INTO bookings (booking_id, user_id, vehicle_id, start_date, end_date, status, total_cost) VALUES
(1, 1, 2, '2023-10-01', '2023-10-05', 'completed', 240),
(2, 1, 2, '2023-11-01', '2023-11-03', 'completed', 120),
(3, 3, 2, '2023-12-01', '2023-12-02', 'confirmed', 60),
(4, 1, 1, '2023-12-10', '2023-12-12', 'pending', 100);


-- Query 1: JOIN
SELECT
    b.booking_id,
    u.name AS customer_name,
    v.name AS vehicle_name,
    b.start_date,
    b.end_date,
    b.status
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN vehicles v ON b.vehicle_id = v.vehicle_id;


-- Query 2: EXISTS
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
    SELECT 1
    FROM bookings b
    WHERE b.vehicle_id = v.vehicle_id
);


-- Query 3: WHERE
SELECT *
FROM vehicles
WHERE status = 'available'
AND type = 'car';


-- Query 4: GROUP BY & HAVING
SELECT
    v.name AS vehicle_name,
    COUNT(b.booking_id) AS total_bookings
FROM bookings b
JOIN vehicles v ON b.vehicle_id = v.vehicle_id
GROUP BY v.name
HAVING COUNT(b.booking_id) > 2;
