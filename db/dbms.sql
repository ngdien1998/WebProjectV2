-- Constraint nhập liệu cho trường [Loai] trong bảng [Anh]
ALTER TABLE Anh
ADD CONSTRAINT CK_LOAI_MONAN CHECK (Loai IN ('monan', 'thucdon'))

-- Constraint nhập liệu cho trường [Loai] trong bảng [BinhLuan]
ALTER TABLE BinhLuan
ADD CONSTRAINT CK_LOAI_BINHLUAN CHECK (Loai IN ('monan', 'baiviet'))

-- Constraint thiết lập giá trị mặc định cho cột [MoTa], [NgayThem], [PhanTRamKhuyenMai] bảng [MonAn]
ALTER TABLE MonAn
ADD CONSTRAINT DF_MOTA_MONAN DEFAULT N'Chưa có mô tả' FOR MoTa,
	CONSTRAINT DF_NGAYTHEM DEFAULT GETDATE() FOR NgayThem,
	CONSTRAINT DF_PHANTRAMKHUYENMAI DEFAULT 0 FOR PhanTramKhuyenMai

-- Constraint thiết lập giá trị mặc định cho cột [MoTa] bảng [LoaiMon]
ALTER TABLE LoaiMon
ADD CONSTRAINT DF_MOTA_LOAIMON DEFAULT N'Chưa có mô tả' FOR MoTa

-- Constraint thiết lập giá trị mặc định cho cột [MoTa] bảng [ThucDon]
ALTER TABLE ThucDon
ADD CONSTRAINT DF_MOTA_THUCDON DEFAULT N'Chưa có mô tả' FOR MoTa,
	CONSTRAINT DF_THU_THUCDON DEFAULT -1 FOR Thu

-- Constraint thiết lập giá trị mặc định cho cột [MoTa] bảng [LoaiBaiViet]
ALTER TABLE LoaiBaiViet
ADD CONSTRAINT DF_MOTA_LOAIBAIVIET DEFAULT N'Chưa có mô tả' FOR MoTa

-- Constraint thiết lập giá trị mặc định cho cột [MoTa] bảng [BaiViet]
ALTER TABLE BaiViet
ADD CONSTRAINT DF_MOTA_BAIVIET DEFAULT N'Chưa có mô tả' FOR MoTa

-- Constraint thiết lập giá trị mặc định cho cột [MoTa] bảng [PhanQuyen]
ALTER TABLE PhanQuyen
ADD CONSTRAINT DF_MOTA_PHANQUYEN DEFAULT N'Chưa có mô tả' FOR MoTa
GO

-- Hàm mã hóa MD5
CREATE FUNCTION MD5Hash(@text VARCHAR(50)) RETURNS NVARCHAR(32) AS
BEGIN
	DECLARE @res VARCHAR(32)
	SELECT @res = CONVERT(VARCHAR(32), HashBytes('MD5', @text), 2)
	RETURN @res
END
GO

-- View lấy danh sách người dùng
CREATE VIEW LayDanhSachNguoiDung
AS SELECT * FROM NguoiDung
GO

-- Stored thêm người dùng mới
CREATE PROC ThemNguoiDung
(
	@email NVARCHAR(50),
	@matkhau NVARCHAR(50),
	@hodem NVARCHAR(50),
	@ten NVARCHAR(50),
	@ngaysinh DATE,
	@nu BIT,
	@avatar NVARCHAR(100),
	@dienthoai VARCHAR(50),
	@diachi NVARCHAR(256),
	@laqtv BIT,
	@kichhoat BIT
)
AS BEGIN
	SET NOCOUNT ON
	INSERT INTO NguoiDung 
	VALUES (@email, @matkhau, @hodem, @ten, @ngaysinh, @nu, @avatar, @dienthoai, @diachi, @laqtv, @kichhoat)
	RETURN @@ROWCOUNT
END

---------------------------------------------------------------------------------------------------------

-- View lấy danh sách ảnh
CREATE VIEW LayDanhSachAnh
AS SELECT * FROM Anh
GO

-- Proc thêm một ảnh mới
CREATE PROC ThemAnh
(
	@ID_DanhMucLienQuan INT,
	@Loai VARCHAR(50),
	@TenAnh NVARCHAR(100),
	@URL NVARCHAR(MAX)
)
AS
BEGIN
	IF((SELECT COUNT(*) FROM Anh WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai) > 0)
	BEGIN
		RAISERROR(N'Ảnh đã tồn tại',16,1)
		RETURN
	END
	ELSE
		INSERT INTO Anh VALUES(@ID_DanhMucLienQuan, @Loai, @TenAnh, @URL)
	SELECT * FROM Anh WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai
END
GO


