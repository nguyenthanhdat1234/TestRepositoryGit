USE [ArtSpectrumDB]
GO
/****** Object:  Table [dbo].[Artists]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Artists](
	[artist_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[bio] [nvarchar](max) NULL,
	[profile_picture] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[artist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cart_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[painting_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cart_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[category_id] [int] IDENTITY(1,1) NOT NULL,
	[category_name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[order_detail_id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[painting_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[price_at_order_time] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_date] [datetime] NOT NULL,
	[status] [nvarchar](10) NOT NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaintingCategories]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaintingCategories](
	[painting_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[painting_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paintings]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paintings](
	[painting_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[price] [decimal](10, 2) NOT NULL,
	[stock_quantity] [int] NOT NULL,
	[image_url] [nvarchar](255) NULL,
	[sales_price] [float] NULL,
	[sale_id] [int] NOT NULL,
	[artists_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[painting_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[payment_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_date] [datetime] NOT NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[payment_method] [nvarchar](50) NULL,
	[status] [nvarchar](20) NULL,
	[order_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[payment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[painting_id] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[review_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales](
	[sale_id] [int] IDENTITY(1,1) NOT NULL,
	[voucher_discount] [decimal](10, 2) NULL,
	[start_time_sales] [datetime] NULL,
	[end_time_sales] [datetime] NULL,
	[voucher_name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[sale_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 5/22/2024 5:33:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[full_name] [nvarchar](100) NULL,
	[address] [nvarchar](255) NULL,
	[phone_number] [nvarchar](20) NULL,
	[role] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artists]  WITH CHECK ADD  CONSTRAINT [FK_Artists_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Artists] CHECK CONSTRAINT [FK_Artists_Users]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Paintings] FOREIGN KEY([painting_id])
REFERENCES [dbo].[Paintings] ([painting_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Paintings]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([order_id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order_Details]  WITH CHECK ADD  CONSTRAINT [FK_Order_Details_Paintings] FOREIGN KEY([painting_id])
REFERENCES [dbo].[Paintings] ([painting_id])
GO
ALTER TABLE [dbo].[Order_Details] CHECK CONSTRAINT [FK_Order_Details_Paintings]
GO
ALTER TABLE [dbo].[PaintingCategories]  WITH CHECK ADD  CONSTRAINT [FK_PaintingCategories_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([category_id])
GO
ALTER TABLE [dbo].[PaintingCategories] CHECK CONSTRAINT [FK_PaintingCategories_Categories]
GO
ALTER TABLE [dbo].[PaintingCategories]  WITH CHECK ADD  CONSTRAINT [FK_PaintingCategories_Paintings] FOREIGN KEY([painting_id])
REFERENCES [dbo].[Paintings] ([painting_id])
GO
ALTER TABLE [dbo].[PaintingCategories] CHECK CONSTRAINT [FK_PaintingCategories_Paintings]
GO
ALTER TABLE [dbo].[Paintings]  WITH CHECK ADD  CONSTRAINT [FK_Paintings_Sales] FOREIGN KEY([sale_id])
REFERENCES [dbo].[Sales] ([sale_id])
GO
ALTER TABLE [dbo].[Paintings] CHECK CONSTRAINT [FK_Paintings_Sales]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Paintings] FOREIGN KEY([painting_id])
REFERENCES [dbo].[Paintings] ([painting_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Paintings]
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD  CONSTRAINT [FK_Reviews_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Reviews] CHECK CONSTRAINT [FK_Reviews_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]='canceled' OR [status]='completed' OR [status]='pending'))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD CHECK  (([status]='failed' OR [status]='completed' OR [status]='pending'))
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
