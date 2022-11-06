
CREATE DATABASE ShoppingCartDB
GO

USE ShoppingCartDB
GO

/*UserId will be auto incremented (IDENTITY keyword) when a user record is inserted. 
Please insert only username and password to this table*/
CREATE TABLE [dbo].[Users] (
	[UserId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[Username] VARCHAR (100) NOT NULL,
	[Password] VARCHAR (100) NOT NULL,
);

CREATE TABLE [dbo].[Sessions] (
	[SessionId] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[UserId] INT FOREIGN KEY REFERENCES Users(UserId)
)

/*ProductId will be auto incremented (IDENTITY keyword) when a product record is inserted. 
Please insert only name, desc, imgurl, price to this table*/
CREATE TABLE [dbo].[Products] (
	[ProductId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[ProductName] VARCHAR (100) NOT NULL,
	[ProductDesc] VARCHAR (300) NOT NULL,
	[ProductImg] VARCHAR (100) NOT NULL,
	[ProductPrice] DEC (6, 2) NOT NULL
);


/*OrderId will be auto incremented (IDENTITY keyword) when a product record is inserted. 
Please insert only userid, timestamp to this table*/
CREATE TABLE [dbo].[Orders] (
	[OrderId] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	[UserId] INT NOT NULL FOREIGN KEY REFERENCES Users(UserId),
	[Timestamp] DATE NOT NULL
);

CREATE TABLE [dbo].[OrderDetails] (
	[OrderId] INT NOT NULL FOREIGN KEY REFERENCES Orders(OrderId),
	[ProductId] INT NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
	[Quantity] INT NOT NULL,
	CONSTRAINT PK_OrderDetail PRIMARY KEY (OrderId, ProductId)
);

CREATE TABLE [dbo].[ActivationCodeDetails] (
	[ActivationCode] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[ProductId] INT NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
	[OrderId] INT NULL FOREIGN KEY REFERENCES Orders(OrderId)
);

CREATE TABLE [dbo].[Reviews] (
	[UserId] INT NOT NULL FOREIGN KEY REFERENCES Users(UserId),
	[ProductId] INT NOT NULL FOREIGN KEY REFERENCES Products(ProductId),
	[Rating] INT NOT NULL,
	CONSTRAINT PK_Review PRIMARY KEY (UserId, ProductId)
);


INSERT INTO dbo.[Users] VALUES
    (N'travis',N'travis'),
	(N'ivan',N'ivan'),
	(N'oscar',N'oscar'),
    (N'lynn',N'lynn'),
    (N'lexi',N'lexi'),
    (N'chilei',N'chilei')


INSERT INTO [dbo].[Products]
VALUES 
('.NET Charts', 'Brings powerful charting capabilities to your .NET applications.','charts.png', 99.00),
('.NET PayPal', 'Integrate your .NET apps with PayPal the easy way!', 'paypal.png', 69.00),
('.NET ML', 'Supercharged .NET machine learning libraries.', 'ml.png', 299.00),
('.NET Analytics', 'Performs data mining and analytics easily in .NET.', 'analytics.png',299.00),
('.NET Logger', 'Logs and aggregates events easily in your .NET apps.', 'logger.png', 49.00),
('.NET Numerics', 'Powerful numerical methods for your .NET simulations.', 'numerics.png', 199.00);