-- Proc xóa một ảnh
CREATE PROC XoaAnh(@ID_DanhMucLienQuan INT, @Loai VARCHAR(50))
AS
BEGIN
	DECLARE @tblAnh TABLE(ID_DanhMucLienQuan INT,
							Loai VARCHAR(50),
							TenAnh NVARCHAR(100),
							URL NVARCHAR(MAX)
						)
	IF((SELECT COUNT(*) FROM Anh WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai) = 0)
		BEGIN
			RAISERROR(N'Không tồn tại ảnh',16,1)
			RETURN
		END
	ELSE
		BEGIN
			INSERT INTO @tblAnh SELECT * FROM Anh WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai
	
			DELETE FROM Anh WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai
		END
	SELECT * FROM @tblAnh
END
GO

-- Proc sửa một ảnh
CREATE PROC SuaAnh (@ID_DanhMucLienQuan INT, @Loai VARCHAR(50) = NULL, @TenAnh NVARCHAR(100) = NULL, @URL NVARCHAR(MAX) = NULL)
AS
BEGIN
	DECLARE @tblAnh TABLE(ID_DanhMucLienQuan INT,
							Loai VARCHAR(50),
							TenAnh NVARCHAR(100),
							URL NVARCHAR(MAX)
						)

	IF((SELECT COUNT(*) FROM Anh WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai) = 0)
		BEGIN
			RAISERROR(N'Không tồn tại ảnh',16,1)
			RETURN
		END
	ELSE
		BEGIN
			INSERT INTO @tblAnh SELECT * FROM Anh WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai
			IF(@Loai IS NULL)
				SET @Loai = (SELECT Loai FROM @tblAnh)
			IF(@TenAnh IS NULL)
				SET @TenAnh = (SELECT TenAnh FROM @tblAnh)
			IF(@URL IS NULL)
				SET @URL = (SELECT URL FROM @tblAnh)

			UPDATE Anh 
			SET ID_DanhMucLienQuan = @ID_DanhMucLienQuan,
				Loai = @Loai,
				TenAnh = @TenAnh,
				Url = @URL
			WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai 
		END

	SELECT * FROM Anh WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai
END
GO

-----------------------------------------------------------------------------------------------

-- View Danh Sách Bài Viết
CREATE VIEW DanhSachBaiViet
AS
	SELECT * FROM BaiViet
GO

-- Proc Thêm Bài Viết
CREATE PROC ThemBaiViet (@TenBaiViet NVARCHAR(100),
						 @MoTa NVARCHAR(256),
						 @NoiDung NTEXT,
						 @NgayViet DATETIME,
						 @Email VARCHAR(50),
						 @IDLoaiBaiViet INT)
AS
BEGIN
	DECLARE @tblIDBaiViet TABLE (IDBaiViet INT)
	INSERT INTO BaiViet OUTPUT inserted.IDBaiViet INTO @tblIDBaiViet
	VALUES(@TenBaiViet, @MoTa, @NoiDung, @NgayViet, @Email, @IDLoaiBaiViet)
	SELECT * FROM BaiViet WHERE IDBaiViet = (SELECT IDBaiViet FROM @tblIDBaiViet)
	-- ID Bài viết luôn tự tăng nên không check tồn tại được
END
GO


-- Proc Xóa Bài Viết
CREATE PROC XoaBaiViet(@IDBaiViet INT)
AS
BEGIN
	DECLARE @tblBaiViet TABLE (IDBaiViet INT,
								 TenBaiViet NVARCHAR(100),
								 MoTa NVARCHAR(256),
								 NoiDung NTEXT,
								 NgayViet DATETIME,
								 Email VARCHAR(50),
								 IDLoaiBaiViet INT)
	IF((SELECT IDBaiViet FROM BaiViet WHERE IDBaiViet = @IDBaiViet) > 0)
	BEGIN
		INSERT INTO @tblBaiViet SELECT * FROM BaiViet WHERE IDBaiViet = @IDBaiViet
		DELETE FROM BaiViet WHERE IDBaiViet = @IDBaiViet
	END
	ELSE
	BEGIN
		RAISERROR(N'Không tồn tại bài viết',16,1);
		RETURN
	END
	SELECT * FROM @tblBaiViet
END
GO

-- Proc Sửa Bài Viết
CREATE PROC SuaBaiViet(@IDBaiViet INT,
						 @TenBaiViet NVARCHAR(100) = NULL,
						 @MoTa NVARCHAR(256) = NULL,
						 @NoiDung NTEXT = NULL,
						 @NgayViet DATETIME = NULL, 
						 @Email VARCHAR(50) = NULL,
						 @IDLoaiBaiViet INT = NULL)
