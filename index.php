<?php

include('db_connect.php');

function fetchData($conn, $tableName) {
    $sql = "SELECT * FROM $tableName";
    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        return $result->fetch_all(MYSQLI_ASSOC);
    } else {
        return [];
    }
}
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Strona Korporacyjna</title>
    <link rel="stylesheet" href="styles.css"> 
</head>
<body>
    <div class="container">
        <h1>Dane Korporacji</h1>

        
        <h2>Pracownicy</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Imię</th>
                    <th>Nazwisko</th>
                    <th>Email</th>
                    <th>Telefon</th>
                    <th>Data Zatrudnienia</th>
                    <th>Stanowisko</th>
                    <th>ID Działu</th>
                    <th>Wynagrodzenie</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $employees = fetchData($conn, 'Employees');
                foreach ($employees as $employee) {
                    echo "<tr>";
                    echo "<td>{$employee['EmployeeID']}</td>";
                    echo "<td>{$employee['FirstName']}</td>";
                    echo "<td>{$employee['LastName']}</td>";
                    echo "<td>{$employee['Email']}</td>";
                    echo "<td>{$employee['PhoneNumber']}</td>";
                    echo "<td>{$employee['HireDate']}</td>";
                    echo "<td>{$employee['JobTitle']}</td>";
                    echo "<td>{$employee['DepartmentID']}</td>";
                    echo "<td>{$employee['Salary']}</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>

        
        <h2>Działy</h2>
        <table>
            <thead>
                <tr>
                    <th>ID Działu</th>
                    <th>Nazwa Działu</th>
                    <th>ID Menedżera</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $departments = fetchData($conn, 'Departments');
                foreach ($departments as $department) {
                    echo "<tr>";
                    echo "<td>{$department['DepartmentID']}</td>";
                    echo "<td>{$department['DepartmentName']}</td>";
                    echo "<td>{$department['ManagerID']}</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>

        
        <h2>Projekty</h2>
        <table>
            <thead>
                <tr>
                    <th>ID Projektu</th>
                    <th>Nazwa Projektu</th>
                    <th>Data Rozpoczęcia</th>
                    <th>Data Zakończenia</th>
                    <th>Budżet</th>
                    <th>ID Działu</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $projects = fetchData($conn, 'Projects');
                foreach ($projects as $project) {
                    echo "<tr>";
                    echo "<td>{$project['ProjectID']}</td>";
                    echo "<td>{$project['ProjectName']}</td>";
                    echo "<td>{$project['StartDate']}</td>";
                    echo "<td>{$project['EndDate']}</td>";
                    echo "<td>{$project['Budget']}</td>";
                    echo "<td>{$project['DepartmentID']}</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>

        
        <h2>Klienci</h2>
        <table>
            <thead>
                <tr>
                    <th>ID Klienta</th>
                    <th>Nazwa Klienta</th>
                    <th>Osoba Kontaktowa</th>
                    <th>Email</th>
                    <th>Telefon</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $clients = fetchData($conn, 'Clients');
                foreach ($clients as $client) {
                    echo "<tr>";
                    echo "<td>{$client['ClientID']}</td>";
                    echo "<td>{$client['ClientName']}</td>";
                    echo "<td>{$client['ContactPerson']}</td>";
                    echo "<td>{$client['Email']}</td>";
                    echo "<td>{$client['PhoneNumber']}</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>

        
        <h2>Zamówienia</h2>
        <table>
            <thead>
                <tr>
                    <th>ID Zamówienia</th>
                    <th>ID Klienta</th>
                    <th>Data Zamówienia</th>
                    <th>Łączna Kwota</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $orders = fetchData($conn, 'Orders');
                foreach ($orders as $order) {
                    echo "<tr>";
                    echo "<td>{$order['OrderID']}</td>";
                    echo "<td>{$order['ClientID']}</td>";
                    echo "<td>{$order['OrderDate']}</td>";
                    echo "<td>{$order['TotalAmount']}</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>

        
        <h2>Produkty</h2>
        <table>
            <thead>
                <tr>
                    <th>ID Produktu</th>
                    <th>Nazwa Produktu</th>
                    <th>Cena</th>
                    <th>Stan Magazynowy</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $products = fetchData($conn, 'Products');
                foreach ($products as $product) {
                    echo "<tr>";
                    echo "<td>{$product['ProductID']}</td>";
                    echo "<td>{$product['ProductName']}</td>";
                    echo "<td>{$product['Price']}</td>";
                    echo "<td>{$product['StockQuantity']}</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>

        
        <h2>Szczegóły Zamówień</h2>
        <table>
            <thead>
                <tr>
                    <th>ID Szczegółu Zamówienia</th>
                    <th>ID Zamówienia</th>
                    <th>ID Produktu</th>
                    <th>Ilość</th>
                    <th>Cena Jednostkowa</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $orderDetails = fetchData($conn, 'OrderDetails');
                foreach ($orderDetails as $orderDetail) {
                    echo "<tr>";
                    echo "<td>{$orderDetail['OrderDetailID']}</td>";
                    echo "<td>{$orderDetail['OrderID']}</td>";
                    echo "<td>{$orderDetail['ProductID']}</td>";
                    echo "<td>{$orderDetail['Quantity']}</td>";
                    echo "<td>{$orderDetail['UnitPrice']}</td>";
                    echo "</tr>";
                }
                ?>
            </tbody>
        </table>
    </div>
</body>
</html>
