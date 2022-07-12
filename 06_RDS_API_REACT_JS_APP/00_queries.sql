USE CardanoDev;
CREATE TABLE Customers (
  id int(11) NOT NULL PRIMARY KEY,
  name varchar(50) NOT NULL,
  phone varchar(50) NOT NULL,
  email varchar(50) NOT NULL
);
CREATE TABLE Orders (
  id int(11) NOT NULL PRIMARY KEY,
  customerId int(11) NOT NULL,
  orderDate datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `customerId` (`customerId`),
  CONSTRAINT `customer_orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `Customers` (`id`)
);