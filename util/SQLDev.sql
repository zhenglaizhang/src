create database SampleDb
go

use SampleDb
create table Customer(
	CustomerId bigint not null primary key,
	FirstName nvarchar(50) not null,
	LastName nvarchar(50) not null,
	CustomerRanking nvarchar(50) null
)

CREATE TABLE OrderHeader(
  OrderHeaderId bigint NOT NULL,
  CustomerId bigint NOT NULL,
  OrderTotal money NOT NULL
)

alter table OrderHeader add constraint FK_OrderHeader_Customer
	foreign key(CustomerId) references Customer(CustomerId)

-- Add a few customers
INSERT INTO Customer (CustomerId, FirstName, LastName, CustomerRanking) VALUES
 (1, 'Lukas', 'Keller', NULL),
 (2, 'Jeff', 'Hay', 'Good'),
 (3, 'Keith', 'Harris', 'so-so'),
 (4, 'Simon', 'Pearson', 'A+'),
 (5, 'Matt', 'Hink', 'Stellar'),
 (6, 'April', 'Reagan', '')

 -- Add a few orders
INSERT INTO OrderHeader(OrderHeaderId, CustomerId, OrderTotal) VALUES
 (1, 2, 28.50), (2, 2, 169.00),  -- Jeff's orders
 (3, 3, 12.99),  -- Keith's orders
 (4, 4, 785.75), (5, 4, 250.00),  -- Simon's orders
 (6, 5, 6100.00), (7, 5, 4250.00),  -- Matt's orders
 (8, 6, 18.50), (9, 6, 10.00), (10, 6, 18.00)  -- April's orders
GO


create view vwCustomerOrderSummary with schemabinding as 
	select 
		c.CustomerId, c.FirstName, c.LastName, c.CustomerRanking,
		isnull(sum(oh.OrderTotal), 0) as OrderTotal
	from 
		dbo.Customer as c
		left outer join dbo.OrderHeader as oh on c.CustomerId = oh.CustomerId
	group by 
		c.CustomerId, c.FirstName, c.LastName, c.CustomerRanking
go


select * from Customer
select * from vwCustomerOrderSummary