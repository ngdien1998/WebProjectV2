<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Đăng ký</title>
    <script type="text/javascript" src="assests/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assests/js/parallax.min.js"></script>
    <script type="text/javascript" src="assests/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assests/css/bootstrap.min.css" />

    <link rel="stylesheet" href="./assests//css/global.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
        crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<style>
    .signup{
        width: 800px;
        /* border: 1px solid gray; */
        border-radius: 5px;
        margin: 125px auto;
        padding: 20px;
    }
    h1 {
        position: absolute;
        top:60px;
        left: 515px;
    }
    .btn.btn-primary{
        margin-left: 312px;
        width: 109px;
    }
</style>

<script>
    function validateForm() {
        var username = document.getElementById('username').value;
        var password = document.getElementById('password').value;

        if (username == '') {
            alert('Bạn chưa nhập tên đăng nhập');
        }
        else if (password == '') {
            alert('Bạn chưa nhập mật khẩu');
        }
        else {
            alert('Dữ liệu hợp lệ, ta có thể chấp nhận submit form');
            return true;
        }

        return false;
    }

    $(document).ready(
        $("button").onclick()
    );
</script>

<body>

    <div class="container">

        <form action="signup" method="post" validateForm()> 
            <h1>Đăng ký tài khoản</h1>
            <div class="signup">
                <div class="form-row">
                    <div class="col-md-4 mb-3">
                        <label for="validationServer01">Tên</label>
                        <input type="text" class="form-control is-valid" id="validationServer01" placeholder="Họ"
                            required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationServer02">Họ</label>
                        <input type="text" class="form-control is-valid" id="validationServer02" placeholder="Tên"
                            required>
                    </div>
                    <div class="col-md-4 mb-3">
                        <label for="validationServerUsername">Email</label>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="inputGroupPrepend3">@</span>
                            </div>
                            <input type="text" class="form-control is-valid" id="validationServerUsername" placeholder="Username"
                                aria-describedby="inputGroupPrepend3" required>
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col-md-6 mb-3">
                        <label for="validationServer03">Địa chỉ</label>
                        <input type="text" class="form-control is-valid" id="validationServer03" placeholder=""
                            required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationServer04">Mật khẩu</label>
                        <input type="password" class="form-control is-valid" id="validationServer04" placeholder=""
                            required>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="validationServer05">Nhập lại mật khẩu</label>
                        <input type="password" class="form-control is-valid" id="validationServer05" placeholder=""
                            required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-check">
                        <input class="form-check-input is-valid" type="checkbox" value="" id="validCheck3" required>
                        <label class="form-check-label" for="validCheck3">
                            Đồng ý với điều khoản của chúng tôi
                        </label>
                    </div>
                </div>
                <button class="btn btn-primary" type="submit">Đăng ký</button>
            </div>
        </form>
    </div>

</body>

</html>