AS
BEGIN
	DECLARE @tblBaiViet TABLE (IDBaiViet INT,
								 TenBaiViet NVARCHAR(100),
								 MoTa NVARCHAR(256),
								 NoiDung NTEXT,
								 NgayViet DATETIME,
								 Email VARCHAR(50),
								 IDLoaiBaiViet INT)
	IF((SELECT COUNT(*) FROM BaiViet WHERE IDBaiViet = @IDBaiViet) = 0)								 
	BEGIN
		RAISERROR(N'Bài viết không tồn tại',16,1);
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO @tblBaiViet SELECT * FROM BaiViet WHERE IDBaiViet = @IDBaiViet
		IF(@TenBaiViet IS NULL)
			SET @TenBaiViet = (SELECT TenBaiViet FROM @tblBaiViet)
		IF(@MoTa IS NULL)
			SET @MoTa = (SELECT MoTa FROM @tblBaiViet)
		IF(@NoiDung IS NULL)
			SET @NoiDung = (SELECT NoiDung FROM @tblBaiViet)
		IF(@NgayViet IS NULL)
			SET @NgayViet  = (SELECT NgayViet FROM @tblBaiViet)
		IF(@Email IS NULL)
			SET @Email = (SELECT Email FROM @tblBaiViet)
		IF(@IDLoaiBaiViet IS NULL)
			SET @IDLoaiBaiViet = (SELECT IDLoaiBaiViet FROM @tblBaiViet)
		UPDATE BaiViet 
		SET IDBaiViet = @IDBaiViet,
			TenBaiViet = @TenBaiViet,
			MoTa = @MoTa,
			NoiDung = @NoiDung,
			NgayViet = @NgayViet,
			Email = @Email,
			IDLoaiBaiViet = @IDLoaiBaiViet
	END
	SELECT * FROM BaiViet WHERE IDBaiViet = @IDBaiViet
END

---------------------------------------------------------------------------------------------------------------

-- View Tất Cả Bình Luận
CREATE VIEW TatCaBinhLuan 
AS 
	SELECT * FROM BinhLuan
GO


-- Proc Thêm Bình Luận
CREATE PROC ThemBinhLuan(@ID_DanhMucLienQuan INT, @Loai VARCHAR(20), @ThoiGian DATETIME, @NoiDung NVARCHAR(500), @Email VARCHAR(50))
AS
BEGIN
	-- Một người có thể thêm nhiều bình luận ==> Không cần check tồn tại rồi
	INSERT INTO BinhLuan VALUES(@ID_DanhMucLienQuan, @Loai, @ThoiGian, @NoiDung, @Email);
	SELECT * FROM BinhLuan WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai
END
GO


-- Proc Xóa Bình Luận
CREATE PROC XoaBinhLuan(@ID_DanhMucLienQuan INT)
AS
BEGIN
	DECLARE @tblBinhLuan TABLE(ID_DanhMucLienQuan INT, Loai VARCHAR(20), ThoiGian DATETIME, NoiDung NVARCHAR(500), Email VARCHAR(50))
	INSERT INTO @tblBinhLuan SELECT * FROM BinhLuan WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan
	DELETE FROM BinhLuan WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan
	SELECT * FROM @tblBinhLuan
END


--- Proc Sửa Bình Luận

CREATE PROC SuaBinhLuan (@ID_DanhMucLienQuan INT,
						 @Loai VARCHAR(20) = NULL,
						 @ThoiGian DATETIME = NULL, 
						 @NoiDung NVARCHAR(500) = NULL, 
						 @Email VARCHAR(50) = NULL)
AS
BEGIN
-- Có cho sửa ID DnahMucLienQuan và Loai khong ========================================================================
	DECLARE @tblBinhLuan TABLE (ID_DanhMucLienQuan INT,
								 Loai VARCHAR(20),
								 ThoiGian DATETIME, 
								 NoiDung NVARCHAR(500), 
								 Email VARCHAR(50))
	INSERT INTO @tblBinhLuan SELECT * FROM BinhLuan WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai
	IF(@Loai IS NULL)
		SET @Loai = (SELECT Loai FROM @tblBinhLuan)
	IF(@ThoiGian IS NULL)
		SET @ThoiGian = (SELECT ThoiGian FROM @tblBinhLuan)
	IF(@NoiDung IS NULL)
		SET @NoiDung = (SELECT NoiDung FROM @tblBinhLuan)
	IF(@Email IS NULL)
		SET @Email = (SELECT Email FROM @tblBinhLuan) 
	UPDATE BinhLuan
	SET 
	SELECT * FROM BinhLuan WHERE ID_DanhMucLienQuan = @ID_DanhMucLienQuan AND Loai = @Loai
END



------------------------------------------------------------------------

-- View Chi Tiết Hóa Đơn
CREATE VIEW ChiTietHoaDon
AS SELECT * FROM ChiTietHoaDon
GO

-- Thêm Chi Tiết Hóa Đơn
CREATE PROC ThemChiTietHoaDon
(
	@IDHoaDon INT,
	@IDMonAn INT,
	@SoLuong INT,
	@DonGia INT
)
AS
BEGIN
	INSERT INTO ChiTietHoaDon 
	VALUES(@IDHoaDon, @IDMonAn, @SoLuong, @DonGia)
	SELECT * FROM ChiTietHoaDon
END

