create database hotel;
use hotel;

CREATE TABLE Guests (
    guest_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
   
);

CREATE TABLE Rooms (
    room_number INT PRIMARY KEY,
    room_type VARCHAR(50),
    price DECIMAL(10, 2),
    is_booked BOOLEAN
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    room_number INT,
    check_in_date DATE,
    check_out_date DATE,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_number) REFERENCES Rooms(room_number)
);

CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    name VARCHAR(50),
    staff_gender ENUM('male','female'),
    position VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
   
);

CREATE TABLE Services (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(50),
    price DECIMAL(10, 2)
    
);

CREATE TABLE Room_Service (
    service_id INT,
    room_number INT,
    quantity INT,
    service_time TIME,
    FOREIGN KEY (service_id) REFERENCES Services(service_id),
    FOREIGN KEY (room_number) REFERENCES Rooms(room_number)
   
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10, 2),
    payment_type ENUM('check','cash'),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

CREATE TABLE Expenses (
    expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    amount DECIMAL(10, 2),
    expense_date DATE
   
);

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(50),
    contact_person VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
    
);

CREATE TABLE Supply_Orders (
    order_id INT PRIMARY KEY,
    supplier_id INT,
    order_date DATE,
    order_quantity INT,
    delivery_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
   
);


