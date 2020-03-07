/*
This file holds all the data definition querries for holding all the data in the database. 
*/

USE [food4me_db]
GO

CREATE TABLE [dbo].[Users](
	[id] [int] NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password_hash] [varchar](255) NOT NULL,
	[first_name] [varchar](255) NOT NULL,
	[last_name] [varchar](255) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY ([id]) )
GO
 
CREATE TABLE [dbo].[Suppliers](
	[id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[address] [varchar](255) NOT NULL,
	[zip] [nchar](10) NOT NULL,
	[phone] [nchar](10) NULL,
	[email] [varchar](255) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY ([id]) )
GO

CREATE TABLE [dbo].[Suppliers_Users](
	[user_id] [int] NOT NULL,
	[supplier_id] [int] NOT NULL,
 CONSTRAINT [PK_Suppliers_Users] PRIMARY KEY ([user_id],[supplier_id]),
 CONSTRAINT [FK_Suppliers_Users_Users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]),
 CONSTRAINT [FK_Suppliers_Users_Suppliers] FOREIGN KEY ([supplier_id]) REFERENCES [dbo].[Suppliers] ([id])
)
GO

CREATE TABLE [dbo].[Offerings](
	[id] [int] NOT NULL,
	[supplier_id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[description] [text] NULL,
	[created_datetime] [datetime] NOT NULL,
	[start_datetime] [datetime] NOT NULL,
	[end_datetime] [datetime] NULL,
	[cancelled_datetime] [datetime] NULL,
	[created_by] [int] NOT NULL,
	[note] [text] NULL,
 CONSTRAINT [PK_Offerings] PRIMARY KEY ([id]),
 CONSTRAINT [FK_Offerings_Suppliers] FOREIGN KEY([supplier_id]) REFERENCES [dbo].[Suppliers] ([id]),
 CONSTRAINT [FK_Offerings_Users] FOREIGN KEY([created_by]) REFERENCES [dbo].[Users] ([id])
)
GO

CREATE TABLE [dbo].[Ratings](
	[user_id] [int] NOT NULL,
	[supplier_id] [int] NOT NULL,
	[rating] [int] NOT NULL,
 CONSTRAINT [PK_Ratings] PRIMARY KEY ([user_id],[supplier_id]),
 CONSTRAINT [FK_Ratings_Users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[Users] ([id]),
 CONSTRAINT [FK_Ratings_Suppliers] FOREIGN KEY ([supplier_id]) REFERENCES [dbo].[Suppliers] ([id])
)
GO