-- Xóa Chi Tiết Hóa Đơn
CREATE PROC XoaChiTietHoaDon
(
	@IDHoaDon INT,
	@IDMonAn INT
)
AS
BEGIN
	DECLARE @tblChiTietHoaDon TABLE
								(
								IDHoaDon INT,
								IDMonAn INT,
								SoLuong INT,
								DonGia INT
								)
	INSERT INTO @tblChiTietHoaDon SELECT * FROM ChiTietHoaDon WHERE IDMonAn = @IDMonAn AND IDHoaDon = @IDHoaDon
	DELETE FROM ChiTietHoaDon WHERE IDMonAn = @IDMonAn AND IDHoaDon = @IDHoaDon
	SELECT * FROM @tblChiTietHoaDon
END

-- Sửa Chi Tiết Hóa Đơn
CREATE PROC SuaChiTietHoaDon
(
	@IDHoaDon INT,
	@IDMonAn INT,
	@SoLuong INT = NULL,
	@DonGia INT = NULL
)
AS
BEGIN
	DECLARE @tblChiTietHoaDon TABLE
							(
							IDHoaDon INT = NULL,
							IDMonAn INT = NULL,
							SoLuong INT = NULL,
							DonGia INT = NULL
							)
	INSERT INTO @tblChiTietHoaDon SELECT * FROM ChiTietHoaDon WHERE IDMonAn = @IDMonAn AND IDHoaDon = @IDHoaDon
	IF(@SoLuong IS NULL)
		SET @SoLuong = (SELECT SoLuong FROM @tblChiTietHoaDon)
	IF(@DonGia IS NULL)
		SET @DonGia = (SELECT DonGia FROM @tblChiTietHoaDon)
	UPDATE ChiTietHoaDon
	SET SoLuong = @SoLuong,
		DonGia = @DonGia
	WHERE IDHoaDon = @IDHoaDon AND IDMonAn = @IDMonAn
	SELECT * FROM ChiTietHoaDon WHERE IDHoaDon = @IDHoaDon AND IDMonAn = @IDMonAn
END

------------------------------------------------------------------------

-- View Đặt Bàn
CREATE VIEW DanhSachDatBan
AS SELECT * FROM DatBan
GO

-- Thêm Mới Đặt Bàn
CREATE PROC ThemMoiDatBan
(
	@Email VARCHAR(50),
	@Ban VARCHAR(50),
	@ThoiGian DATETIME,
	@SoLuongNguoi INT,
	@GiaTien INT,
	@GhiChu NVARCHAR(256)
)
AS
BEGIN
	INSERT INTO DatBan VALUES(@Email, @Ban, @ThoiGian, @SoLuongNguoi, @GiaTien, @GhiChu)
	SELECT * FROM DatBan
END

-- Xóa Đặt Bàn
CREATE PROC XoaDatBan
(
	@Email VARCHAR(50),
	@Ban VARCHAR(50),
	@ThoiGian DATETIME
)
AS
BEGIN
	IF((SELECT * FROM DatBan WHERE Email = @Email AND Ban = @Ban AND ThoiGian = @ThoiGian) > 0)
		BEGIN
			
		END
END
-- Sửa Thông Tin Đặt Bàn

------------------------------------------------------------------------

-- View Hóa Đơn Đặt Hàng

------------------------------------------------------------------------

-- View Loại Bài Viết

create proc ThemBaiViet
(
	@tenbaiviet NVARCHAR(100),
	@mota NVARCHAR(256),
	@noidung NTEXT,
	@ngayviet DATETIME,
	@email VARCHAR(50),
	@idloaibaiviet INT
)
AS BEGIN
	DECLARE @tblTemp TABLE (IdBaiViet INT)
	INSERT INTO BaiViet
	OUTPUT inserted.IDBaiViet INTO @tblTemp
	VALUES (@tenbaiviet,
			@mota,
			@noidung,
			@ngayviet,
			@email,
			@idloaibaiviet)
	SELECT * FROM BaiViet
	WHERE IDBaiViet = (SELECT TOP 1 IDBaiViet FROM @tblTemp)
END
-----------------------------------------------------THINH's ZONE-----------------------------------------------------------------------
--------------------------------LOAI MON---------------------
--view
create view LoaiMonAn
as select * from LoaiMon
go
--thêm
CREATE PROC ThemMoiLoaiMon
(
	@idLoaiMon int,
	@TenLoaiMon nVARCHAR(100),
	@MoTa NVARCHAR(256)
)
AS
BEGIN
	INSERT INTO LoaiMon VALUES(@idLoaiMon, @TenLoaiMon, @MoTa)
	SELECT * FROM LoaiMon
END
--xóa
CREATE PROC XoaLoaiMon(@ID_LoaiMon INT)
AS
BEGIN
	DECLARE @tblLoaiMon TABLE(IdLoaiMon INT, TenLoaiMon NVARCHAR(100), MoTa nVARCHAR(256))
	INSERT INTO @tblLoaiMon SELECT * FROM LoaiMon WHERE IdLoaiMon = @ID_LoaiMon
	DELETE FROM LoaiMon WHERE IdLoaiMon = @ID_LoaiMon
	SELECT * FROM @tblLoaiMon
