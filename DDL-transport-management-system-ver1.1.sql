-- **********************************************************************************************
CREATE DATABASE IF NOT EXISTS transport_management_system;
USE transport_management_system;
-- **********************************************************************************************
 
CREATE TABLE vehicles(
    vehicle_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    plate_no VARCHAR(255) NOT NULL,
    model VARCHAR(255) NOT NULL,
    label VARCHAR(255) NULL,
    vehicle_type VARCHAR(255) NULL,
    last_maintainance_date DATE NULL
);
CREATE TABLE drivers(
    driver_id INT NOT NULL,
    vehicle_id INT UNSIGNED NOT NULL UNIQUE,
    driver_name VARCHAR(255) NOT NULL,
    picture LONGTEXT NULL,
    cnic VARCHAR(255) NOT NULL,
    street_no VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    age INT NULL,
    date_of_birth DATE NOT NULL,
    driving_license VARCHAR(255) NOT NULL,
    PRIMARY KEY(driver_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);
CREATE TABLE contacts(
    phone_no VARCHAR(255) NOT NULL,
    driver_id INT NOT NULL,
    PRIMARY KEY(phone_no),
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);
CREATE TABLE vehicle_maintainance_log(
    vehicle_id INT UNSIGNED NOT NULL,
    maintenance_date DATE NOT NULL,
    cost DOUBLE NOT NULL,
    maintenance_description LONGTEXT NOT NULL,
    maintenance_shop VARCHAR(255) NOT NULL,
    PRIMARY KEY(vehicle_id, maintenance_date),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);
CREATE TABLE routes(
    route_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    detailed_path LONGTEXT NOT NULL
);
CREATE TABLE vehicle_schedules(
    vehicle_id INT UNSIGNED NOT NULL,
    route_id INT UNSIGNED NOT NULL,
    timing TIME NOT NULL,
    is_drop_off BOOLEAN NOT NULL,
    PRIMARY KEY (vehicle_id, timing),
	FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id),
    FOREIGN KEY (route_id) REFERENCES routes(route_id)
);
CREATE TABLE users(
    user_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
CREATE TABLE vehicle_requests(
    request_id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    vehicle_id INT UNSIGNED NULL,
    reason TEXT NOT NULL,
    vehicle_type VARCHAR(255) NOT NULL,
    avail_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);
