CREATE DATABASE [QLBH_TKCSDL]
USE [QLBH_TKCSDL]
GO
/****** Object:  UserDefinedFunction [dbo].[func_DoanhThuTrongNgay]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[func_DoanhThuTrongNgay]
(@ngay datetime)
returns decimal
as
begin
	declare @doanhthu decimal;
	select @doanhthu = sum(sp.giaban * cthd.soluong)
	from hoadon hd, chitiethoadon cthd, sanpham sp
	where hd.sohd = cthd.sohd and 
		sp.masp = cthd.masp and 
		DAY(hd.ngayhd) = DAY(@ngay) and 
		MONTH(hd.ngayhd) = MONTH(@ngay) and 
		YEAR(hd.ngayhd) = YEAR(@ngay)

	if(@doanhthu is null)
		begin
			set @doanhthu = 0
		end

	return @doanhthu
end
GO
/****** Object:  Table [dbo].[chitiethoadon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiethoadon](
	[sohd] [varchar](10) NOT NULL,
	[masp] [varchar](10) NOT NULL,
	[soluong] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[sohd] [varchar](10) NOT NULL,
	[ngayhd] [datetime] NOT NULL,
	[manv] [varchar](10) NOT NULL,
	[makh] [varchar](10) NOT NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[sohd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[makh] [varchar](10) NOT NULL,
	[tenkh] [nvarchar](50) NOT NULL,
	[diachi] [nvarchar](100) NOT NULL,
	[sdt] [varchar](10) NOT NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[manv] [varchar](10) NOT NULL,
	[tennv] [nvarchar](50) NOT NULL,
	[matkhau] [varchar](20) NOT NULL,
	[quyen] [int] NOT NULL,
 CONSTRAINT [PK_nguoidung] PRIMARY KEY CLUSTERED 
(
	[manv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhasanxuat]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhasanxuat](
	[mansx] [varchar](10) NOT NULL,
	[tennsx] [varchar](50) NOT NULL,
 CONSTRAINT [PK_nhanhieu] PRIMARY KEY CLUSTERED 
(
	[mansx] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sanpham]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sanpham](
	[masp] [varchar](10) NOT NULL,
	[tensp] [nvarchar](100) NOT NULL,
	[mausac] [nvarchar](50) NOT NULL,
	[bonhotrong] [varchar](10) NOT NULL,
	[soluong] [int] NOT NULL,
	[giaban] [decimal](18, 0) NOT NULL,
	[hinhanh] [varchar](100) NOT NULL,
	[mansx] [varchar](10) NULL,
 CONSTRAINT [PK_sanpham] PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000001', N'210000003', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000002', N'210000005', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000005', N'210000005', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000006', N'210000009', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000008', N'210000002', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000009', N'210000009', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000009', N'210000021', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000008', N'210000017', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000011', N'210000007', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000014', N'210000008', 2)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000015', N'210000006', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000017', N'210000036', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000018', N'210000009', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000021', N'210000007', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000022', N'210000008', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000023', N'210000008', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000024', N'210000003', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000025', N'210000008', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000016', N'210000037', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000010', N'210000003', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000012', N'210000004', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000013', N'210000007', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000003', N'210000006', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000003', N'210000003', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000004', N'210000004', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000004', N'210000006', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000019', N'210000007', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000020', N'210000008', 1)
GO
INSERT [dbo].[chitiethoadon] ([sohd], [masp], [soluong]) VALUES (N'2100000007', N'210000021', 1)
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000001', CAST(N'2021-12-17T14:18:37.000' AS DateTime), N'210002', N'2100000001')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000002', CAST(N'2021-12-17T22:40:06.000' AS DateTime), N'210002', N'2100000001')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000003', CAST(N'2021-12-17T23:17:20.000' AS DateTime), N'210002', N'2100000002')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000004', CAST(N'2021-12-17T23:20:21.000' AS DateTime), N'210002', N'2100000003')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000005', CAST(N'2021-12-18T00:37:40.000' AS DateTime), N'210002', N'2100000004')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000006', CAST(N'2021-12-21T15:57:29.000' AS DateTime), N'210003', N'2100000005')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000007', CAST(N'2021-12-29T15:48:22.000' AS DateTime), N'210002', N'2100000006')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000008', CAST(N'2021-12-27T22:17:07.000' AS DateTime), N'210002', N'2100000007')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000009', CAST(N'2021-12-27T22:12:36.000' AS DateTime), N'210002', N'2100000008')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000010', CAST(N'2021-12-27T22:45:58.000' AS DateTime), N'210002', N'2100000009')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000011', CAST(N'2021-12-27T22:56:17.000' AS DateTime), N'210002', N'2100000010')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000012', CAST(N'2021-12-27T23:06:18.000' AS DateTime), N'210002', N'2100000011')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000013', CAST(N'2021-12-27T23:08:10.000' AS DateTime), N'210002', N'2100000012')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000014', CAST(N'2021-12-27T23:10:31.000' AS DateTime), N'210002', N'2100000013')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000015', CAST(N'2021-12-27T23:13:57.000' AS DateTime), N'210002', N'2100000014')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000016', CAST(N'2021-12-27T23:13:57.000' AS DateTime), N'210002', N'2100000015')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000017', CAST(N'2021-12-27T23:16:36.000' AS DateTime), N'210003', N'2100000016')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000018', CAST(N'2021-12-27T23:16:36.000' AS DateTime), N'210003', N'2100000017')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000019', CAST(N'2021-12-27T23:21:02.000' AS DateTime), N'210003', N'2100000018')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000020', CAST(N'2021-12-27T23:25:34.000' AS DateTime), N'210004', N'2100000019')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000021', CAST(N'2021-12-27T23:26:48.000' AS DateTime), N'210004', N'2100000020')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000022', CAST(N'2021-12-27T23:27:49.000' AS DateTime), N'210004', N'2100000021')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000023', CAST(N'2021-12-28T22:31:26.000' AS DateTime), N'210004', N'2100000022')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000024', CAST(N'2021-12-29T07:25:57.000' AS DateTime), N'210002', N'2100000023')
GO
INSERT [dbo].[hoadon] ([sohd], [ngayhd], [manv], [makh]) VALUES (N'2100000025', CAST(N'2021-12-29T12:47:30.000' AS DateTime), N'210002', N'2100000024')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000001', N'V?? Th??nh C??ng', N'3 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671101')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000002', N'Tr???n M???nh H??ng', N'5 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671102')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000003', N'Nguy???n Th??? Di???u', N'8 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671103')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000004', N'Hu???nh T??', N'11 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671104')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000005', N'Nguy???n Qu???c Th???nh', N'12 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671105')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000006', N'Ph???m Th??? Y???n', N'13 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671106')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000007', N'Tr???n Th??? C???m T??', N'10 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671100')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000008', N'Ng?? Thanh T??ng', N'14 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671107')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000009', N'Nguy???n Th??? B??ch Tr??m', N'15 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671108')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000010', N'Nguy???n Ng???c Ti??n', N'16 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671109')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000011', N'?????ng Qu???c H???i', N'17 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671110')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000012', N'?????ng Thanh T??m', N'18 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671111')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000013', N'Nguy???n Thu H????ng', N'19 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671112')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000014', N'Nguy???n Thu Thu???', N'20 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671113')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000015', N'B??i Ti???n D??ng', N'21 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671114')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000016', N'B??i Ti???n D??ng', N'22 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671115')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000017', N'Nguy???n Minh Tu???n', N'23 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671116')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000018', N'Nguy???n Th??? D??? Th???o', N'24 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671117')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000019', N'Tr???n Minh T??i', N'25 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671118')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000020', N'Tr???n Minh T??n', N'26 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671118')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000021', N'L??? L?? M???ng Ng???c', N'27 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671119')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000022', N'Nguy???n Ng???c Lan Anh', N'28 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671120')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000023', N'Nguy???n Lan Ng???c', N'29 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671121')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000024', N'Ng?? Qu???c', N'30 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671122')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000025', N'Tr???nh Th??? Minh Th???o', N'31 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671123')
GO
INSERT [dbo].[khachhang] ([makh], [tenkh], [diachi], [sdt]) VALUES (N'2100000026', N'Nguy???n Thu Thu???', N'202 L?? V??n Vi???t, T??ng Nh??n Ph?? A, TP Th??? ?????c, Th??nh ph??? H??? Ch?? Minh', N'0385671133')
GO
INSERT [dbo].[nhanvien] ([manv], [tennv], [matkhau], [quyen]) VALUES (N'210001', N'Phan Kh??nh Duy', N'123456', 1)
GO
INSERT [dbo].[nhanvien] ([manv], [tennv], [matkhau], [quyen]) VALUES (N'210002', N'Nguy???n Thanh T??', N'123456', 0)
GO
INSERT [dbo].[nhanvien] ([manv], [tennv], [matkhau], [quyen]) VALUES (N'210003', N'Nguy???n Th??? Huy???n', N'123456', 0)
GO
INSERT [dbo].[nhanvien] ([manv], [tennv], [matkhau], [quyen]) VALUES (N'210004', N'L?? T???n Ph??t', N'123456', 0)
GO
INSERT [dbo].[nhanvien] ([manv], [tennv], [matkhau], [quyen]) VALUES (N'210005', N'Nguy???n Thanh Tr??', N'123456              ', 0)
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G001', N'Iphone')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G002', N'Samsung')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G003', N'Oppo')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G004', N'Asus')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G005', N'Vivo')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G006', N'Xiaomi')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G007', N'Realme')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G008', N'Nokia')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G009', N'Itel')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G010', N'Energizer')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G011', N'Masstel')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'G012', N'32')
GO
INSERT [dbo].[nhasanxuat] ([mansx], [tennsx]) VALUES (N'NSX001', N'aqwe asdqwe')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000001', N'Oppo Reno6', N'??en', N'128GB', 7, CAST(12990000 AS Decimal(18, 0)), N'..\..\public\img\oppo-reno6-den-1-org.jpg', N'G003')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000002', N'Oppo Reno6', N'B???c', N'128GB', 9, CAST(12990000 AS Decimal(18, 0)), N'..\..\public\img\oppo-reno6-bac-1-org.jpg', N'G003')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000003', N'Oppo Reno6 Z 5G', N'??en', N'128GB', 7, CAST(9490000 AS Decimal(18, 0)), N'..\..\public\img\oppo-reno6-z-5g-den-1-org.jpg', N'G003')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000004', N'Oppo Reno6 Z 5G', N'B???c', N'128GB', 8, CAST(9490000 AS Decimal(18, 0)), N'..\..\public\img\oppo-reno6-z-5g-bac-1-org.jpg', N'G003')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000005', N'Oppo Reno6 Pro 5G', N'Xanh D????ng', N'256GB', 8, CAST(17990000 AS Decimal(18, 0)), N'..\..\public\img\oppo-reno6-pro-5g-xanh-duong-1.jpg', N'G003')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000006', N'Oppo Reno6 Pro 5G', N'X??m', N'256GB', 7, CAST(17990000 AS Decimal(18, 0)), N'..\..\public\img\oppo-reno6-pro-5g-xam-1.jpg', N'G003')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000007', N'Samsung Galaxy S20 FE', N'Xanh L??', N'256GB', 6, CAST(13490000 AS Decimal(18, 0)), N'..\..\public\img\samsung-galaxy-s20-fan-edition-xanh-la-1-org.jpg', N'G002')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000008', N'Samsung Galaxy S20 FE', N'Xanh D????ng', N'256GB', 3, CAST(13490000 AS Decimal(18, 0)), N'..\..\public\img\samsung-galaxy-s20-fan-edition-xanh-duong-1-org.jpg', N'G002')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000009', N'IPhone 13 Pro Max', N'V??ng ?????ng', N'128GB', 2, CAST(33990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-gold-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000010', N'IPhone 13 Pro Max', N'V??ng ?????ng', N'256GB', 5, CAST(36990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-gold-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000011', N'IPhone 13 Pro Max', N'V??ng ?????ng', N'512GB', 5, CAST(43990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-gold-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000012', N'IPhone 13 Pro Max', N'V??ng ?????ng', N'1TB', 5, CAST(49990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-gold-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000013', N'IPhone 13 Pro Max', N'Xanh D????ng', N'128GB', 5, CAST(33990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-xanh-1.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000014', N'IPhone 13 Pro Max', N'Xanh D????ng', N'256GB', 5, CAST(36990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-xanh-1.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000015', N'IPhone 13 Pro Max', N'Xanh D????ng', N'512GB', 5, CAST(43990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-xanh-1.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000016', N'IPhone 13 Pro Max', N'Xanh D????ng', N'1TB', 5, CAST(49990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-xanh-1.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000017', N'IPhone 13 Pro Max', N'B???c', N'128GB', 4, CAST(33990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-silver-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000018', N'IPhone 13 Pro Max', N'B???c', N'256GB', 5, CAST(36990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-silver-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000019', N'IPhone 13 Pro Max', N'B???c', N'512GB', 5, CAST(43990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-silver-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000020', N'IPhone 13 Pro Max', N'B???c', N'1TB', 5, CAST(49990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-silver-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000021', N'IPhone 13 Pro Max', N'X??m', N'128GB', 3, CAST(33990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-grey-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000022', N'IPhone 13 Pro Max', N'X??m', N'256GB', 5, CAST(36990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-grey-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000023', N'IPhone 13 Pro Max', N'X??m', N'512GB', 5, CAST(43990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-grey-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000024', N'IPhone 13 Pro Max', N'X??m', N'1TB', 5, CAST(49990000 AS Decimal(18, 0)), N'..\..\public\img\iphone-13-pro-max-grey-2.jpg', N'G001')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000025', N'Xiaomi 11T 5G', N'Tr???ng', N'128GB', 5, CAST(10590000 AS Decimal(18, 0)), N'..\..\public\img\xiaomi-11t-1-1.jpg', N'G006')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000026', N'Xiaomi 11T 5G', N'Tr???ng', N'256GB', 5, CAST(11590000 AS Decimal(18, 0)), N'..\..\public\img\xiaomi-11t-1-1.jpg', N'G006')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000027', N'Xiaomi 11T 5G', N'Xanh D????ng', N'256GB', 5, CAST(11590000 AS Decimal(18, 0)), N'..\..\public\img\iaomi-11t-xanh-duong-1.jpg', N'G006')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000028', N'Xiaomi 11T 5G', N'Xanh D????ng', N'128GB', 5, CAST(10590000 AS Decimal(18, 0)), N'..\..\public\img\iaomi-11t-xanh-duong-1.jpg', N'G006')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000029', N'Xiaomi 11T 5G', N'X??m', N'128GB', 5, CAST(10590000 AS Decimal(18, 0)), N'..\..\public\img\iaomi-11t-xam-1.jpg', N'G006')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000030', N'Xiaomi 11T 5G', N'X??m', N'256GB', 5, CAST(11590000 AS Decimal(18, 0)), N'..\..\public\img\iaomi-11t-xam-1.jpg', N'G006')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000031', N'Realme 8 Pro', N'V??ng', N'128GB', 5, CAST(8690000 AS Decimal(18, 0)), N'..\..\public\img\realme-8-pro--vang-1-org.jpg', N'G007')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000032', N'Realme 8 Pro', N'Xanh D????ng', N'128GB', 5, CAST(8690000 AS Decimal(18, 0)), N'..\..\public\img\realme-8-pro-xanh-duong-1-org.jpg', N'G007')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000033', N'Realme 8 Pro', N'??en', N'128GB', 5, CAST(8690000 AS Decimal(18, 0)), N'..\..\public\img\realme-8-pro-den-1-org.jpg', N'G007')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000034', N'Realme 8 5G', N'??en', N'128GB', 5, CAST(7990000 AS Decimal(18, 0)), N'..\..\public\img\realme-8-5g-den-1-org.jpg', N'G007')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000035', N'Realme 8 5G', N'Xanh D????ng', N'128GB', 5, CAST(7990000 AS Decimal(18, 0)), N'..\..\public\img\realme-8-5g-xd-1-org.jpg', N'G007')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000036', N'Nokia G10', N'Xanh D????ng', N'64GB', 4, CAST(3490000 AS Decimal(18, 0)), N'..\..\public\img\nokia-g10-1-3.jpg', N'G008')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000037', N'Nokia 3.4', N'X??m', N'64GB', 4, CAST(3290000 AS Decimal(18, 0)), N'..\..\public\img\nokia-34-1-1-org.jpg', N'G008')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000038', N'Itel L6502', N'??en', N'32GB', 5, CAST(2490000 AS Decimal(18, 0)), N'..\..\public\img\itel-l6502-den-gc-1.jpg', N'G009')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000039', N'Itel L6502', N'Xanh D????ng', N'32GB', 5, CAST(2490000 AS Decimal(18, 0)), N'..\..\public\img\itel-l6502-xanh-1-1.jpg', N'G009')
GO
INSERT [dbo].[sanpham] ([masp], [tensp], [mausac], [bonhotrong], [soluong], [giaban], [hinhanh], [mansx]) VALUES (N'210000040', N'ASD', N'Xanh L??', N'64GB', 1, CAST(213123 AS Decimal(18, 0)), N'..\..\public\img\itel-l6502-den-gc-1.jpg', N'G004')
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiethoadon_hoadon] FOREIGN KEY([sohd])
REFERENCES [dbo].[hoadon] ([sohd])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [FK_chitiethoadon_hoadon]
GO
ALTER TABLE [dbo].[chitiethoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiethoadon_sanpham] FOREIGN KEY([masp])
REFERENCES [dbo].[sanpham] ([masp])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[chitiethoadon] CHECK CONSTRAINT [FK_chitiethoadon_sanpham]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang] FOREIGN KEY([makh])
REFERENCES [dbo].[khachhang] ([makh])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_nhanvien] FOREIGN KEY([manv])
REFERENCES [dbo].[nhanvien] ([manv])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_nhanvien]
GO
ALTER TABLE [dbo].[sanpham]  WITH CHECK ADD  CONSTRAINT [FK_sanpham_nhasanxuat] FOREIGN KEY([mansx])
REFERENCES [dbo].[nhasanxuat] ([mansx])
GO
ALTER TABLE [dbo].[sanpham] CHECK CONSTRAINT [FK_sanpham_nhasanxuat]
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatChiTietHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CapNhatChiTietHoaDon]
(@sohd varchar(10), @masp varchar(10), @soluong int)
as
begin
	update chitiethoadon set soluong = @soluong 
	where sohd = @sohd and masp = @masp
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CapNhatHoaDon]
(@sohd varchar(10), @ngayhd datetime, @manv varchar(10), @makh varchar(10))
as
begin
	update hoadon set ngayhd = @ngayhd, manv = @manv, makh = @makh
	where sohd = @sohd
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatKhachHang]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------C???p nh???t kh??ch h??ng
----------------------
create proc [dbo].[sp_CapNhatKhachHang]
(@makh varchar(10), @tenkh nvarchar(50), @diachi nvarchar(100), @sdt varchar(10))
as
begin
	update khachhang set tenkh = @tenkh, diachi = @diachi, sdt = @sdt
	where makh = @makh
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatNhanVien]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------C???p nh???t nh??n vi??n
----------------------
create proc [dbo].[sp_CapNhatNhanVien]
(@manv varchar(10), @tennv nvarchar(50), @matkhau varchar(20), @quyen int)
as
begin
	update nhanvien set tennv = @tennv, matkhau = @matkhau, quyen = @quyen
	where manv = @manv
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatNhaSanXuat]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CapNhatNhaSanXuat]
(@mansx varchar(10), @tennsx varchar(50))
as
begin
	update nhasanxuat set tennsx = @tennsx
	where mansx = @mansx
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatSanPham]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_CapNhatSanPham]
(
	@masp varchar(10), @tensp nvarchar(100),@hinhanh varchar(100),
	@mausac nvarchar(50), @bonhotrong varchar(10),
	@soluong int, @giaban decimal, @mahieu varchar(10)
)
as
begin
	update sanpham set tensp = @tensp, mausac = @mausac, hinhanh = @hinhanh,
		bonhotrong = @bonhotrong, soluong = @soluong, giaban = @giaban, 
		mahieu = @mahieu where masp = @masp
end
GO
/****** Object:  StoredProcedure [dbo].[sp_CapNhatSoLuongSanPham]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_CapNhatSoLuongSanPham]
(@masp varchar(10), @soluong int)
as
begin
	update sanpham set soluong = @soluong where masp = @masp
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuCacNamGanDay]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuCacNamGanDay]
(@count int)
as
	begin
		declare @CacNamGanDay table (nam int, doanhthu decimal);
		declare @nam int;
		declare @doanhthu decimal;
			

		while @count > 0
			begin
				set @nam = YEAR(DATEADD(year, 1 - @count, CAST(GETDATE() AS date)));

				select @doanhthu = sum(sp.giaban * cthd.soluong)
				from hoadon hd, sanpham sp, chitiethoadon cthd
				where hd.sohd = cthd.sohd and sp.masp = cthd.masp and year(hd.ngayhd) = @nam;

				if(@doanhthu is null)
					begin
						insert into @CacNamGanDay(nam, doanhthu) values (@nam, 0);
					end
				else
					begin
						insert into @CacNamGanDay(nam, doanhthu) values (@nam, @doanhthu);
					end

				set @count = @count - 1;
			end

		select * from @CacNamGanDay
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuCacNgayTrongThang]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuCacNgayTrongThang]
(@thang int, @nam int)
as
	begin
		select day(hd.ngayhd) as 'ngay', sum(sp.giaban * cthd.soluong) as 'doanhthu'
		from hoadon hd, sanpham sp, chitiethoadon cthd
		where hd.sohd = cthd.sohd and sp.masp = cthd.masp and MONTH(hd.ngayhd) = @thang and YEAR(hd.ngayhd) = @nam
		group by day(hd.ngayhd)
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuCacNgayTrongTuan]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuCacNgayTrongTuan]
(@ngay datetime)
as
begin
	declare @CacNgayTrongTuan table (thu int, doanhthu decimal);
	declare @doanhthu decimal;
	declare @loop_before int;
	declare @loop_after int;
		
	--L???y ra doanh thu c???a @ngay
	select @doanhthu = sum(sp.giaban * cthd.soluong)
	from hoadon hd, sanpham sp, chitiethoadon cthd
	where 
		hd.sohd = cthd.sohd and 
		sp.masp = cthd.masp and 
		DAY(hd.ngayhd) = DAY(@ngay) and 
		MONTH(hd.ngayhd) = MONTH(@ngay) and 
		YEAR(hd.ngayhd) = YEAR(@ngay)

	if(DATEPART(dw,@ngay) = 1)
		begin
			set @loop_before = 6;
			set @loop_after = 0;
		end
	else
		begin
			set @loop_before = DATEPART(dw,@ngay) - 2;
			set @loop_after = 7 - DATEPART(dw,@ngay) + 1;
		end
		

	declare @ngayxet datetime;
	set @ngayxet = @ngay
	declare @doanhthuxet decimal;
	while @loop_before != 0
		begin
			set @ngayxet = DATEADD(day, -1, CAST(@ngayxet AS date));

				
			select @doanhthuxet = sum(sp.giaban * cthd.soluong)
			from hoadon hd, sanpham sp, chitiethoadon cthd
			where 
				hd.sohd = cthd.sohd and 
				sp.masp = cthd.masp and 
				DAY(hd.ngayhd) = DAY(@ngayxet) and 
				MONTH(hd.ngayhd) = MONTH(@ngayxet) and 
				YEAR(hd.ngayhd) = YEAR(@ngayxet)

			if(@doanhthuxet is null)
			begin
				set @doanhthuxet = 0
			end

			insert into @CacNgayTrongTuan(thu, doanhthu) 
			values(DATEPART(dw,@ngayxet), @doanhthuxet);

			set @loop_before = @loop_before -1;

		end
		
		
	if(@doanhthu is null)
		begin
			insert into @CacNgayTrongTuan(thu, doanhthu) values(DATEPART(dw,@ngay), 0);
		end
	else
		begin
			insert into @CacNgayTrongTuan(thu, doanhthu) values(DATEPART(dw,@ngay), @doanhthu);
		end

	set @ngayxet = @ngay
	while @loop_after != 0
		begin
			set @ngayxet = DATEADD(day, 1, CAST(@ngayxet AS date));

				
			select @doanhthuxet = sum(sp.giaban * cthd.soluong)
			from hoadon hd, sanpham sp, chitiethoadon cthd
			where 
				hd.sohd = cthd.sohd and 
				sp.masp = cthd.masp and 
				DAY(hd.ngayhd) = DAY(@ngayxet) and 
				MONTH(hd.ngayhd) = MONTH(@ngayxet) and 
				YEAR(hd.ngayhd) = YEAR(@ngayxet)

			if(@doanhthuxet is null)
			begin
				set @doanhthuxet = 0
			end

			insert into @CacNgayTrongTuan(thu, doanhthu) values(DATEPART(dw,@ngayxet), @doanhthuxet);

			set @loop_after = @loop_after - 1;
		end

	select * from @CacNgayTrongTuan order by thu;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuCacQuyTrongNam]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuCacQuyTrongNam]
(@nam int)
as
	begin
		declare @CacQuyTrongNam table (quy int, doanhthu decimal);
		declare @quy int;
		declare @doanhthu decimal;

		set @quy = 1;

		while @quy <= 4
			begin
				select @doanhthu = sum(sp.giaban * cthd.soluong)
				from hoadon hd, sanpham sp, chitiethoadon cthd
				where hd.sohd = cthd.sohd and sp.masp = cthd.masp  and datepart(quarter,hd.ngayhd) = @quy and YEAR(hd.ngayhd) = @nam
				group by datepart(quarter,hd.ngayhd)

				if(@doanhthu is null)
					begin
						insert into @CacQuyTrongNam(quy, doanhthu) values (@quy, 0);
					end
				else
					begin
						insert into @CacQuyTrongNam(quy, doanhthu) values (@quy, @doanhthu);
					end

				set @quy = @quy + 1;
			end

		select * from @CacQuyTrongNam
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuCacThangTrongNam]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuCacThangTrongNam]
(@nam int)
as
	begin
		declare @CacThangTrongNam table (thang int, doanhthu decimal);
		declare @thang int;
		declare @doanhthu decimal;

		set @thang = 1;

		while @thang <= 12
			begin
				select @doanhthu = sum(sp.giaban * cthd.soluong)
				from hoadon hd, sanpham sp, chitiethoadon cthd
				where hd.sohd = cthd.sohd and sp.masp = cthd.masp and month(hd.ngayhd) = @thang and YEAR(hd.ngayhd) = @nam
				group by month(hd.ngayhd)

				if(@doanhthu is null)
					begin
						insert into @CacThangTrongNam(thang, doanhthu) values (@thang, 0);
					end
				else
					begin
						insert into @CacThangTrongNam(thang, doanhthu) values (@thang, @doanhthu);
					end

				set @thang = @thang + 1;
			end

		select * from @CacThangTrongNam
	end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuCuaNam]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuCuaNam]
(@nam int)
as
begin
	declare @doanhthu decimal;
	
	select @doanhthu = sum(sp.giaban * cthd.soluong)
	from hoadon hd, sanpham sp, chitiethoadon cthd
	where 
		hd.sohd = cthd.sohd and 
		sp.masp = cthd.masp and 
		YEAR(hd.ngayhd) = @nam

	return @doanhthu
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuCuaNgay]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuCuaNgay]
(@ngay int, @thang int, @nam int)
as
begin
	declare @doanhthu decimal;
	
	select @doanhthu = sum(sp.giaban * cthd.soluong)
	from hoadon hd, sanpham sp, chitiethoadon cthd
	where 
		hd.sohd = cthd.sohd and 
		sp.masp = cthd.masp and 
		DAY(hd.ngayhd) = @ngay and 
		MONTH(hd.ngayhd) = @thang and 
		YEAR(hd.ngayhd) = @nam

	return @doanhthu
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuCuaThang]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuCuaThang]
(@thang int, @nam int)
as
begin
	declare @doanhthu decimal;
	
	select @doanhthu = sum(sp.giaban * cthd.soluong)
	from hoadon hd, sanpham sp, chitiethoadon cthd
	where 
		hd.sohd = cthd.sohd and 
		sp.masp = cthd.masp and 
		MONTH(hd.ngayhd) = @thang and 
		YEAR(hd.ngayhd) = @nam

	return @doanhthu
end
GO
/****** Object:  StoredProcedure [dbo].[sp_DoanhThuTrongNgay]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_DoanhThuTrongNgay]
(@ngay datetime)
as
begin
	declare @doanhthu decimal;

	set @doanhthu = [dbo].[func_DoanhThuTrongNgay](@ngay);

	select @ngay, @doanhthu;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayKhachHangTheoMaKH]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------l???y kh??ch h??ng theo m??
----------------------
create proc [dbo].[sp_LayKhachHangTheoMaKH]
(@makh varchar(10))
as
begin
	select * from khachhang where makh = @makh
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayNhanVienTheoMaNV]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------l???y nh??n vi??n m?? nh??n vi??n
----------------------
create proc [dbo].[sp_LayNhanVienTheoMaNV]
(@manv varchar(10))
as
begin
	select * from nhanvien where manv = @manv
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayNhaSanXuatTheoMaNSX]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayNhaSanXuatTheoMaNSX]
(@mansx varchar(10))
as
begin
	select * from nhasanxuat where mansx = @mansx
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaChiTietHoaDonCuaHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayTatCaChiTietHoaDonCuaHoaDon]
(@sohd varchar(10))
as
begin
	select masp, soluong from chitiethoadon where sohd = @sohd
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayTatCaHoaDon]
as
begin
	select * from hoadon
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaHoaDonTheoSoHD]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_LayTatCaHoaDonTheoSoHD]
(@sohd varchar(10))
as
begin
	select * from hoadon where sohd = @sohd
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaKhachHang]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------l???y t???t c??? kh??ch h??ng
----------------------
create proc [dbo].[sp_LayTatCaKhachHang]
as
begin
	select * from khachhang
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaNhanVien]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------l???y t???t c??? nh??n vi??n
----------------------
create proc [dbo].[sp_LayTatCaNhanVien]
as
begin
	select * from nhanvien
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaNhaSanXuat]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayTatCaNhaSanXuat]
as
begin
	select * from nhasanxuat
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaSanPham]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayTatCaSanPham]
as
begin
	select masp, tensp, mausac, bonhotrong, soluong, giaban, hinhanh, mansx from sanpham 
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaSanPhamTheoMa]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayTatCaSanPhamTheoMa]
(@ma varchar(10))
as
begin
	select masp, tensp, mausac, bonhotrong, soluong, giaban, hinhanh, mansx from sanpham where masp = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaSanPhamTheoMaNSX]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayTatCaSanPhamTheoMaNSX]
(@ma varchar(10))
as
begin
	select masp, tensp, mausac, bonhotrong, soluong, giaban, hinhanh, mansx from sanpham where mansx = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTatCaSanPhamTheoTen]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayTatCaSanPhamTheoTen]
(@ten nvarchar(100))
as
begin
	select masp, tensp, mausac, bonhotrong, soluong, giaban, hinhanh, mansx from sanpham where tensp = @ten
end
GO
/****** Object:  StoredProcedure [dbo].[sp_LayTonKhoCuaSanPham]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_LayTonKhoCuaSanPham]
(@ma varchar(10))
as
begin
	select soluong from sanpham where masp = @ma
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SoLuongSanPhamDaHet]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_SoLuongSanPhamDaHet]
as
begin
	select count(masp) from sanpham where soluong = 0
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemChiTietHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemChiTietHoaDon]
(@sohd varchar(10), @masp varchar(10), @soluong int)
as
begin
	insert into chitiethoadon(sohd, masp, soluong) 
	values (@sohd, @masp, @soluong)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemHoaDon]
(@sohd varchar(10), @ngayhd datetime, @manv varchar(10), @makh varchar(10))
as
begin
	insert into hoadon (sohd, ngayhd, manv, makh)
	values (@sohd, @ngayhd, @manv, @makh)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemKhachHang]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------th??m kh??ch h??ng
----------------------
create proc [dbo].[sp_ThemKhachHang]
(@makh varchar(10), @tenkh nvarchar(50), @diachi nvarchar(100), @sdt varchar(10))
as
begin
	insert into khachhang(makh, tenkh, diachi, sdt)
	values (@makh, @tenkh, @diachi, @sdt)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhanVien]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------th??m nh??n vi??n
----------------------
create proc [dbo].[sp_ThemNhanVien]
(@manv varchar(10), @tennv nvarchar(50), @matkhau varchar(20), @quyen int)
as
begin
	insert into nhanvien(manv, tennv, matkhau, quyen)
	values (@manv, @tennv, @matkhau, @quyen)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemNhaSanXuat]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemNhaSanXuat]
(@mansx varchar(10), @tennsx varchar(50))
as
begin
	insert into nhasanxuat(mansx, tennsx)
	values  (@mansx, @tennsx)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_ThemSanPham]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_ThemSanPham]
(
	@masp varchar(10), @tensp nvarchar(100), @hinhanh varchar(100),
	@mausac nvarchar(50), @bonhotrong varchar(10),
	@soluong int, @giaban decimal, @mahieu varchar(10)
)
as
begin
	insert into sanpham(masp, tensp, hinhanh, mausac, bonhotrong, soluong, giaban, mahieu)
	values (@masp, @tensp, @hinhanh, @mausac, @bonhotrong, @soluong, @giaban, @mahieu)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemKhachHangTheoDiaChi]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------t??m kh??ch h??ng theo ?????a ch???
----------------------
create proc [dbo].[sp_TimKiemKhachHangTheoDiaChi]
(@diachi varchar(100))
as
begin
	select * from khachhang where diachi like '%' + @diachi + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemKhachHangTheoMa]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------t??m kh??ch h??ng theo m??
----------------------
create proc [dbo].[sp_TimKiemKhachHangTheoMa]
(@ma varchar(10))
as
begin
	select * from khachhang where makh like '%' + @ma + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemKhachHangTheoSDT]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_TimKiemKhachHangTheoSDT]
(@sdt varchar(10))
as
begin
	select * from khachhang where sdt like '%' + @sdt + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemKhachHangTheoTen]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------t??m ki???m kh??ch h??ng theo t??n
----------------------
create proc [dbo].[sp_TimKiemKhachHangTheoTen]
(@ten nvarchar(100))
as
begin
	select * from khachhang where tenkh like '%' + @ten + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemNhanVienTheoMa]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------t??m ki???m nh??n vi??n theo m??
----------------------
create proc [dbo].[sp_TimKiemNhanVienTheoMa]
(@ma varchar(10))
as
begin
	select * from nhanvien where manv like '%' + @ma + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemNhanVienTheoTen]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------t??m ki???m nh??n vi??n theo t??n
----------------------
create proc [dbo].[sp_TimKiemNhanVienTheoTen]
(@ten nvarchar(100))
as
begin
	select * from nhanvien where tennv like '%' + @ten + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemNhaSanXuatTheoMa]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TimKiemNhaSanXuatTheoMa]
(@ma varchar(10))
as
begin
	select * from nhasanxuat where mansx like '%' + @ma + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemNhaSanXuatTheoTen]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TimKiemNhaSanXuatTheoTen]
(@tennsx varchar(50))
as
begin
	select * from nhasanxuat where tennsx like '%' + @tennsx + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemSanPhamTheoMa]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_TimKiemSanPhamTheoMa]
(@ma varchar(10))
as
begin
	select * from sanpham where masp like '%' + @ma + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_TimKiemSanPhamTheoTen]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_TimKiemSanPhamTheoTen]
(@ten varchar(100))
as
begin
	select * from sanpham where tensp like '%' + @ten + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaChiTietHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaChiTietHoaDon]
(@sohd varchar(10), @masp varchar(10))
as
begin
	delete from chitiethoadon
	where sohd = @sohd and masp = @masp
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaHoaDon]
(@sohd varchar(10))
as
begin
	delete from hoadon where sohd = @sohd
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaNhaSanXuat]]   Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaNhaSanXuat]
(@mansx varchar(10))
as
begin
	delete from nhasanxuat where mansx = @mansx
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaKhachHang]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------xo?? kh??ch h??ng
----------------------
create proc [dbo].[sp_XoaKhachHang]
(@makh varchar(10))
as
begin
	delete from khachhang where makh = @makh
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaNhanVien]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------
--------------xo?? nh??n vi??n
----------------------
create proc [dbo].[sp_XoaNhanVien]
(@manv varchar(10))
as
begin
	delete from nhanvien where manv = @manv
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaSanPham]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaSanPham]
(
	@masp varchar(10)
)
as
begin
	delete from sanpham where masp = @masp
end
GO
/****** Object:  StoredProcedure [dbo].[sp_XoaTatCaChiTietHoaDonCuaHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_XoaTatCaChiTietHoaDonCuaHoaDon]
(@sohd varchar(10))
as
begin
	delete from chitiethoadon where sohd = @sohd
end
GO
/****** Object:  Trigger [dbo].[tr_CapNhatSoLuongSanPhamKhiCapNhatChiTietHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_CapNhatSoLuongSanPhamKhiCapNhatChiTietHoaDon]
on [dbo].[chitiethoadon]
instead of update
as 
begin
	declare @masp_i varchar(10);
	declare @sohd_i varchar(10);
	declare @masp_d varchar(10);
	declare @sohd_d varchar(10);
	declare @soluong_i int;
	declare @soluong_d int;

	select @masp_i = masp, @sohd_i = sohd, @soluong_i = soluong
	from inserted 

	select @masp_d = masp, @sohd_d = sohd, @soluong_d = soluong
	from deleted 
	if(@soluong_i>0)
		begin
			declare @soluong_sp int;

			select @soluong_sp = soluong
			from sanpham 
			where masp = @masp_i

			set @soluong_sp = @soluong_sp + @soluong_d - @soluong_i;

			if(@soluong_sp > 0)
				begin
					update sanpham set soluong = @soluong_sp where masp = @masp_i;
					update chitiethoadon set soluong = @soluong_i where sohd = @sohd_i and masp = @masp_i;
				end
		end
end
GO
ALTER TABLE [dbo].[chitiethoadon] ENABLE TRIGGER [tr_CapNhatSoLuongSanPhamKhiCapNhatChiTietHoaDon]
GO
/****** Object:  Trigger [dbo].[tr_CapNhatSoLuongSanPhamKhiThemChiTietHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_CapNhatSoLuongSanPhamKhiThemChiTietHoaDon]
on [dbo].[chitiethoadon]
instead of insert
as 
begin
	declare @masp_i varchar(10);
	declare @sohd_i varchar(10);
	declare @soluong_i int;

	select @masp_i = masp, @sohd_i = sohd, @soluong_i = soluong
	from inserted 

	declare @soluong_sp int;

	select @soluong_sp = soluong
	from sanpham 
	where masp = @masp_i
	if(@soluong_i > 0)
		begin
			declare @soluong_sp_moi int;
			set @soluong_sp_moi = @soluong_sp - @soluong_i;

			if(@soluong_sp_moi >= 0)
				begin
					update sanpham set soluong = @soluong_sp_moi where masp = @masp_i;
					if((select count(sohd) from chitiethoadon 
					where sohd = @sohd_i and masp = @masp_i) > 0)
						begin
							declare @soluong_sp_cthd int;

							select @soluong_sp_cthd = soluong
							from chitiethoadon
							where sohd = @sohd_i and masp = @masp_i
					
							set @soluong_sp_cthd = @soluong_i + @soluong_sp_cthd;
							
							update chitiethoadon set soluong = @soluong_sp_cthd where sohd = @sohd_i and masp = @masp_i;
						end
					else
						begin
							insert into chitiethoadon(sohd, masp, soluong) 
							values (@sohd_i, @masp_i, @soluong_i);
						end
				end
		end
end
GO
ALTER TABLE [dbo].[chitiethoadon] ENABLE TRIGGER [tr_CapNhatSoLuongSanPhamKhiThemChiTietHoaDon]
GO
/****** Object:  Trigger [dbo].[tr_CapNhatSoLuongSanPhamKhiXoaChiTietHoaDon]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_CapNhatSoLuongSanPhamKhiXoaChiTietHoaDon]
on [dbo].[chitiethoadon]
for delete
as 
begin
	declare @masp_d varchar(10);
	declare @sohd_d varchar(10);
	declare @soluong_d int;

	select @masp_d = masp, @sohd_d = sohd, @soluong_d = soluong
	from deleted 

	declare @soluong_sp int;

	select @soluong_sp = soluong
	from sanpham 
	where masp = @masp_d

	declare @soluong_sp_moi int;
	set @soluong_sp_moi = @soluong_sp + @soluong_d;

	update sanpham set soluong = @soluong_sp_moi where masp = @masp_d;
end
GO
ALTER TABLE [dbo].[chitiethoadon] ENABLE TRIGGER [tr_CapNhatSoLuongSanPhamKhiXoaChiTietHoaDon]
GO
/****** Object:  Trigger [dbo].[tr_KiemTraHangTonKhiSuaCTHD]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_KiemTraHangTonKhiSuaCTHD]
on [dbo].[chitiethoadon]
for update
as
begin
	declare @masp_i varchar(10);
	declare @soluong_i int;
	declare @sohd_i varchar(10);

	select @masp_i = masp, @soluong_i = soluong, @sohd_i = sohd
	from inserted

	declare @masp_d varchar(10);
	declare @soluong_d int;
	declare @sohd_d varchar(10);

	select @masp_d = masp, @soluong_d = soluong, @sohd_d = sohd
	from deleted

	declare @tonkho_cu int;

	select @tonkho_cu = soluong
	from sanpham
	where masp = @masp_i

	declare @tonkho_moi int;

	set @tonkho_moi = @tonkho_cu - @soluong_i + @soluong_d;
	if(@tonkho_moi <0 )
	begin
		print N's???n ph???m ???? h???t';
		rollback tran;
	end
end
GO
ALTER TABLE [dbo].[chitiethoadon] ENABLE TRIGGER [tr_KiemTraHangTonKhiSuaCTHD]
GO
/****** Object:  Trigger [dbo].[tr_KiemTraHangTonKhiThemCTHD]    Script Date: 12/29/2021 6:36:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_KiemTraHangTonKhiThemCTHD]
on [dbo].[chitiethoadon]
for insert
as
begin
	declare @masp_i varchar(10);
	declare @soluong_i int;
	declare @sohd_i varchar(10);

	select @masp_i = masp, @soluong_i = soluong, @sohd_i = sohd
	from inserted

	declare @tonkho_cu int;

	select @tonkho_cu = soluong
	from sanpham
	where masp = @masp_i

	declare @tonkho_moi int;

	set @tonkho_moi = @tonkho_cu - @soluong_i;
	if(@tonkho_moi <0 )
	begin
		print N's???n ph???m ???? h???t';
		rollback tran;
	end
end
GO
ALTER TABLE [dbo].[chitiethoadon] ENABLE TRIGGER [tr_KiemTraHangTonKhiThemCTHD]
GO
/****** Object:  Trigger [dbo].[tr_KiemTraNgayHDKhiCapNhat]    Script Date: 12/29/2021 6:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_KiemTraNgayHDKhiCapNhat]
on [dbo].[hoadon]
for update
as
begin
	declare @ngay_i datetime;

	select @ngay_i = ngayhd 
	from inserted

	if(@ngay_i>getdate())
		begin
			rollback tran
		end
end
GO
ALTER TABLE [dbo].[hoadon] ENABLE TRIGGER [tr_KiemTraNgayHDKhiCapNhat]
GO
/****** Object:  Trigger [dbo].[tr_KiemTraGiaBanSanPhanKhiCapNhat]    Script Date: 12/29/2021 6:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_KiemTraGiaBanSanPhanKhiCapNhat]
on [dbo].[sanpham]
for update
as
begin
	if((select giaban from inserted) <0)
		begin
			rollback tran;
		end
end
GO
ALTER TABLE [dbo].[sanpham] ENABLE TRIGGER [tr_KiemTraGiaBanSanPhanKhiCapNhat]
GO
/****** Object:  Trigger [dbo].[tr_KiemTraGiaBanSanPhanKhiThem]    Script Date: 12/29/2021 6:36:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[tr_KiemTraGiaBanSanPhanKhiThem]
on [dbo].[sanpham]
for insert
as
begin
	if((select giaban from inserted) <0)
		begin
			rollback tran;
		end
end
GO
ALTER TABLE [dbo].[sanpham] ENABLE TRIGGER [tr_KiemTraGiaBanSanPhanKhiThem]
GO
