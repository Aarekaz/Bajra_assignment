Select * FROM employee

CREATE TABLE `employee` (
  `EmployeeID` int(20) NOT NULL,
  `FirstName` varchar(250) NOT NULL,
  `MiddleName` varchar(250) DEFAULT NULL,
  `LastName` varchar(250) NOT NULL,
  `JoinDate` datetime DEFAULT NULL,
  `MonthlySalary` decimal(10,0) DEFAULT NULL,
  `DeptID` int(10) NOT NULL
)

ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`);

ALTER TABLE `employee`
  MODIFY `EmployeeID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

INSERT INTO `employee` (`EmployeeID`, `FirstName`, `MiddleName`, `LastName`, `JoinDate`, `MonthlySalary`, `DeptID`) VALUES
(1, 'Ram', NULL, 'Karki', '2022-05-17 15:39:58', '10000', 1),
(2, 'Sita Shrestha', NULL, 'Shretha', '2022-06-03 11:54:58', '15000', 2),
(3, 'Adam', NULL, 'Gurung', '2020-04-16 19:54:54', '20000', 2),
(4, 'Hari', NULL, 'Lama', '2022-06-03 16:09:54', '35000', 1);

CREATE TABLE `department` (
  `DeptID` int(20) NOT NULL,
  `DeptName` varchar(250) NOT NULL,
  `DeptCOde` varchar(50) DEFAULT NULL,
  `ParentDeptID` int(250) NOT NULL,
  `ManagerID` int(11) DEFAULT NULL,
  `Description` text DEFAULT NULL,
  `Active` tinyint(1) NOT NULL
)

ALTER TABLE `department`
  ADD PRIMARY KEY (`DeptID`);

ALTER TABLE `department`
  MODIFY `DeptID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

INSERT INTO `department` (`DeptID`, `DeptName`, `DeptCOde`, `ParentDeptID`, `ManagerID`, `Description`, `Active`) VALUES
(1, 'QA', '546', 0, 316, NULL, 1),
(2, 'DEV', '6465', 0, 687741, NULL, 1);

SELECT * FROM department

-- Write a  Single Query to find the Total Earnings by Employees grouped by Departments

SELECT FirstName,
SUM(MonthlySalary),DeptID
from employee
GROUP BY DeptID 

-- Write a Single Query to find the list of Employees belonging to Department Sales, with service length of more than 6 months.
-- let us suppose dep 2 is Sales

SELECT FirstName
FROM employee
WHERE DATEDIFF (CURDATE(), JoinDate) > 180

-- Write a Single Query to list Employees with their Department Name and their Manager Name.
SELECT FirstName,ManagerID
From employee
INNER JOIN department ON employee.DeptID = department.DeptID
