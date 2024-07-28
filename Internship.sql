CREATE DATABASE internship;
USE internship;

CREATE TABLE User_ (
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Graduation_Year INT,
    PID INT NOT NULL,
    PID_Type VARCHAR(10) NOT NULL,
    PRIMARY KEY (PID, PID_Type)
);

CREATE TABLE Devices (
    Device_ID INT AUTO_INCREMENT PRIMARY KEY,
    Mac_Address VARCHAR(20) NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    User_PID INT NOT NULL,
    User_PID_Type VARCHAR(10) NOT NULL,
    FOREIGN KEY (User_PID, User_PID_Type) REFERENCES user_(PID, PID_Type) ON DELETE CASCADE
);

INSERT INTO user_ (Name, Age, Graduation_Year, PID, PID_Type) VALUES ('Ahmed', 10, NULL, 100, 'NIP'),('sohayla', 20, 2026, 101, 'NIP'),('Sahar', 30, 2016, 100, 'Pass');

INSERT INTO Devices (Mac_Address, Name, Type, User_PID, User_PID_Type) VALUES ('123.456.789', 'phone', 'Samsung', 100, 'NIP'),('987.654.321', 'laptop', 'Samsung', 101, 'NIP');

SELECT * FROM user_;

SELECT * FROM Devices;

SELECT * FROM user_ WHERE PID = 101 AND name = "sohayla";

SELECT u.*, COUNT(d.Mac_Address) AS Number_of_Devices
FROM user_ u
LEFT JOIN Devices d ON u.PID = d.User_PID AND u.PID_Type = d.User_PID_Type
WHERE u.PID = 100 AND u.PID_Type = 'NIP'
GROUP BY u.PID, u.PID_Type;

DELETE FROM user_ WHERE PID = 100 AND PID_Type = 'NIP';
SELECT * FROM user_;

DELETE FROM Devices WHERE Mac_Address = '987.654.321';
SELECT * FROM Devices;

DELETE u FROM user_ u
JOIN Devices d ON u.PID = d.User_PID AND u.PID_Type = d.User_PID_Type
WHERE d.Type = 'Samsung';
