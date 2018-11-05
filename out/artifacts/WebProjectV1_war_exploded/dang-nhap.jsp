<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Đăng nhập</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang chủ - Quản lý nhà hàng</title>
    <script type="text/javascript" src="assests/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assests/js/parallax.min.js"></script>
    <script type="text/javascript" src="assests/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assests/js/script.dang-nhap.js"></script>
    <link rel="stylesheet" type="text/css" href="assests/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="assests/css/style.dang-nhap.css"/>
    <link rel="stylesheet" type="text/css" href="assests/css/global.css"/>
</head>
<body>
<div class="container">
    <div class="login">
        <h1>Đăng nhập webiste Nhà hàng</h1>
        <form action="Login" method="post" id="frm-dang-nhap">
            <div class="form-group">
                <label for="exampleInputEmail1">Địa chỉ email (Bắt buộc)</label>
                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"
                       placeholder="Nhập email vào đây" name="email">
                <small id="emailHelp" class="form-text text-muted">Email của bạn sẽ không được tiêt lộ cho bất kỳ ai
                </small>
            </div>
            <div class="form-group">
                <label for="exampleInputPassword1">Mật khẩu (Bắt buộc)</label>
                <input type="password" class="form-control" id="exampleInputPassword1"
                       placeholder="Nhập mật khẩu vào đây" name="password">
                <small class="text-danger" id="validate-pass"></small>
                <small id="passwordHelp" class="form-text text-muted">Mật khẩu phải dài hơn 8 ký tự, chứa chữ hoa,
                    thường và ký tự đặt biệt
                </small>
            </div>
            <div class="form-group form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Ghi nhớ đăng nhập</label>
            </div>
            <button type="submit" class="btn btn-primary" onclick="return validateForm();">Đăng nhập</button>
        </form>
    </div>
</div>
</body>
</html>