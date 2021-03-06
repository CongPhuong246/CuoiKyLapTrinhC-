USE [master]
GO
/****** Object:  Database [HoTenDB]    Script Date: 6/20/2021 4:37:51 PM ******/
CREATE DATABASE [HoTenDB]
GO
ALTER DATABASE [HoTenDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HoTenDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HoTenDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HoTenDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HoTenDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HoTenDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HoTenDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HoTenDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HoTenDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HoTenDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HoTenDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HoTenDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HoTenDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HoTenDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HoTenDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HoTenDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HoTenDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HoTenDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HoTenDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HoTenDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HoTenDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HoTenDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HoTenDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HoTenDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HoTenDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HoTenDB] SET  MULTI_USER 
GO
ALTER DATABASE [HoTenDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HoTenDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HoTenDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HoTenDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HoTenDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HoTenDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HoTenDB] SET QUERY_STORE = OFF
GO
USE [HoTenDB]
GO
/****** Object:  Table [dbo].[LoaiSP]    Script Date: 6/20/2021 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSP](
	[MaLoaiSP] [nvarchar](4) NOT NULL,
	[TenLoaiSP] [nvarchar](255) NULL,
 CONSTRAINT [PK_LoaiSP] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 6/20/2021 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [nvarchar](4) NOT NULL,
	[TenSP] [nvarchar](200) NULL,
	[Donvitinh] [nvarchar](50) NULL,
	[Dongia] [float] NULL,
	[HinhSP] [nvarchar](max) NULL,
	[TrangThai] [bit] NULL,
	[MaLoaiSP] [nvarchar](4) NULL,
	[Soluong] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 6/20/2021 4:37:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [nvarchar](4) NOT NULL,
	[TenTK] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'ML01', N'Rượu')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'ML02', N'Bia')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'ML03', N'Nước ngọt')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'ML04', N'Điện máy')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'ML05', N'Viết')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'ML06', N'Điện Thoại')
INSERT [dbo].[LoaiSP] ([MaLoaiSP], [TenLoaiSP]) VALUES (N'ML07', N'Nước')
GO
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'Bb01', N'Bia Huda', N'Chai', 20000, N'images/biahuda.jpg', 1, N'ML02', 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'BH01', N'Bia Heineken', N'Chai', 15000, N'images/biaheinekenchai.jpg', 1, N'ML02', 10)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'BS01', N'Bia Larue', N'Chai', 25000, N'images/bialaruechai.jpg', 1, N'ML02', 20)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'Bs14', N'Bia Sài gòn', N'Chai', 12000, N'images/biasaigonchai.jpg', 0, N'ML02', 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'BS15', N'Bia 333', N'Thùng', 215000, N'Images/bia33thung.jpg', 1, N'ML02', 100)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'BT04', N'Beer Tiger', N'Thùng', 280000, N'images/biatigerthung.jpg', 1, N'ML02', 200)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'CC06', N'Coca Cola', N'Thùng', 115000, N'images/cocacolathung.jpg', 1, N'ML03', 300)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'CH07', N'Cassette Sharp 100W', N'Cái', 2250000, N'images/cassetsharp.jpg', 1, N'ML04', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'CH08', N'Cassette Sharp 500W', N'Cái', 4250000, N'images/cassetsharp500w.jpg', 1, N'ML04', 11)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'PC01', N'Bút chì đen', N'Cái', 2000, N'images/butchiden.jpg', 1, N'ML05', 400)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'PL02', N'Bút long kim', N'Cái', 50000, N'images/butlongkim.jpg', 1, N'ML05', 250)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'PS05', N'Bút sáp', N'Hộp', 60000, N'Images/butsap.jpg', 1, N'ML05', 110)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'PS15', N'Pepsi', N'Thùng', 150000, N'images/pepsithung.jpg', 1, N'ML03', 30)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'RC17', N'Rượu chát đỏ', N'Chai', 110000, N'images/ruouchatdo.jpg', 1, N'ML01', 155)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'RC19', N'Rượu Champagne', N'Chai', 160000, N'images/ruouchampagne.jpg', 1, N'ML01', 122)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'RN01', N'Rượu nếp Gò đen', N'Chai', 15000, N'images/ruounepgoden.jpg', 1, N'ML01', 155)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'RN02', N'Rượu Napoleon ', N'Chai', 3100000, N'images/ruounapoleon.jpg', 1, N'ML01', 145)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'RV01', N'Rượu vang nho', N'Chai', 120000, N'Images/RuouVangNho.jpg', 0, N'ML01', 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'RX01', N'Rượu XO', N'Chai', 1160000, N'images/ruouoxo.jpg', 1, N'ML01', 184)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'RX12', N'Rượu Xuân Thạnh', N'Chai', 12000, N'images/ruouxuanthanh.jpg', 0, N'ML01', 0)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'SE01', N'7 UP', N'Lon', 12000, N'Images/7Up.jpg', 1, N'ML03', 297)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'TE01', N'Tea plus', N'Chai', 15000, N'Images/TeaPlus.jpg', 1, N'ML03', 245)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'TS01', N'Tivi Sharp 14', N'Cái', 1600000, N'images/tivisharp.jpg', 1, N'ML04', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Dongia], [HinhSP], [TrangThai], [MaLoaiSP], [Soluong]) VALUES (N'TS21', N'Tivi Sony 20', N'Cái', 1310000, N'images/tivisony.jpg', 1, N'ML04', 9)
GO
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK01', N'phuong', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK02', N'admin', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK03', N'hhh', N'21232f297a57a5a743894a0e4a801fc3', 0)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK04', N'bbb', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK05', N'ttt', N'21232f297a57a5a743894a0e4a801fc3', 0)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK06', N'ddddd', N'21232f297a57a5a743894a0e4a801fc3', 0)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK08', N'fff', N'21232f297a57a5a743894a0e4a801fc3', 0)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK09', N'qqq', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK10', N'rrr', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK11', N'iii', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK12', N'lll', N'21232f297a57a5a743894a0e4a801fc3', 1)
INSERT [dbo].[TaiKhoan] ([MaTK], [TenTK], [MatKhau], [TrangThai]) VALUES (N'TK13', N'ppp', N'21232f297a57a5a743894a0e4a801fc3', 1)
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoaiSP])
REFERENCES [dbo].[LoaiSP] ([MaLoaiSP])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD CHECK  (([Soluong]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [HoTenDB] SET  READ_WRITE 
GO