END
--sửa
CREATE PROC SuaLoaiMon(@IdLoaiMon INT,
						 @TenLoaiMon NVARCHAR(100) = NULL,
						 @MoTa nVARCHAR(256) = NULL)
AS
BEGIN
	DECLARE @tblLoaiMon TABLE (IDLoaiMon INT,
								 TenLoaiMon NVARCHAR(100),
								 MoTa NVARCHAR(256))
	IF((SELECT COUNT(*) FROM LoaiMon WHERE IdLoaiMon = @IdLoaiMon) = 0)								 
	BEGIN
		RAISERROR(N'Loại món không tồn tại',16,1);
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO @tblLoaiMon SELECT * FROM LoaiMon WHERE IdLoaiMon = @IdLoaiMon
		IF(@TenLoaiMon IS NULL)
			SET @TenLoaiMon = (SELECT TenLoaiMon FROM @tblLoaiMon)
		IF(@MoTa IS NULL)
			SET @MoTa = (SELECT MoTa FROM @tblLoaiMon)
		UPDATE LoaiMon 
		SET IdLoaiMon = @IdLoaiMon,
			TenLoaiMon = @TenLoaiMon,
			MoTa = @MoTa
	END
	SELECT * FROM LoaiMon WHERE IdLoaiMon = @IdLoaiMon
END
-------------------------------Mon An----------------
--view
create view ViewMonAn
as select * from MonAn
go
--thêm
CREATE PROC ThemMoiMonAn
(
	@idMonAn int,
	@TenMonAn nvarchar(50),
	@DonViTinh nvarchar(50),
	@MoTa NVARCHAR(256),
	@Gia int,
	@PhanTramKhuyenMai int,
	@NgayThem datetime,
	@idLoaiMonAn int,
	@idThucDon int
)
AS
BEGIN
	INSERT INTO MonAn VALUES(@idMonAn, @TenMonAn, @DonViTinh , @MoTa , @Gia , @PhanTramKhuyenMai , @NgayThem, @idLoaiMonAn , @idThucDon)
	SELECT * FROM MonAn
END
--xóa
CREATE PROC XoaMonAn(@ID_MonAn INT)
AS
BEGIN
	DECLARE @tblMonAn TABLE(IdMonAn int,
	TenMonAn nvarchar(50),
	DonViTinh nvarchar(50),
	MoTa NVARCHAR(256),
	Gia int,
	PhanTramKhuyenMai int,
	NgayThem datetime,
	idLoaiMonAn int,
	idThucDon int)
	INSERT INTO @tblMonAn SELECT * FROM MonAn WHERE IDMonAn = @ID_MonAn
	DELETE FROM LoaiMon WHERE IdLoaiMon = @ID_MonAn
	SELECT * FROM @tblMonAn
END
--sửa
CREATE PROC SuaMonAn(@IdMonAn INT,
						 @TenMonAn NVARCHAR(50) = NULL,
						 @DonViTinh nVARCHAR(50) = NULL,
						 @MoTa nVARCHAR(256) = NULL,
						 @Gia int=null,
						 @PhanTramKhuyenMai int = NULL,
	@NgayThem datetime = NULL,
	@idLoaiMonAn int = NULL,
	@idThucDon int = NULL)
AS
BEGIN
	DECLARE @tblMonAn TABLE (IDMonAn int,
	TenMonAn nvarchar(50),
	DonViTinh nvarchar(50),
	MoTa NVARCHAR(256),
	Gia int,
	PhanTramKhuyenMai int,
	NgayThem datetime,
	idLoaiMonAn int,
	idThucDon int)
	IF((SELECT COUNT(*) FROM MonAn WHERE IDMonAn = @IdMonAn) = 0)								 
	BEGIN
		RAISERROR(N' Món ăn không tồn tại',16,1);
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO @tblMonAn SELECT * FROM MonAn WHERE IDMonAn = @IdMonAn
		IF(@TenMonAn IS NULL)
			SET @TenMonAn = (SELECT TenMonAn FROM @tblMonAn)
		IF(@DonViTinh IS NULL)
			SET @DonViTinh = (SELECT DonViTinh FROM @tblMonAn)
		IF(@MoTa IS NULL)
			SET @MoTa = (SELECT MoTa FROM @tblMonAn)
		IF(@Gia IS NULL)
			SET @Gia = (SELECT Gia FROM @tblMonAn)
		IF(@PhanTramKhuyenMai IS NULL)
			SET @PhanTramKhuyenMai = (SELECT PhanTramKhuyenMai FROM @tblMonAn)
		IF(@NgayThem IS NULL)
			SET @NgayThem = (SELECT NgayThem FROM @tblMonAn)
		IF(@idLoaiMonAn IS NULL)
			SET @idLoaiMonAn = (SELECT idLoaiMonAn FROM @tblMonAn)
		IF(@idThucDon IS NULL)
			SET @idThucDon = (SELECT idThucDon FROM @tblMonAn)
		UPDATE MonAn 
		SET IDMonAn = @IdMonAn,
			TenMonAn = @TenMonAn,
			DonViTinh=@DonViTinh,
			MoTa = @MoTa,
			Gia=@Gia,
			PhanTramKhuyenMai=@PhanTramKhuyenMai,
			NgayThem=@NgayThem,
			IDLoaiMonAn=@idLoaiMonAn,
			IDThucDon=@idThucDon
	END
	SELECT * FROM MonAn WHERE IDMonAn = @IdMonAn
