CREATE TABLE Genre(
    GenreID INT NOT NULL,
    Name CHAR(100),
    PRIMARY KEY(GenreID)

);

CREATE TABLE Play (
    PlayID INT NOT NULL, 
    Name CHAR(100), 
    Duration INT, 
    Rating INT, 
    Synopsis CHAR(1000), 
    DatePremiere DATE, 
    GenreID INT,
    PRIMARY KEY(PlayID),
    FOREIGN KEY(GenreID) REFERENCES Genre

);

CREATE TABLE Auditorium(
    AuditoriumID INT NOT NULL, 
    Capacity INT NOT NULL,
    PRIMARY KEY(AuditoriumID)
    
);

CREATE TABLE Session(
    SessionID INT NOT NULL, 
    Timetable TIME, 
    Date DATE, 
    PlayID INT NOT NULL, 
    AuditoriumID INT NOT NULL,
    PRIMARY KEY(SessionID),
    FOREIGN KEY (PlayID) REFERENCES Play,
    FOREIGN KEY (AuditoriumID) REFERENCES Auditorium

);

CREATE TABLE Seat(
    SeatID INT NOT NULL, 
    Type CHAR(10), 
    Accessibility CHAR(10),  
    AuditoriumID INT NOT NULL,
    PRIMARY KEY(SeatID),
    FOREIGN KEY(AuditoriumID) REFERENCES Auditorium
);

CREATE TABLE Person (
    TaxNumber INT NOT NULL, 
    Name CHAR(100), 
    PhoneNum INT,
    PRIMARY KEY(TaxNumber)

);

CREATE TABLE Employee (
    EmployeeID INT NOT NULL, 
    TaxNumber INT NOT NULL, 
    BirthDate DATE, 
    Role CHAR(10),
    PRIMARY KEY(EmployeeID),
    FOREIGN KEY(TaxNumber) REFERENCES Person
);

CREATE TABLE Holder(
    EmployeeID INT NOT NULL, 
    ShiftID INT NOT NULL, 
    Day DATE,
    PRIMARY KEY(EmployeeID, Day),
    FOREIGN KEY(EmployeeID) REFERENCES Employee,
    FOREIGN KEY(ShiftID) REFERENCES Shift
);

CREATE TABLE Shift(ShiftID, StartTime, EndTime);

CREATE TABLE Client (ClientID, TaxNumber -> Person);

CREATE TABLE Ticket(TicketID, Price, PaymentMethod, SessionID ->Session [NN], SeatID -> Seat [NN], EmployeeID -> Employee [NN], ClientID -> Client [NN]);

CREATE TABLE Product (ProductID, Name, Price, Stock);

CREATE TABLE BarSale (BarSaleID, EmployeeID -> Employee [NN], ClientID -> Client [NN]);

CREATE TABLE SaleItem(BarSaleID->BarSale, ProductID->Product, Quantity);

