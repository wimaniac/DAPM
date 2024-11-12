-- DROP DATABASE FINAL

USE [master]
GO
CREATE DATABASE [FINAL]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FINAL', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FINAL.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FINAL_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FINAL_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FINAL] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FINAL].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FINAL] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FINAL] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FINAL] SET ARITHABORT OFF 
GO
ALTER DATABASE [FINAL] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FINAL] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FINAL] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FINAL] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FINAL] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FINAL] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FINAL] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FINAL] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FINAL] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FINAL] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FINAL] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FINAL] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FINAL] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FINAL] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FINAL] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FINAL] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FINAL] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FINAL] SET RECOVERY FULL 
GO
ALTER DATABASE [FINAL] SET  MULTI_USER 
GO
ALTER DATABASE [FINAL] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FINAL] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FINAL] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FINAL] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FINAL] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FINAL] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FINAL', N'ON'
GO
ALTER DATABASE [FINAL] SET QUERY_STORE = ON
GO
ALTER DATABASE [FINAL] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FINAL]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORY](
	[id] [uniqueidentifier] NOT NULL,
	[slug] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[createAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETAILORDERS](
	[id] [uniqueidentifier] NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [decimal](38, 2) NOT NULL,
	[idOrder] [uniqueidentifier] NULL,
	[idProduct] [uniqueidentifier] NULL,
	[createAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER](
	[id] [uniqueidentifier] NOT NULL,
	[status] [int] NULL,
	[total] [decimal](38, 2) NULL,
	[createAt] [datetime] NOT NULL,
	[idUser] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCT](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[detail] [nvarchar](255) NULL,
	[quantity] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[type] [nvarchar](255) NULL,
	[createAt] [datetime] NULL,
	[idUser] [uniqueidentifier] NULL,
	[pathImg] [nvarchar](max) NULL,
	[idCategory] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROLE](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](20) NULL,
	[createAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USER](
	[id] [uniqueidentifier] NOT NULL,
	[email] [nvarchar](40) NOT NULL,
	[name] [nvarchar](40) NULL,
	[password] [nvarchar](max) NOT NULL,
	[address] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[pathImg] [nvarchar](max) NULL,
	[idRole] [uniqueidentifier] NULL,
	[createAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[CATEGORY] ([id], [slug], [name], [createAt]) VALUES (N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01', N'duoc-pham', N'Dược phẩm', CAST(N'2023-06-24T13:30:45.687' AS DateTime))
INSERT [dbo].[CATEGORY] ([id], [slug], [name], [createAt]) VALUES (N'5007207d-ed82-4f50-af26-b42635230538', N'cham-soc-suc-khoe', N'Chăm sóc sức khỏe', CAST(N'2023-06-24T13:30:45.687' AS DateTime))
INSERT [dbo].[CATEGORY] ([id], [slug], [name], [createAt]) VALUES (N'be314ffd-208e-4bdb-915d-b74358abdfe8', N'cham-soc-sac-dep', N'Chăm sóc sắc đẹp', CAST(N'2023-06-24T13:30:45.687' AS DateTime))
INSERT [dbo].[CATEGORY] ([id], [slug], [name], [createAt]) VALUES (N'598ca132-60e0-414a-be8c-ce5f84fa8665', N'thuc-pham-chuc-nang', N'Thực phẩm chức năng', CAST(N'2023-06-24T13:30:45.687' AS DateTime))
GO
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'84d5a44a-83b0-43d7-8859-0f67814ab116', 1, CAST(662000.00 AS Decimal(38, 2)), N'c0e12d75-6196-4415-94c0-cb3b88fee1c5', N'0bd1ac01-cf6f-4b4a-8fa5-537e0ff1ff3e', CAST(N'2023-08-10T23:12:12.897' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'cc3b7db6-0ac4-4f6f-a14e-16f9fe404e02', 1, CAST(405000.00 AS Decimal(38, 2)), N'20a2981e-a533-4c29-a56d-10b20cc9aebe', N'd4eb3b2e-2e99-4b17-ab4f-033a0024c769', CAST(N'2023-08-13T11:32:15.983' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'b60b00e9-609d-44a2-bb25-278bf2b7a3cd', 3, CAST(175000.00 AS Decimal(38, 2)), N'ade5e9ef-2c48-41c7-9fb7-311f4c43e811', N'6c295d42-5036-456b-b67e-66ad2e287fb9', CAST(N'2023-06-24T13:32:46.463' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'bcfa4215-0db7-4a51-913e-35b0d54db156', 1, CAST(175000.00 AS Decimal(38, 2)), N'3a484e2e-4867-4504-b71f-d36059124933', N'6c295d42-5036-456b-b67e-66ad2e287fb9', CAST(N'2023-08-10T23:04:37.197' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'34a29a6f-3d41-47db-8136-38a7a0a332b5', 1, CAST(175000.00 AS Decimal(38, 2)), N'4c23940a-4452-4e1d-8eb6-cdc8e436c0af', N'6c295d42-5036-456b-b67e-66ad2e287fb9', CAST(N'2023-08-10T23:11:38.760' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'1ae314de-e33d-454d-ad7c-483f4526d024', 1, CAST(175000.00 AS Decimal(38, 2)), N'ab02293b-965b-44a9-a651-bcb53f28712a', N'6c295d42-5036-456b-b67e-66ad2e287fb9', CAST(N'2023-08-10T22:55:48.397' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'c5670d13-0599-4312-a47b-51eb356681ed', 0, CAST(0.00 AS Decimal(38, 2)), N'ab02293b-965b-44a9-a651-bcb53f28712a', NULL, CAST(N'2023-08-10T22:09:45.707' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'2633efc3-47ea-4110-b329-5ce971abbe17', 1, CAST(405000.00 AS Decimal(38, 2)), N'20a2981e-a533-4c29-a56d-10b20cc9aebe', N'c89a7738-3702-4f16-8132-0314eccc54f8', CAST(N'2023-08-13T11:32:18.383' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'b99a0e4c-d267-4e26-9ff1-846af629c496', 0, CAST(0.00 AS Decimal(38, 2)), N'041a9ff9-4dee-4df2-a8c7-35d65795e3f0', NULL, CAST(N'2023-08-10T23:17:17.703' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'887ad31a-8c30-4c23-a1b3-904701aae776', 1, CAST(120000.00 AS Decimal(38, 2)), N'c0e12d75-6196-4415-94c0-cb3b88fee1c5', N'b01ffe4c-e2ae-4e8e-baaa-aacfe7228a24', CAST(N'2023-08-10T23:12:14.567' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'1b9f5932-d23f-44f2-860f-b481352801ae', 1, CAST(175000.00 AS Decimal(38, 2)), N'd743c4ee-3ba4-4bb2-a4fb-7fec458a7208', N'6c295d42-5036-456b-b67e-66ad2e287fb9', CAST(N'2023-08-13T11:22:41.043' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'398a9013-c763-437e-bc26-c4d454c0be86', 1, CAST(405000.00 AS Decimal(38, 2)), N'4c23940a-4452-4e1d-8eb6-cdc8e436c0af', N'd4eb3b2e-2e99-4b17-ab4f-033a0024c769', CAST(N'2023-08-10T23:11:35.537' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'c2465014-b577-4a14-aa6d-d28099ba97d5', 3, CAST(405000.00 AS Decimal(38, 2)), N'ade5e9ef-2c48-41c7-9fb7-311f4c43e811', N'c89a7738-3702-4f16-8132-0314eccc54f8', CAST(N'2023-06-24T13:32:54.390' AS DateTime))
INSERT [dbo].[DETAILORDERS] ([id], [quantity], [price], [idOrder], [idProduct], [createAt]) VALUES (N'6e090810-8517-4554-85c9-eb491044dbc5', 1, CAST(396000.00 AS Decimal(38, 2)), N'c0e12d75-6196-4415-94c0-cb3b88fee1c5', N'72f5fb5a-f096-4496-a4d5-ed064748b0a6', CAST(N'2023-08-10T23:12:20.933' AS DateTime))
GO
INSERT [dbo].[ORDER] ([id], [status], [total], [createAt], [idUser]) VALUES (N'20a2981e-a533-4c29-a56d-10b20cc9aebe', 1, CAST(810000.00 AS Decimal(38, 2)), CAST(N'2024-08-13T11:32:24.317' AS DateTime), N'4218ade4-d4e6-425e-b937-dd7a5f7695fe')
INSERT [dbo].[ORDER] ([id], [status], [total], [createAt], [idUser]) VALUES (N'ade5e9ef-2c48-41c7-9fb7-311f4c43e811', 2, CAST(1770000.00 AS Decimal(38, 2)), CAST(N'2024-06-24T13:34:03.653' AS DateTime), N'7efb44ec-2891-4342-8856-e2801a296099')
INSERT [dbo].[ORDER] ([id], [status], [total], [createAt], [idUser]) VALUES (N'041a9ff9-4dee-4df2-a8c7-35d65795e3f0', 1, CAST(30000.00 AS Decimal(38, 2)), CAST(N'2024-08-13T11:22:53.620' AS DateTime), N'32fa5441-9c59-4518-bf11-5d9bb0dab94f')
INSERT [dbo].[ORDER] ([id], [status], [total], [createAt], [idUser]) VALUES (N'd743c4ee-3ba4-4bb2-a4fb-7fec458a7208', 1, CAST(205000.00 AS Decimal(38, 2)), CAST(N'2024-08-13T11:29:55.843' AS DateTime), N'4218ade4-d4e6-425e-b937-dd7a5f7695fe')
INSERT [dbo].[ORDER] ([id], [status], [total], [createAt], [idUser]) VALUES (N'ab02293b-965b-44a9-a651-bcb53f28712a', 1, CAST(205000.00 AS Decimal(38, 2)), CAST(N'2024-08-10T23:04:21.070' AS DateTime), N'32fa5441-9c59-4518-bf11-5d9bb0dab94f')
INSERT [dbo].[ORDER] ([id], [status], [total], [createAt], [idUser]) VALUES (N'c0e12d75-6196-4415-94c0-cb3b88fee1c5', 1, CAST(1208000.00 AS Decimal(38, 2)), CAST(N'2024-08-10T23:12:30.647' AS DateTime), N'32fa5441-9c59-4518-bf11-5d9bb0dab94f')
INSERT [dbo].[ORDER] ([id], [status], [total], [createAt], [idUser]) VALUES (N'4c23940a-4452-4e1d-8eb6-cdc8e436c0af', 1, CAST(610000.00 AS Decimal(38, 2)), CAST(N'2024-08-10T23:11:49.247' AS DateTime), N'32fa5441-9c59-4518-bf11-5d9bb0dab94f')
INSERT [dbo].[ORDER] ([id], [status], [total], [createAt], [idUser]) VALUES (N'3a484e2e-4867-4504-b71f-d36059124933', 1, CAST(205000.00 AS Decimal(38, 2)), CAST(N'2024-08-10T23:04:43.600' AS DateTime), N'32fa5441-9c59-4518-bf11-5d9bb0dab94f')
GO
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'a9b094fa-a6ab-439b-be4c-02952c1e512e', N' Nước tẩy trang chiết xuất từ hoa hồng hữu cơ Calliderm Miscellaire 3In1 (Chai 250ml)', N'', 185, CAST(179000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:46.547' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23700_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'335c1ecc-844c-40bd-b1ae-02987530c878', N'Bông y tế thấm nước Bạch Tuyết (100g)', N'Sản phẩm được sản xuất từ 100% bông xơ tự nhiên, không lẫn tạp chất và không pha poly. Công nghệ châu Âu giúp bông mịn, chắc. Công nghệ tiệt trùng E.O.Gas đối với những sản phẩm dùng trong phẫu thuật.', 301, CAST(22000 AS Decimal(18, 0)), N'Gói', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P01255_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'c89a7738-3702-4f16-8132-0314eccc54f8', N'Thực phẩm bảo vệ sức khỏe phòng ngừa biến chứng tiểu đường Boni Diabet (60 viên/hộp)', N'', 263, CAST(405000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.323' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P24936_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'd4eb3b2e-2e99-4b17-ab4f-033a0024c769', N'Thực phẩm bảo vệ sức khỏe Boni Sleep cải thiện giấc ngủ (Chai 30 viên)', N'', 301, CAST(405000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:48.353' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P11592_1_l-thumbnail-255x255.webp', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'4fc8450b-4a73-46c9-878f-0bdfa692c744', N'Salonsip Gel-Patch (2 miếng x 10 gói/hộp)', N'Hoạt tính: Glycol salicylate 1.25g; I-Menthol 1.00g; dl-Camphor 0.30g; Tocopherol acetate 1.00g…Công dụng: Giúp giảm đau, kháng viêm,…Đối tượng sử dụng: Người lớn và trẻ emHình thức: Miếng dánThương hiệu: Hisamitsu (Nhật Bản)', 301, CAST(190000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.677' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00345_1-thumbnail-255x255-70.jpg', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'2835315c-18db-4549-b111-0bf2c738e57f', N'Hỗ trợ não ABIPHA Ginkgo 360 Natto Q10 (Hộp 10 vỉ x 10 viên)', N'', 137, CAST(89000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.633' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25864_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'a7d3568e-43e1-4685-b4f3-0fe8400ffee5', N' Mặt nạ Banobagi Vita Genic Jelly Mask Whitening & Melasma (30ml)', N'', 301, CAST(25000 AS Decimal(18, 0)), N'Miếng', CAST(N'2023-06-24T13:30:46.603' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23435_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'5bbf34e6-bea8-4b3a-b322-15da04449762', N'Băng cá nhân ít thấm nước Urgo Washproof Large (30 miếng/hộp)', N'Băng cá nhân ít thấm nước Urgo Washproof Large gồm 30 miếng bản lớn, giúp bảo vệ các vết thương nhỏ, vết trầy xước, rách da. Thiết kế nhỏ gọn, tiện lợi khi sử dụng và có thể mang theo mọi nơi.', 301, CAST(52000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00529_36-thumbnail-255x255.png', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'b7e8aea8-af27-466c-ab2e-1813d776ed91', N'Băng dán cá nhân Pharmacity không thấm nước (10 miếng/gói)', N'Băng dán cá nhân Pharmacity không thấm nước giúp bảo vệ vết thương ngoài da. Với khả năng chống thấm nước và có độ dính cao, băng cá nhân Pharmacity giúp bảo vệ các vết trầy xước, vết thương hiệu quả.', 301, CAST(18000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.770' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P09771_4-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'249681b0-712b-4908-9227-1aba376f4f51', N'Thực phẩm chức năng làm đẹp da Acnacare (3 vỉ x 10 viên/hộp)', N'Thực phẩm chức năng Acnacare là bổ sung các chất chống Oxy hóa, giúp ngăn ngừa, hỗ trợ điều trị mụn và viêm các tuyến bã nhờn trên da.', 301, CAST(130000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.680' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P01045_1_l-thumbnail-255x255.webp', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'32684a77-77d4-41f5-9273-1caecb20b57a', N'Băng cá nhân màu da Pharmacity (100 cái/hộp)', N'Băng cá nhân màu da với thành phần từ vải không dệt, băng keo thông thoáng, độ dính cao, ít thấm nước, giúp bảo vệ các vết thương nhỏ, vết cắt, trầy, xước.', 301, CAST(60000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P10341_1_l-thumbnail-255x255.webp', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'45c28603-7d9e-409c-ad94-1ff4ce0b96fd', N'Thực phẩm hỗ trợ giảm thoái hóa khớp An Huy Nakomin Extra (Hộp 60 viên)', N'', 158, CAST(269000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.037' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25534_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'35319f09-e2e4-4047-a485-211ff8e0cdbf', N'Sữa chống nắng Cancer Council Face Day Wear Fluid Matte SPF50+ (Chai 50ml)', N'', 301, CAST(495000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:46.607' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25519_5-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'b62bb65f-3514-4fea-bbd8-23c9974ba372', N'Tiger Balm Red 19.4g (Hộp 1 lọ)', N'Tiger Balm Redvới hỗn chất từ tự nhiên giúp giảm các chứng đau đầu, ngạt mũi, đau do côn trùng cắn, ngứa, đau nhức cơ, bong gân và đầy hơi.', 301, CAST(40000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.680' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P01292_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'12341ea4-d72a-4027-9e69-28b9663c7e86', N'Xịt mũi họng Khiết Thanh Á Âu (30ml)', N'', 301, CAST(115000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:47.680' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P22919_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'cf306e0b-6f8a-4fb7-87d3-312485053f0b', N'Băng cá nhân trong suốt Urgo Transparent (Hộp 100 miếng)', N'Băng cá nhân Urgo Transparent được làm từ chất liệu vải co giãn tốt, gạc mềm phủ lưới Polyethylene không gây dính hoặc đau khi gỡ băng, giúp bảo vệ hoàn hảo các vết thương nhỏ, vết trầy xước, rách da.', 301, CAST(75000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00045_36-thumbnail-255x255.png', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'db3542e6-0c84-47d1-8ef9-32f132810546', N'Xịt hỗ trợ ngăn ngừa viêm xoang Bảo Tín Xoang (Chai 15ml)', N'', 301, CAST(150000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:47.820' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P24163_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'87bed8fa-a900-484b-80be-3781b7b9bfd7', N'Băng cá nhân vải độ dính cao Urgo Durable (102 miếng/hộp)', N'Băng cá nhân vải độ dính cao Urgo Durable giúp bảo vệ các vết thương nhỏ, vết trầy xước, rách da. Độ dính cao, co giãn tốt. Thiết kế nhỏ gọn, tiện lợi khi sử dụng và có thể mang theo mọi nơi.', 301, CAST(75000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.767' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00524_1_l-thumbnail-255x255.webp', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'2c645314-4fed-439b-8847-39b657df9770', N'Băng dán cá nhân Pharmacity trong suốt (10 miếng/gói)', N'Băng dán cá nhân Pharmacity trong suốt giúp bảo vệ vết thương ngoài da. Với khả năng chống thấm nước và có độ dính cao, băng cá nhân Pharmacity giúp bảo vệ các vết trầy xước, vết thương hiệu quả.', 301, CAST(10000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.773' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P09770_4-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'6d0b17ba-abea-4d11-b1e0-3aa5ab887969', N'Băng cá nhân trong suốt Ace Band-S (10 miếng/hộp)', N'Băng cá nhân trong suốt Ace Band-S có chất kết dính không gây dị ứng, an toàn sử dụng cho da nhạy cảm. Chất liệu mềm mại, ít thấm nước, độ bám dính cao giúp băng dán được lâu hơn.', 301, CAST(11000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P06154_1_l-thumbnail-255x255.webp', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'912cc7e3-23c7-4a50-b01d-3c6107c4bb8c', N'Serum giúp làm sáng da Balance Active Formula Niacinamide Blemish Recovery Serum (30ml)', N'Serum Balance Active Formula Niacinamide 15% Blemish Recovery Ngừa Mụn Mờ Thâm 30ml chứa 15% Niacinamide giúp giảm nhược điểm trên làn da, mụn đỏ và cải thiện sắc tố của da.', 301, CAST(190000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.560' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P22097_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'9ebe4843-5249-4f47-a151-4033e14372d6', N' Miếng dán giảm đau xương khớp Bách Linh Diệu 10 miếng/hộp', N'', 301, CAST(88000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.650' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P22985_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'b5c8ba7b-9293-415b-8725-412e3062dba4', N'Thực phẩm hỗ trợ giảm ho An Huy Promax New Siro (Chai 100ml)', N'', 301, CAST(65000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.110' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25475_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'ccc08f45-7364-469d-a621-421520387459', N'Bổ sung Vitamin và khoáng chất ABIPHA Pharciton (Hộp 6 vỉ x 10 viên)', N'', 139, CAST(46000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.683' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25853_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'299e98c5-00b1-4e13-9b32-47e33221e751', N'Calcium VPC 500 (Hộp 1 tuýp 20 viên sủi)', N'Hoạt chất: Calci 500mgCông dụng: Điều trị hạ calci huyết và các trường hợp khácĐối tượng sử dụng: Người lớn và trẻ em từ 6 tuổi trở lênHình thức: Viên nén sủi bọtThương hiệu: Pharimexco (Việt Nam)Nhà sản xuất: Công ty Cố phần Dược phẩm Cửu Long (Việt Nam)', 301, CAST(55000 AS Decimal(18, 0)), N'Tuýp', CAST(N'2023-06-24T13:30:47.673' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P17609_1-thumbnail-255x255-70.jpg', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'8d52d765-61b6-43ed-8131-4a6ee640ecf7', N'Thực phẩm hỗ trợ giải độc gan An Huy Onepharm Livermaxs (Hộp 30 viên)', N'', 276, CAST(169000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.093' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25476_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'26591d68-7fac-4657-b009-4cfb8e293928', N'Băng cá nhân vải độ dính cao Urgo Durable (20 miếng/hộp)', N'Băng cá nhân vải độ dính cao Urgo Durable với băng keo lụa nền đan dệt, ít gây kích ứng, keo có độ dính lâu dài, dính chắc trong tất cả các trường hợp. Dùng để cố định các miếng băng nhỏ và các thiết bị y tế.', 301, CAST(25000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.767' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P05517_36-thumbnail-255x255.png', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'6e5a6d16-1a84-4c92-b801-4d947ddac549', N'Nước mắt nhân tạo - Acuaiss Eye Drop Bottle 15ml', N'', 301, CAST(159000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.650' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P19413_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'9793a16d-a250-41b0-8cd9-4dd1b5bc2bdb', N'Acuaiss Eye Drop monodoses (Hộp 20 ống)', N'', 301, CAST(219000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.650' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P18720_1_l-thumbnail-255x255.webp', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'6573b9c1-cb87-412e-8ba4-4f31f3b282b6', N'Băng cá nhân Urgo Miraculous (14 miếng/hộp)', N'', 301, CAST(42000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P24382_36-thumbnail-255x255.png', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'0bd1ac01-cf6f-4b4a-8fa5-537e0ff1ff3e', N'Thực phẩm bảo vệ sức khỏe Blackmores Omega Double High Strength Fish Oil (Chai 90 viên)', N'', 301, CAST(662000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.323' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P24634_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'402ac411-0b63-4c82-93a5-53de3153e872', N'Băng cuộn y tế Đông Pha 3 Con Nai (Hộp 50 cuộn)', N'Băng cuộn y tế Đông Pha 3 Con Nai được sử dụng trong các trường hợp băng bó vết thương, an toàn cho người sử dụng.', 301, CAST(75000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.767' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P17383_1_l-thumbnail-255x255.webp', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'b8b6a18c-b063-4b1d-9544-5c02cd463436', N'Sữa bột dinh dưỡng cho người đái tháo đường hương Vani Abbott Glucerna (850g)', N'Glucerna mới với công thức tiên tiến và hệ dưỡng chất đặc chế Triple Care đã được chứng minh lâm sàng giúp kiểm soát tốt đường huyết. Hệ bột đường tiên tiến, với chỉ số đường huyết thấp và được tiêu hóa từ từ giúp bình ổn đường huyết.', 301, CAST(880000 AS Decimal(18, 0)), N'Lon', CAST(N'2023-06-24T13:30:46.647' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P07244_1_l-thumbnail-255x255.webp', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'd632180b-8f76-4df1-adf2-5cd024cdaaea', N'Nước uống giải độc gan Biok Hovenia Dulcis Gold (Hộp 5 gói x 100ml)', N'', 176, CAST(88000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.323' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23692_1_l-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'7bb3297c-8f5e-465e-b6dd-6258196b7dc2', N'Axe Brand Inhaler (1.7g)', N'Ống hít mũi giúp giảm nhanh các chứng nghẹt mũi, sổ mũi do cảm cúm gây ra, giúp thông mũi và dễ thở hơn.', 301, CAST(93000 AS Decimal(18, 0)), N'Lốc', CAST(N'2023-06-24T13:30:46.787' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P01219_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'ae8b66e7-3276-4ea3-97eb-628d1304b4f4', N'Mặt nạ Banobagi Vita Genic Jelly Mask Whitening & Acne (30ml)', N'', 301, CAST(25000 AS Decimal(18, 0)), N'Miếng', CAST(N'2023-06-24T13:30:46.647' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23437_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'7b848605-5c63-4eb3-82f2-6349b2d8eea4', N'Sữa bột hương vani Anlene Gold Total 10 (Hộp 800g)', N'', 301, CAST(649000 AS Decimal(18, 0)), N'Lon', CAST(N'2023-06-24T13:30:46.767' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25949_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'd837d018-65d5-42aa-928a-666fe3638cd8', N'Gel rửa mặt Acnes 25+ Facial Wash (Tuýp 100g)', N'Acnes 25+ Gel Rửa Mặt Ngừa Mụn Acnes với các thành phần đặc trưng như: Salicylic Acid, Vitamin C, hạt Jojoba...giúp làm sạch da nhẹ nhàng, hỗ trợ ngăn ngừa mụn xuất hiện và có độ PH dưỡng ẩm cho da hợp lý.', 50, CAST(82000 AS Decimal(18, 0)), N'Tuýp', CAST(N'2023-06-24T13:30:46.547' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P20520_1_l-thumbnail-255x255.webp', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'6c295d42-5036-456b-b67e-66ad2e287fb9', N'Sữa rửa mặt Acne-Aid Liquid Cleanser (Chai 100ml)', N'Sữa rửa mặt Acne-Aid Liquid Cleanser được làm từ các thành phần như Aqua, Sodium Lauroyl Sarcosinate, Myristic Acid... với độ pH cân bằng giúp làm sạch da dịu nhẹ, giúp loại bỏ dầu và nhờn trên da.', 301, CAST(175000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:48.350' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P22986_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'0d201cc0-3de2-4a43-a2a3-68810275fce7', N'Mặt nạ Banobagi Vita Genic Jelly Mask Whitening & Repair (30ml)', N'', 301, CAST(25000 AS Decimal(18, 0)), N'Miếng', CAST(N'2023-06-24T13:30:46.520' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23436_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'7a203c32-2866-402d-915f-69cf49223aa3', N'Bông tẩy trang Niva (Hộp 80 miếng)', N'Bông tẩy trang Niva được sản xuất từ nguyên liệu 100% bông thiên nhiên theo công nghệ của Đức, mềm mại, không xổ lông, không để lại xơ bông trên mặt, đem lại cảm giác êm dịu và an toàn cho làn da.', 301, CAST(36500 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.603' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P21193_1_l-thumbnail-255x255.webp', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'c8ff2264-7a24-45a2-92da-6ee310719e8c', N'Bộ kit dành cho da mụn Some By Mi AHA-BHA-PHA 30 Days Miracle Travel Kit', N'Bộ kit dành cho da mụn Some By Mi AHA-BHA-PHA 30 Days Miracle Travel Kit là bộ sản phẩm dưỡng da toàn diện dành cho làn da gặp phải các vấn đề về mụn, lỗ chân lông to hay da sần sùi, kém mịn màng.', 214, CAST(408000 AS Decimal(18, 0)), N'Bộ', CAST(N'2023-06-24T13:30:46.543' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P21454_1_l-thumbnail-255x255.webp', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'c1b313fb-e735-479f-8c90-702adf5e36ea', N'Bột khử mùi Trapha (30g)', N'Bột khử mùi Trapha giúp khử mùi, làm thơm, ngăn ngừa các tác nhân gây mùi hôi nách, hôi chân khi đi giày, giảm tiết mồ hôi ở chân và nách.', 301, CAST(11000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.550' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00326_1_l-thumbnail-255x255.webp', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'6230ff2f-a13e-43e5-96de-74995e1ed890', N'Carflem 375mg ( 3 vỉ x 10 viên/hộp)', N'Hoạt tính : Carbocistein 375mg.Công dụng: Điều trị viêm mũi, viêm xoang, viêm phế quản, khí phế thủng.....Hình thức: Viên nang cứngThương hiệu: Pymepharco (Việt Nam)', 156, CAST(39000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.680' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P14917_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'058ec177-bb2d-4685-8030-76f34d82cb5d', N'Salonpas Pain Relief Patch (5 miếng/hộp)', N'Hoạt tính: Methyl salicylate 10%, L - Menthol 3%,..Công dụng: Giảm đau, kháng viêm,…Đối tượng sử dụng: Người lớn và trẻ em.Hình thức: Miếng dánThương hiệu: Hisamitsu (Việt Nam)', 301, CAST(40000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.677' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P03074_1-thumbnail-255x255-70.jpg', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'c22aa4d7-c258-4f74-b5c4-7d0df0956fd9', N'Thực phẩm bảo vệ sức khỏe 82X The Pink Collagen (Hộp 6 chai)', N'', 215, CAST(380000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.547' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25520_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'e597b7e6-1e8d-4d75-a139-83690435c1a7', N'Băng cá nhân không thấm nước Urgo Waterproof (50 miếng/hộp)', N'Băng cá nhân không thấm nước Urgo Waterproof giúp bảo vệ các vết thương nhỏ, vết trầy xước, rách da khỏi nước và vi khuẩn. Thiết kế nhỏ gọn, tiện lợi khi sử dụng và có thể mang theo mọi nơi.', 301, CAST(60000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P08297_36-thumbnail-255x255.png', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'50ed25f1-f00c-49c8-be0f-8abf91274a6f', N'Bông cuộn y tế thấm nước Bạch Tuyết (25g)', N'Sản phẩm được sản xuất từ 100% bông xơ tự nhiên, không lẫn tạp chất và không pha poly. Công nghệ Châu Âu giúp bông mịn, chắc. Quy cách đóng gói đa dạng phù hợp với mọi nhu cầu tiêu dùng của khách hàng.', 301, CAST(8000 AS Decimal(18, 0)), N'Gói', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00133_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'75e3abf5-6258-4e13-a5c9-8b0b58094732', N'Acetylcystein 200mg Vidipha (Hộp 20 vỉ x 10 viên) ', N'', 283, CAST(100000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.773' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25186_1-thumbnail-255x255-70.jpg', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'83896216-b131-4a84-9343-92376984ca84', N'Allvitamine (Hộp 6 vỉ x 10 viên)', N'Hoạt chất: Vitamin A, B1, B2, B5, B6, PP, ECông dụng: Bổ sung vitamin cần thiết cho cơ thểĐối tượng sử dụng: Người lớn và trẻ emHình thức: Viên nén bao đườngThương hiệu: USA - NIC pharmaNơi sản xuất: USA - NIC Pharma Company (Việt Nam)', 301, CAST(266000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.787' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P17910_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'428d98fb-6657-422a-99bb-9fe5ef1909a1', N'Bisbeta 120 (Hộp 2 vỉ x 21 viên)', N'Hoạt chất: Orlistat 120mgCông dụng: Giảm calo hỗ trợ trị béo phì, thừa cânHình thức: Viên nang cứngThương hiệu: S.P.MNơi sản xuất: Công ty Cổ phần S.P.M (Việt Nam)', 301, CAST(378000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.630' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P15863_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'e2ccb8ab-22fd-4468-baf7-a26dff883557', N'Máy đo nồng độ oxy trong máu Ame Life SPO2 PO-7090', N'', 301, CAST(736400 AS Decimal(18, 0)), N'Cái', CAST(N'2023-06-24T13:30:46.650' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P22153_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'1cf03293-4732-483a-ae85-a289490be120', N'Bisacodyl DHG (Hộp 4 vỉ x 25 viên)', N'Hoạt chất: Bisacodyl 5 mgCông dụng: Điều trị táo bón, làm sạch ruột khi phẫu thuật, X-quangĐối tượng sử dụng: Người lớn và trẻ em từ 6 tuổi trở lênHình thức: Viên nén bao phim tan trong ruộtThương hiệu: Dược Hậu Giang (Việt Nam)', 301, CAST(35000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.627' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00922_1-thumbnail-255x255-70.jpg', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'18fc5b43-d6b9-484c-a3eb-a81632925cbd', N'Cao dán Tiger Balm Plaster-RD 7 x 10cm (Túi 3 miếng)', N'Cao dán Tiger Balm Plaster-RD giúp giảm các triệu chứng mỏi cơ, đau và nhức cơ, cứng cổ và vai, vết đụng đập, bong gân và đau lưng.', 301, CAST(34000 AS Decimal(18, 0)), N'Túi', CAST(N'2023-06-24T13:30:47.677' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P21610_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'b01ffe4c-e2ae-4e8e-baaa-aacfe7228a24', N'Thực phẩm bảo vệ sức khỏe hỗ trợ giảm đau dạ dày Bio Stomach (Hộp 20 gói)', N'', 120, CAST(120000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.220' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P24162_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'45e21254-113c-4233-afa2-aad3babcbb01', N'Sữa bột Anlene Gold 5X hương vani 800g', N'', 301, CAST(499000 AS Decimal(18, 0)), N'Lon', CAST(N'2023-06-24T13:30:46.767' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P22189_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'dae07165-e3bc-4dbf-935e-ae6a5b9bce00', N'Cao Ích Mẫu (180ml)', N'Hoạt tính: Ích mẫu (Herba Leonuri japonici) 72.0g; Hương phụ (Rhizoma Cyperi) 22.5g; Ngải cứu (Herba Artemisiae vulgaris) 18.0g.Công dụng: Điều hòa kinh nguyệt, giảm triệu chứng mãn kinh,…Hình thức: Cao lỏngThương hiệu: CTCP Dược Phẩm OPC (Việt Nam)', 301, CAST(45000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:47.680' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00191_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'991bac57-0ee8-4e08-b1cc-b3a95027e1d5', N'Thực phẩm bảo vệ sức khoẻ bảo vệ sức khoẻ hỗ trợ tiêu hoá AB Junior Pre & Pro (Hộp 10 gói)', N'', 147, CAST(130000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.687' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23358_3-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'815a816d-7dea-4497-8320-b4435bcff2e7', N'Tăm bông người lớn Meriday Bạch Tuyết (40 que/gói)', N'Đầu bông được làm từ 100% bông xơ tự nhiên. Bông được quấn với kỹ thuật cao, làm cho bông chắc và mịn. Thân tăm bông làm từ nhựa dẻo, có độ đàn hồi tốt, thành phần không gây hại cho sức khỏe người dùng.', 266, CAST(33000 AS Decimal(18, 0)), N'Lốc', CAST(N'2023-06-24T13:30:46.647' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P01352_1_l-thumbnail-255x255.webp', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'22e8ba21-8c9e-4dd9-91ab-ba9a33a5b2f7', N'TPCN hỗ trợ tăng cường thính lực Kim Thính (3 vỉ x 10 viên/hộp) ', N'', 301, CAST(210000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.680' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P24942_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'324a072c-7266-4df0-b8cd-bbb91f633298', N'Tydol Sachet Powder 80mg (Hộp 12 gói)', N'Hoạt chất: Acetaminophen 80mgCông dụng: Hạ sốt, giảm đau do: cảm lạnh, cảm cúm, nhức đầu, ...Hình thức: gói bột pha uống.Thương hiệu: OPVNơi sản xuất: Công ty Cổ phần Dược phẩm OPV (Việt Nam)', 301, CAST(18000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.633' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P10814_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'd77a5a61-0bff-4064-8b14-bd4c59ded36a', N' Mặt nạ dưỡng da giảm mụn Banobagi Vita Genic Jelly Mask Cica (30ml)', N'', 14, CAST(25000 AS Decimal(18, 0)), N'Miếng', CAST(N'2023-06-24T13:30:46.520' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23433_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'ef38c124-33d7-45cd-8967-c17e7e0a2bb8', N'Nước uống collagen giúp hỗ trợ trắng da cải thiện nếp nhăn Alfe Beauty Conc (Hộp 10 chai x 50 ml)', N'', 301, CAST(594000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.037' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P24362_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'9236c166-6e61-49b9-aee9-c181a8a6eb06', N'Serum trẻ hóa Balance Active Formula Serum Collagen + 2.5% Peptides (Chai 30ml)', N'', 301, CAST(320000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.520' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25745_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'752b878e-9678-4e93-9795-c4786503b833', N'Băng dán cá nhân Pharmacity màu da (10 miếng/gói)', N'Băng dán cá nhân Pharmacity giúp bảo vệ vết thương ngoài da. Với khả năng chống thấm nước và có độ dính cao, băng cá nhân Pharmacity giúp bảo vệ các vết trầy xước, vết thương hiệu quả.', 301, CAST(10000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.770' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P09769_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'2ab48365-635a-4cfc-a6d4-c5ce6561ba23', N'Hỗ trợ trắng da, chống lão hóa Alltimes Care Whitening Skin (Hộp 60 viên)', N'', 185, CAST(950000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.923' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23119_1_l-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'1801b362-06fb-45df-b14c-c63346945352', N'Thực phẩm bảo vệ sức khỏe viên uống hỗ trợ giảm acid uric trong máu Baigout (Hộp 20 viên)', N'Viên uống giảm acid uric trong máu Baigout chiết xuất từ hạt Cần tây, Nhũ hương, Tơm trơng, hỗ trợ giảm acid uric trong máu, cải thiện các triệu chứng sưng, đau các khớp do gout.', 12, CAST(239000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.817' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P21609_1_new-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'1c46574c-60d7-4a85-a084-c9fa41d7ce68', N'Băng cá nhân không thấm nước Urgo Waterproof (10 miếng/hộp)', N'Băng cá nhân không thấm nước Urgo Waterproof giúp bảo vệ các vết thương nhỏ, vết trầy xước, rách da khỏi nước và vi khuẩn. Thiết kế nhỏ gọn, tiện lợi khi sử dụng và có thể mang theo mọi nơi.', 301, CAST(20000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P08296_36-thumbnail-255x255.png', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'ad9e3176-3e03-4487-82f6-ccab9b37e181', N'Mặt nạ dưỡng trắng và cấp ẩm Banobagi Vita Genic Jelly Mask Whitening & Moisture (30ml)', N'', 301, CAST(25000 AS Decimal(18, 0)), N'Miếng', CAST(N'2023-06-24T13:30:46.647' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23438_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'cbfb17fe-f68f-49d9-a0ed-d171b0591565', N'Hỗ trợ giải độc gan ABIPHA (Hộp 100 viên)', N'', 301, CAST(68000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.680' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25849_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'47484eb4-68d0-4f52-a03f-d236c204ea59', N'Thực phẩm chức năng hỗ trợ làm chậm quá trình lão hóa, tăng đàn hồi da Beyou Royal Collagen (Hộp 90 viên)', N'TPCN hỗ trợ làm chậm quá trình lão hóa, hỗ trợ tăng độ đàn hồi cho da Beyou Royal Collagen chứa thành phần collagen cá, vitamin C, sữa ong chúa và elastin, dùng cho người từ 18 tuổi trở lên có nhu cầu chăm sóc da, người bắt đầu có dấu hiệu lão hóa.', 301, CAST(480000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.110' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P21997_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'ccc5aa3b-b2fb-417d-b488-d90dd9202f09', N' Nước tẩy trang chiết xuất từ hoa Bleuet Calliderm Miscellaire 3In1 (Chai 250ml)', N'', 82, CAST(180000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:46.600' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23701_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'611ab979-99fd-406f-990f-e7d846f0328c', N'Thực phẩm hỗ trợ tuần hoàn máu não An Huy Bona Extra Night (Hộp 30 viên)', N'', 132, CAST(169000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.677' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25533_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'7d9823a2-2bf3-433d-bbce-ecdb709390ba', N'Hỗ trợ cơ xương khớp BioCo Eurokop 3 in 1 (Hộp 120 viên)', N'TPCN hỗ trợ cơ xương khớp BioCo Eurokop 3 in 1 giúp hỗ trợ cơ, xương, khớp chắc khỏe', 301, CAST(528000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.217' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P22405_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'72f5fb5a-f096-4496-a4d5-ed064748b0a6', N'Hỗ trợ giảm cân Body Slim Premium (Hộp 30 viên)', N'', 206, CAST(396000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.323' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P24856_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'0635f6de-c2b0-4fb9-beea-edbe6e0ac36c', N'Viên uống dầu gấc Vina DHA (Hộp 1 lọ 100 viên)', N'Viên uống dầu gấc Vina DHA là thực phẩm bảo vệ sức khỏe,chiết xuất từ quả gấc , có bổ sung thêm DHA. Có thể uống hàng ngày để bảo vệ sức khỏe, chống lão hóa, cải thiện sự phát triển của cơ thể và giữ gìn tuổi thanh xuân.', 301, CAST(79000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.110' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P14509_1_l-thumbnail-255x255.webp', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'1cb754a9-dc1b-45dd-a5d9-f113b878c9af', N'Thực phẩm bảo vệ sức khỏe hỗ trợ tạo máu Anmi Feron 3+ (Hộp 4 vỉ x 5 ống x 10ml)', N'Thực phẩm bảo vệ sức khỏe hỗ trợ tạo máu Anmi Feron 3+ hỗ trợ bổ sung sắt, acid folic cho cơ thể, hỗ trợ quá trình tạo máu, giúp hạn chế biểu hiện và giảm nguy cơ thiếu máu do thiếu sắt, có thể dùng cho trẻ từ 6 tháng tuổi trở lên và người lớn.', 301, CAST(148000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.110' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P21810_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'bee5840d-f153-4131-be71-f1253d9d7cb4', N' Mặt nạ Banobagi Vita Genic Jelly Mask Pore Tightening (30ml)', N'', 301, CAST(25000 AS Decimal(18, 0)), N'Miếng', CAST(N'2023-06-24T13:30:46.567' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23431_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'b441e311-e865-4465-b91b-f34c5d4e9a28', N' Mặt nạ Banobagi Vita Genic Jelly Mask Whitening & Stem Cell Collagen (30ml)', N'', 301, CAST(25000 AS Decimal(18, 0)), N'Miếng', CAST(N'2023-06-24T13:30:46.567' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P23434_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'bcefaeb3-0c3b-4af2-b3a6-f447b4a4c8ce', N'Men vi sinh hỗ trợ tiêu hóa 6 ENZYMES IP (Hộp 20 ống x 10ml)', N'', 301, CAST(155000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.520' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25921_2-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'18762aef-5036-43fd-a2ed-f6f9452e3aee', N'Que thử thai nhanh HCG Allisa (Hộp 1 cái)', N'', 301, CAST(15000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P21913_1-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'dd18d320-7306-4a48-97de-f7be92edecc8', N'Băng cá nhân ít thấm nước Urgo Washproof Assorted (20 miếng/hộp)', N'Băng cá nhân ít thấm nước Urgo Washproof Assorted gồm 20 miếng x 4 kích cỡ, giúp bảo vệ các vết thương nhỏ, vết trầy xước, rách da. Thiết kế nhỏ gọn, tiện lợi khi sử dụng và có thể mang theo mọi nơi.', 301, CAST(25000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P08295_36-thumbnail-255x255.png', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'a16f0ed7-b4a6-4b0a-88b8-fb092737252d', N'Kem hỗ trợ điều trị mụn Bioderma Sebium Kerato (Hộp 30ml)', N'', 301, CAST(445000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.540' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25746_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'd3f1def4-2fed-4c19-9fdf-fcc458129bec', N'Thực phẩm bổ sung Canxi và Vitamin D An Huy Anfa Calcium D (Hộp 30 viên)', N'', 186, CAST(189000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:47.680' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25532_1-thumbnail-255x255-70.jpg', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'e7bd7030-c5a3-4af7-8929-febb1da18a5c', N'Betadine Antiseptic Sol 10% (Chai 125ml)', N'Hoạt chất: Povidon-lod 10% kl/ttCông dụng: Diệt mầm bệnh ở da, vết thương và niêm mạcĐối tượng sử dụng: Người lớnHình thức:Dung dịch dùng ngoàiThương hiệu: Mundipharma Pharmaceuticals Ltd.Nơi sản xuất: Mundipharma Pharmaceuticals Ltd. (CH Síp)', 301, CAST(53000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:46.790' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P00684_1_l-thumbnail-255x255.webp', N'4dfe78c2-4efa-4a72-a9cd-6b700390ad01')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'fcaa148b-8194-4bcc-a481-ff09ebd3cb45', N'[IMC] Thực phẩm bảo vệ sức khỏe Bình vị Thái Minh (Hộp 20 viên)', N'', 301, CAST(163000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:48.217' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P19531_1_l-thumbnail-255x255.webp', N'598ca132-60e0-414a-be8c-ce5f84fa8665')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'00e4ca82-c1f2-472e-b841-ff0ed6089c48', N'Băng cá nhân trẻ em Pharmacity (10 miếng/hộp)', N'Băng cá nhân trẻ em Pharmacity giúp bảo vệ vết thương ngoài da của bé. Với khả năng chống thấm nước và có độ dính cao, băng cá nhân trẻ em Pharmacity sẽ bảo vệ các vết trầy xước, vết thương hiệu quả.', 301, CAST(15000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P10637_4-thumbnail-255x255-70.jpg', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'b8ce291e-40bc-4601-9056-ffb3d9bf181b', N'Băng cá nhân tiệt trùng bán thấm cho vết thương nông Urgo 10cmx7cm (4 miếng)', N'Băng cá nhân tiệt trùng bán thấm cho vết bỏng, vết thương nông Urgo giúp bảo vệ vùng da bị tổn thương, không dính vào vết thương, không gây đau khi thay băng và hoàn toàn không thấm nước.', 301, CAST(135000 AS Decimal(18, 0)), N'Hộp', CAST(N'2023-06-24T13:30:46.763' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P20383_36-thumbnail-255x255.png', N'5007207d-ed82-4f50-af26-b42635230538')
INSERT [dbo].[PRODUCT] ([id], [name], [detail], [quantity], [price], [type], [createAt], [idUser], [pathImg], [idCategory]) VALUES (N'94d3d6e5-6757-490e-bcbb-fffdb3a53c19', N'Kem chống nắng Cancer Council Everyday Value Sunscreen SPF50 (Chai 110ml)', N'', 301, CAST(395000 AS Decimal(18, 0)), N'Chai', CAST(N'2023-06-24T13:30:46.543' AS DateTime), NULL, N'https://data-service.pharmacity.io/pmc-upload-media/production/pmc-ecm-core/__sized__/products/P25518_1-thumbnail-255x255-70.jpg', N'be314ffd-208e-4bdb-915d-b74358abdfe8')
GO
INSERT [dbo].[ROLE] ([id], [name], [createAt]) VALUES (N'3eca9f6f-84b8-42da-8a58-bcdb6b64f823', N'Admin', CAST(N'2024-06-24T13:25:12.770' AS DateTime))
INSERT [dbo].[ROLE] ([id], [name], [createAt]) VALUES (N'd6803cd2-3459-4401-890a-d9ec65c46f72', N'Guest', CAST(N'2024-06-24T13:25:12.770' AS DateTime))
GO
INSERT [dbo].[USER] ([id], [email], [name], [password], [address], [phone], [pathImg], [idRole], [createAt]) VALUES (N'32fa5441-9c59-4518-bf11-5d9bb0dab94f', N'bcn@gmail.com', N'Bùi Cao Nhân 1', N'caonhan123', N'Hòa thành - tây ninh ', N'0334517717', N'https://res.cloudinary.com/df6mryfkp/image/upload/v1691680093/banthuoclac/kfpol3rt2xvsf4zuducw.png', N'3eca9f6f-84b8-42da-8a58-bcdb6b64f823', NULL)
INSERT [dbo].[USER] ([id], [email], [name], [password], [address], [phone], [pathImg], [idRole], [createAt]) VALUES (N'7efb44ec-2891-4342-8856-e2801a296099', N'bcn1@gmail.com', N'Bùi Cao Nhân ', N'caonhan123', N'Hòa thành - tây ninh', N'0334517717', NULL, N'd6803cd2-3459-4401-890a-d9ec65c46f72', CAST(N'2024-06-24T13:32:24.520' AS DateTime))
GO
ALTER TABLE [dbo].[CATEGORY] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[CATEGORY] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[DETAILORDERS] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[DETAILORDERS] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[ORDER] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ORDER] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[ORDER] ADD  DEFAULT ((0)) FOR [total]
GO
ALTER TABLE [dbo].[ORDER] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[PRODUCT] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[ROLE] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[ROLE] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[USER] ADD  DEFAULT (getdate()) FOR [createAt]
GO
ALTER TABLE [dbo].[DETAILORDERS]  WITH CHECK ADD FOREIGN KEY([idOrder])
REFERENCES [dbo].[ORDER] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DETAILORDERS]  WITH CHECK ADD FOREIGN KEY([idProduct])
REFERENCES [dbo].[PRODUCT] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([idCategory])
REFERENCES [dbo].[CATEGORY] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRODUCT]  WITH CHECK ADD FOREIGN KEY([idUser])
REFERENCES [dbo].[USER] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[USER]  WITH CHECK ADD FOREIGN KEY([idRole])
REFERENCES [dbo].[ROLE] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [FINAL] SET  READ_WRITE 
GO