END
--------------------------------Ngiep vu quan tri-------------
--view
create view ViewNghiepVuQT
as select * from NghiepVuQuanTri
go
--thêm
CREATE PROC ThemNVQT
(
	@idNgiepVu varchar(50),
	@TenNghiepVu nvarchar(100)
	
)
AS
BEGIN
	INSERT INTO DatBan VALUES(@idNgiepVu, @TenNghiepVu)
	SELECT * FROM NghiepVuQuanTri
END
--xóa
CREATE PROC XoaNVQT(@idNgiepVu varchar(50))
AS
BEGIN
	DECLARE @tblNVQT TABLE(IDNgiepVu varchar(50),
	TenNghiepVu nvarchar(100))
	INSERT INTO @tblNVQT SELECT * FROM NghiepVuQuanTri WHERE IDNghiepVu = @idNgiepVu
	DELETE FROM NghiepVuQuanTri WHERE IDNghiepVu = @idNgiepVu
	SELECT * FROM @tblNVQT
END
--sửa
CREATE PROC SuaNVQT(@IDNgiepVu varchar(50),
						 @TenNghiepVu NVARCHAR(50) = Null)
AS
BEGIN
	DECLARE @tblNVQT TABLE (IDNghiepVu varchar(50),TenNghiepVu NVARCHAR(50))
	IF((SELECT COUNT(*) FROM NghiepVuQuanTri WHERE IDNghiepVu = @IDNgiepVu) = 0)								 
	BEGIN
		RAISERROR(N'Nghiệp vụ không tồn tại',16,1);
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO @tblNVQT SELECT * FROM NghiepVuQuanTri WHERE IDNghiepVu = @IDNgiepVu
		IF(@TenNghiepVu IS NULL)
			SET @TenNghiepVu = (SELECT TenNghiepVu FROM @tblNVQT)
		
		UPDATE NghiepVuQuanTri
		SET IDNghiepVu = @IDNgiepVu,
			TenNghiepVu = @TenNghiepVu
			
	END
	SELECT * FROM NghiepVuQuanTri WHERE IDNghiepVu = @IDNgiepVu
END
---------------------------------Nguoi dung---------------
--view
create view ViewNguoiDung
as select * from NguoiDung
go
--thêm
CREATE PROC ThemNguoiDung
(
	@Email varchar(50),
	@MatKhau varchar(50),
	@HoDem nvarchar(50),
	@Ten NVARCHAR(256),
	@NgaySinh date,
	@Nu bit,
	@Avatar nvarchar(100),
	@DienThoai varchar(50),
	@DiaChi nvarchar(256),
	@LaQTV bit,
	@KichHoat bit
)
AS
BEGIN
	INSERT INTO NguoiDung VALUES(@idMonAn, @TenMonAn, @DonViTinh , @MoTa , @Gia , @PhanTramKhuyenMai , @NgayThem, @idLoaiMonAn , @idThucDon)
	SELECT * FROM NguoiDung
END
--xóa
CREATE PROC XoaNguoiDung(@Email varchar(50))
AS
BEGIN
	DECLARE @tblNguoiDung TABLE(Email varchar(50),
	MatKhau varchar(50),
	HoDem nvarchar(50),
	Ten NVARCHAR(256),
	NgaySinh date,
	Nu bit,
	Avatar nvarchar(100),
	DienThoai varchar(50),
	DiaChi nvarchar(256),
	LaQTV bit,
	KichHoat bit)
	INSERT INTO @tblNguoiDung SELECT * FROM NguoiDung WHERE Email = @Email
	DELETE FROM NguoiDung WHERE Email = @Email
	SELECT * FROM @tblNguoiDung
END
--sửa
CREATE PROC SuaNguoiDung(@Email varchar(50),
	@MatKhau varchar(50),
	@HoDem nvarchar(50),
	@Ten NVARCHAR(256),
	@NgaySinh date=null,
	@Nu bit=null,
	@Avatar nvarchar(100)=null,
	@DienThoai varchar(50)=null,
	@DiaChi nvarchar(256)=null,
	@LaQTV bit,
	@KichHoat bit)
