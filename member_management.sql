-- Membuat database jika belum ada
CREATE DATABASE IF NOT EXISTS member_management;

-- Menggunakan database yang baru dibuat
USE member_management;

-- Tabel untuk menyimpan data pengguna (users)
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255),
    address TEXT,
    dob DATE,
    phone_number VARCHAR(20),
    email VARCHAR(255),
    grade ENUM('C', 'B', 'A') DEFAULT 'C',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabel untuk menyimpan log aktivitas
CREATE TABLE IF NOT EXISTS logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    action VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Anda bisa menambahkan data dummy atau testing jika diperlukan
-- Contoh data untuk pengguna
INSERT INTO users (username, password, name, address, dob, phone_number, email, grade)
VALUES
('user1', 'password_hashed', 'User One', 'Address 1', '1990-01-01', '08123456789', 'user1@example.com', 'C'),
('user2', 'password_hashed', 'User Two', 'Address 2', '1985-05-15', '08123456788', 'user2@example.com', 'B'),
('user3', 'password_hashed', 'User Three', 'Address 3', '1992-09-25', '08123456787', 'user3@example.com', 'A');
