-- Find the names of all “sales representatives” who work in London.
SELECT FirstName, LastName 
FROM Employees 
WHERE CITY="London" AND Title="Sales Representative"

-- Find the name of the female "sales representative" who work in London and report to the Sales Manager Mr. Steven Buchanan. (Please do not enter any criterion under the "ReportsTo" field when answering this query.)
SELECT coalesce(e.FirstName,' ') || " " || coalesce(e.LastName,' ') AS Employee, coalesce(m.FirstName,' ') || " " || coalesce(m.LastName,' ') AS Manager
FROM Employees e
INNER JOIN Employees m ON e.ReportsTo = m.EmployeeID
WHERE e.City="London" AND e.Title="Sales Representative" AND (e.TitleOfCourtesy="Ms." OR e.TitleOfCourtesy="Mrs.")

-- Find the names and addresses of all the suppliers which can provide “tofu”. (Note: You should be able to find two companies.)
SELECT CompanyName, Address 
FROM Suppliers 
INNER JOIN Products ON Suppliers.SupplierID = Products.SupplierID AND Products.ProductName LIKE "%tofu%"

-- List the sales for orders shipped to France.
SELECT  o.OrderID, (od.Quantity * od.UnitPrice * (1-od.Discount)) AS Sales FROM Orders o 
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.ShipCountry="France"


-- Find the products on order from companies based in the UK.
SELECT p.ProductName AS ProductOnOrder, s.CompanyName AS Company FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE p.UnitsOnOrder > 0 AND s.Country = "UK"

-- List all the orders taken by the sales representative Anne Dodsworth from the companies based in London along with the unit price and quantity of each order.
SELECT coalesce(e.FirstName,' ') || " " || coalesce(e.LastName,' ') AS Employee, o.OrderID, o.OrderDate, s.CompanyName, od.UnitPrice, od.Quantity 
FROM Orders o
INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
INNER JOIN OrderDetails od ON od.OrderID = o.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE e.FirstName="Anne" AND e.LastName="Dodsworth" AND s.City="London"