AS
BEGIN
	DECLARE @tblNguoiDung TABLE(Email varchar(50),
	MatKhau varchar(50),
	HoDem nvarchar(50),
	Ten NVARCHAR(256),
	NgaySinh date,
	Nu bit,
	Avatar nvarchar(100),
	DienThoai varchar(50),
	DiaChi nvarchar(256),
	LaQTV bit,
	KichHoat bit)
	IF((SELECT COUNT(*) FROM NguoiDung WHERE Email = @Email) = 0)								 
	BEGIN
		RAISERROR(N' Người dùng không tồn tại',16,1);
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO @tblNguoiDung SELECT * FROM NguoiDung WHERE Email = @Email
		IF(@MatKhau IS NULL)
			SET @MatKhau = (SELECT MatKhau FROM @tblNguoiDung)
		IF(@HoDem IS NULL)
			SET @HoDem = (SELECT HoDem FROM @tblNguoiDung)
		IF(@Ten IS NULL)
			SET @Ten = (SELECT Ten FROM @tblNguoiDung)
		IF(@NgaySinh IS NULL)
			SET @NgaySinh = (SELECT NgaySinh FROM @tblNguoiDung)
		IF(@Nu IS NULL)
			SET @Nu = (SELECT Nu FROM @tblNguoiDung)
		IF(@Avatar IS NULL)
			SET @Avatar= (SELECT Avatar FROM @tblNguoiDung)
		IF(@DienThoai IS NULL)
			SET @DienThoai = (SELECT DienThoai FROM @tblNguoiDung)
		IF(@DiaChi IS NULL)
			SET @DiaChi = (SELECT DiaChi FROM @tblNguoiDung)
		IF(@LaQTV IS NULL)
			SET @LaQTV = (SELECT LaQTV FROM @tblNguoiDung)
		IF(@KichHoat IS NULL)
			SET @KichHoat = (SELECT KichHoat FROM @tblNguoiDung)
		UPDATE NguoiDung
		SET Email = @Email,
			MatKhau=@MatKhau,
			HoDem = @HoDem,
			Ten=@Ten,
			NgaySinh=@NgaySinh,
			Nu=@Nu,
			Avatar=@Avatar,
			DienThoai=@DienThoai,
			DiaChi=@DiaChi,
			LaQTV=@LaQTV,
			KichHoat=@KichHoat
	END
	SELECT * FROM NguoiDung WHERE Email = @Email
END
----------------------------Phan quyen----------------
--view
create view ViewPhanQuyen
as select * from PhanQuyen
go
--thêm
CREATE PROC ThemPhanQuyen
(
	@Email varchar(50),
	@IDQuyen varchar(50),
	@MoTa nvarchar(50)
	
)
AS
BEGIN
	INSERT INTO PhanQuyen VALUES(@Email, @IDQuyen, @MoTa)
	SELECT * FROM PhanQuyen
END
--xóa
CREATE PROC XoaPhanQuyen(@Email varchar(50), @IDQuyen varchar(50))
AS
BEGIN
	DECLARE @tblPhanQuyen TABLE(Email varchar(50),
	IDQuyen varchar(50), MoTa nvarchar(50))
	INSERT INTO @tblPhanQuyen SELECT * FROM PhanQuyen WHERE Email = @Email and IDQuyen=@IDQuyen
	DELETE FROM PhanQuyen WHERE Email = @Email and IDQuyen=@IDQuyen
	SELECT * FROM @tblPhanQuyen
END
--sửa
CREATE PROC SuaPhanQuyen(@Email varchar(50), @IDQuyen varchar(50), @MoTa nvarchar(50)=null)
AS
BEGIN
	DECLARE @tblPhanQuyen TABLE (Email varchar(50),IDQuyen VARCHAR(50), MoTa NvArChAr(50))
	IF((SELECT COUNT(*) FROM PhanQuyen WHERE Email = @Email and IDQuyen=@IDQuyen) = 0)								 
	BEGIN
		RAISERROR(N' Phân quyền không tồn tại',16,1);
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO @tblPhanQuyen SELECT * FROM PhanQuyen WHERE Email = @Email and IDQuyen=@IDQuyen
		IF(@MoTa IS NULL)
			SET @MoTa = (SELECT MoTa FROM @tblPhanQuyen)
		
		UPDATE PhanQuyen
		SET Email = @Email,
			IDQuyen = @IDQuyen,
			MoTa=@MoTa
	END
	SELECT * FROM PhanQuyen WHERE Email = @Email and IDQuyen=@IDQuyen
END
---------------------------------------Quyen--------------------
--view
create view ViewQuyen
as select * from Quyen
go
--thêm
CREATE PROC ThemQuyen
(
	@IDQuyen varchar(50),
	@TenQuyen nvarchar(50),
	@MoTa nvarchar(50),
	@IDNghiepVu varchar(50)
	
)
AS
BEGIN
	INSERT INTO Quyen VALUES(@IDQuyen,@TenQuyen, @MoTa,@IDNghiepVu)
	SELECT * FROM Quyen
