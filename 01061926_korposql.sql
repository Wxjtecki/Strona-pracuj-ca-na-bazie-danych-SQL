-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql8
-- Generation Time: Wrz 28, 2024 at 12:37 PM
-- Wersja serwera: 8.0.33-25
-- Wersja PHP: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `01061926_korposql`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Clients`
--

CREATE TABLE `Clients` (
  `ClientID` int NOT NULL,
  `ClientName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ContactPerson` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PhoneNumber` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Clients`
--

INSERT INTO `Clients` (`ClientID`, `ClientName`, `ContactPerson`, `Email`, `PhoneNumber`) VALUES
(1, 'GlobalTech', 'Alice Johnson', 'alice.johnson@globaltech.com', '111-222-333'),
(2, 'NextGen Corp', 'Bob Williams', 'bob.williams@nextgencorp.com', '444-555-666'),
(3, 'Innovate Solutions', 'Charlie Davis', 'charlie.davis@innovatesolutions.com', '777-888-999');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Departments`
--

CREATE TABLE `Departments` (
  `DepartmentID` int NOT NULL,
  `DepartmentName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ManagerID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Departments`
--

INSERT INTO `Departments` (`DepartmentID`, `DepartmentName`, `ManagerID`) VALUES
(1, 'IT', 1),
(2, 'HR', 2),
(3, 'Marketing', 3);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Employees`
--

CREATE TABLE `Employees` (
  `EmployeeID` int NOT NULL,
  `FirstName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LastName` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PhoneNumber` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HireDate` date DEFAULT NULL,
  `JobTitle` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL,
  `Salary` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Employees`
--

INSERT INTO `Employees` (`EmployeeID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `HireDate`, `JobTitle`, `DepartmentID`, `Salary`) VALUES
(1, 'John', 'Doe', 'john.doe@corporation.com', '123-456-789', '2020-01-15', 'Software Engineer', 1, 60000.00),
(2, 'Jane', 'Smith', 'jane.smith@corporation.com', '987-654-321', '2019-11-03', 'Project Manager', 2, 75000.00),
(3, 'Michael', 'Brown', 'michael.brown@corporation.com', '555-123-456', '2021-05-24', 'Data Analyst', 3, 55000.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `OrderDetails`
--

CREATE TABLE `OrderDetails` (
  `OrderDetailID` int NOT NULL,
  `OrderID` int DEFAULT NULL,
  `ProductID` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `OrderDetails`
--

INSERT INTO `OrderDetails` (`OrderDetailID`, `OrderID`, `ProductID`, `Quantity`, `UnitPrice`) VALUES
(1, 1, 1, 10, 199.99),
(2, 2, 2, 5, 299.99),
(3, 3, 3, 7, 399.99);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Orders`
--

CREATE TABLE `Orders` (
  `OrderID` int NOT NULL,
  `ClientID` int DEFAULT NULL,
  `OrderDate` date DEFAULT NULL,
  `TotalAmount` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`OrderID`, `ClientID`, `OrderDate`, `TotalAmount`) VALUES
(1, 1, '2023-09-01', 25000.00),
(2, 2, '2023-08-20', 15000.00),
(3, 3, '2023-07-15', 35000.00);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Products`
--

CREATE TABLE `Products` (
  `ProductID` int NOT NULL,
  `ProductName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `StockQuantity` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Products`
--

INSERT INTO `Products` (`ProductID`, `ProductName`, `Price`, `StockQuantity`) VALUES
(1, 'Product A', 199.99, 100),
(2, 'Product B', 299.99, 200),
(3, 'Product C', 399.99, 150);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Projects`
--

CREATE TABLE `Projects` (
  `ProjectID` int NOT NULL,
  `ProjectName` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  `Budget` decimal(15,2) DEFAULT NULL,
  `DepartmentID` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Projects`
--

INSERT INTO `Projects` (`ProjectID`, `ProjectName`, `StartDate`, `EndDate`, `Budget`, `DepartmentID`) VALUES
(1, 'Website Redesign', '2023-01-10', '2023-06-30', 100000.00, 1),
(2, 'Employee Onboarding System', '2023-02-01', '2023-12-31', 50000.00, 2),
(3, 'Marketing Campaign 2023', '2023-03-15', '2023-08-30', 80000.00, 3);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Clients`
--
ALTER TABLE `Clients`
  ADD PRIMARY KEY (`ClientID`);

--
-- Indeksy dla tabeli `Departments`
--
ALTER TABLE `Departments`
  ADD PRIMARY KEY (`DepartmentID`);

--
-- Indeksy dla tabeli `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`EmployeeID`);

--
-- Indeksy dla tabeli `OrderDetails`
--
ALTER TABLE `OrderDetails`
  ADD PRIMARY KEY (`OrderDetailID`);

--
-- Indeksy dla tabeli `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indeksy dla tabeli `Products`
--
ALTER TABLE `Products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indeksy dla tabeli `Projects`
--
ALTER TABLE `Projects`
  ADD PRIMARY KEY (`ProjectID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Clients`
--
ALTER TABLE `Clients`
  MODIFY `ClientID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Departments`
--
ALTER TABLE `Departments`
  MODIFY `DepartmentID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Employees`
--
ALTER TABLE `Employees`
  MODIFY `EmployeeID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `OrderDetails`
--
ALTER TABLE `OrderDetails`
  MODIFY `OrderDetailID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Products`
--
ALTER TABLE `Products`
  MODIFY `ProductID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Projects`
--
ALTER TABLE `Projects`
  MODIFY `ProjectID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
