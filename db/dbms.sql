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