END
--xóa
CREATE PROC XoaQuyen(@IDQuyen varchar(50))
AS
BEGIN
	DECLARE @tblQuyen TABLE(IDQuyen varchar(50),TenQuyen nvarchar(50), MoTa nvarchar(50), IDNghiepVu varchar(50))
	INSERT INTO @tblQuyen SELECT * FROM Quyen WHERE IDQuyen=@IDQuyen
	DELETE FROM Quyen WHERE IDQuyen=@IDQuyen
	SELECT * FROM @tblQuyen
END
--sửa
CREATE PROC SuaQuyen(@IDQuyen varchar(50),
	@TenQuyen nvarchar(50)=null,
	@MoTa nvarchar(50)=null,
	@IDNghiepVu varchar(50)=null)
AS
BEGIN
	DECLARE @tblQuyen TABLE (IDQuyen VARCHAR(50), TenQuyen nvarchar(50),MoTa NvArChAr(50), IDNghiepVu varchar(50))
	IF((SELECT COUNT(*) FROM Quyen WHERE IDQuyen=@IDQuyen) = 0)								 
	BEGIN
		RAISERROR(N' Quyền không tồn tại',16,1);
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO @tblQuyen SELECT * FROM Quyen WHERE IDQuyen=@IDQuyen
		IF(@TenQuyen IS NULL)
			SET @TenQuyen= (SELECT TenQuyen FROM @tblQuyen)
		IF(@MoTa IS NULL)
			SET @MoTa = (SELECT MoTa FROM @tblQuyen)
		IF(@IDQuyen IS NULL)
			SET @IDQuyen = (SELECT IDQuyen FROM @tblQuyen)
		
		UPDATE Quyen
		SET 
			IDQuyen = @IDQuyen,
			TenQuyen=@TenQuyen,
			MoTa=@MoTa,
			IDNghiepVu=@IDNghiepVu
	END
	SELECT * FROM Quyen WHERE IDQuyen=@IDQuyen
END
-------------------------------------Thuc Don------------------------------------------
--view
create view ViewThucDon
as select * from ThucDon
go
--thêm
CREATE PROC ThemThucDon
(
	@IDThucDon int,
	@TenThucDon nvarchar(50),
	@MoTa nvarchar(255),
	@Gia int,
	@PhanTramKhuyenMai int,
	@Thu int
)
AS
BEGIN
	INSERT INTO ThucDon VALUES(@IDThucDon,@TenThucDon,@MoTa,@Gia,@PhanTramKhuyenMai,@Thu)
	SELECT * FROM ThucDon
END
--xóa
CREATE PROC XoaThucDon(@IDThucDon int)
AS
BEGIN
	DECLARE @tblThucDon TABLE(IDThucDon int,TenThucDon nvarchar(50), MoTa nvarchar(255), Gia int, PhanTramKhuyenMai int, Thu int)
	INSERT INTO @tblThucDon SELECT * FROM ThucDon WHERE IDThucDon=@IDThucDon
	DELETE FROM ThucDon WHERE IDThucDon=@IDThucDon
	SELECT * FROM @tblThucDon
END
--sửa
CREATE PROC SuaThucDOn(@IDThucDon int,
	@TenThucDon nvarchar(50)=null,
	@MoTa nvarchar(255)=null,
	@Gia int=null,
	@PhanTramKhuyenMai int=null,
	@Thu int=null)
AS
BEGIN
	DECLARE @tblThucDon TABLE (IDThucDon int, TenThucDon nvarchar(50),MoTa NvArChAr(255), Gia int, PhanTramKhuyenMai int, Thu int)
	IF((SELECT COUNT(*) FROM ThucDon WHERE IDThucDon=@IDThucDon) = 0)								 
	BEGIN
		RAISERROR(N'Thực đơn không tồn tại',16,1);
		RETURN
	END
	ELSE
	BEGIN
		INSERT INTO @tblThucDon SELECT * FROM Quyen WHERE @IDThucDon=@IDThucDon
		IF(@TenThucDon IS NULL)
			SET @TenThucDon= (SELECT TenThucDon FROM @tblThucDon)
		IF(@MoTa IS NULL)
			SET @MoTa = (SELECT MoTa FROM @tblThucDon)
		IF(@Gia IS NULL)
			SET @Gia = (SELECT Gia FROM @tblThucDon)
		IF(@PhanTramKhuyenMai IS NULL)
			SET @PhanTramKhuyenMai = (SELECT PhanTramKhuyenMai FROM @tblThucDon)
		IF(@Gia IS NULL)
			SET @Thu = (SELECT Thu FROM @tblThucDon)
		
		UPDATE ThucDon
		SET 
			IDThucDon = @IDThucDon,
			TenThucDon=@TenThucDon,
			MoTa=@MoTa,
			Gia=@Gia,
			PhanTramKhuyenMai=@PhanTramKhuyenMai,
			Thu=@Thu
	END
	SELECT * FROM ThucDon WHERE IDThucDon=@IDThucDon
END
