<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Liên Hệ</title>

    <script type="text/javascript" src="assests/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assests/js/parallax.min.js"></script>
    <script type="text/javascript" src="assests/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assests/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="./assests//css/global.css">
    <link rel="stylesheet" href="./assests/css/style.trang-chu.css">
    <link rel="stylesheet" href="./assests/css/style.lien-he.css">
    <script>
        let today = new Date().toISOString().substr(0, 10);
        console.log(today);
        //document.querySelector("#day").hasAttribute = today;
        $("#day").attr("value", "2018-10-12");
    </script>
</head>

<body>

<div class="contact-bar row">
    <div class="col-3 contact-bar-greeting">
        <i>Hân hạnh được phục vụ quý khách</i>
    </div>
    <div class="col-9 contact-bar-functions">
        <a href="#!"><i class="glyphicon glyphicon-shopping-cart"></i>Tài khoản
        </a>
        <a href="#!">Thanh toán</a>
        <a href="#!">Giỏ hàng</a>
    </div>
</div>

<nav class="navbar navbar-expand-lg row" id="navbar-absolute">
    <a class="navbar-brand font-blonde-script text-white font-size-h3" href="#">
        <img src="assests/images/logo.png" width="50" height="50" class="d-inline-block align-top" alt="logo">
        Restaurant
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown"
            aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link font-blonde-script text-dark font-size-h5" href="#">Trang chủ
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link font-blonde-script text-dark font-size-h5" href="#">Thực đơn</a>
            </li>
            <li class="nav-item">
                <a class="nav-link font-blonde-script text-dark font-size-h5" href="#">Bài viết</a>
            </li>
            <li class="nav-item">
                <a class="nav-link font-blonde-script text-dark font-size-h5" href="#">Nhà hàng</a>
            </li>
            <li class="nav-item">
                <a class="nav-link font-blonde-script text-dark font-size-h5" href="#">Đặt bàn</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Nhập thông tin tìm kiếm" id="txt-tim-kiem"/>
                <div class="input-group-append">
                    <input class="btn btn-info" type="submit" value="Tìm" id="btn-tim-kiem"/>
                </div>
            </div>
        </form>
    </div>
</nav>
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
        <li class="breadcrumb-item active" aria-current="page"><a href="#">Liên hệ</a></li>
    </ol>
</nav>


<div class="maincontent">
    <div class="container">
        <div class="map col-sm-12">
            <h3>Liên hệ</h3>
            <hr>
            <!-- <button style="position: absolute; left: 600px;  top:170px" class="btn btn-danger">Địa chỉ nhà hàng</button> -->
            <div id="googleMap" style="width: 100%; height: 450px; position: relative; overflow: hidden;">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15672.351056587593!2d106.773521318022!3d10.880929205690995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xa497242ca474fcf0!2zTmjDoCBIw6BuZyDEkOG6oWkgRMawxqFuZw!5e0!3m2!1svi!2s!4v1538058247409"
                        width="1110" height="420" frameborder="0" style="border:0" allowfullscreen></iframe>
            </div>
        </div>
        <div class="contact col-sm-12">

            <div class="book-table">
                <h3>Đặt bàn</h3>
                <hr>
                <form>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Họ tên của bạn">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Số điện thoại">
                    </div>
                    <div class="form-group">
                        <input type="time" class="form-control" placeholder="Giờ" value="07:00">
                    </div>
                    <div class="form-group">
                        <input type="date" class="form-control" id="day" placeholder="Ngày" value="2018-10-10">
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" placeholder="Số lượng khách">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" rows="3" placeholder="Mô tả chi tiết yêu cầu đặt bàn"></textarea>
                    </div>
                    <input type="submit" value="Đặt bàn" class="btn btn-danger">
                </form>
            </div>

            <div class="nhanxet" style="margin-top: 30px">
                <h3>Viết nhận xét </h3>
                <hr>
                <p style="font-size:15px">Nếu bạn có thắc mắc gì, hãy gửi yêu cầu cho chúng tôi và chúng tôi sẽ
                    liên lạc với bạn sớm nhất
                    có thể</p>
                <form>
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Tên của bạn">
                    </div>
                    <div class="form-group">
                        <input type="email" class="form-control" placeholder="Email của bạn">
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" rows="4" placeholder="Viết bình luận"></textarea>
                    </div>
                    <input type="submit" value="Gửi liên hệ" class="btn btn-danger">
                </form>
            </div>

        </div>
    </div>
</div>

<footer>
    <div class="footer parallax-window" data-parallax="scroll"
         data-image-src="assests/images/blur-close-up-cutlery-370984.jpg">
        <div class="container-fluid">
            <div class="footer-title">
                <h1 class="font-blonde-script">Liên hệ</h1>
                <img src="assests/images/logo.png" height="100" width="100"/>
                <p>
                    <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry</i>
                </p>
                <form action="" method="post" class="email-input">
                    <div class="row">
                        <div class="input-group col-6 offset-3">
                            <input type="text" class="form-control" placeholder="Nhập email của bạn"
                                   aria-label="Recipient's username"
                                   aria-describedby="button-addon2">
                            <div class="input-group-append">
                                <input class="btn btn-info" type="submit" id="button-addon2" value="Đăng ký"/>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-6 col-12 footer-content">
                    <h1 class="font-blonde-script content-header">Thời gian</h1>
                    <table class="table">
                        <tr>
                            <td style="padding-top: 0;">Thứ 2</td>
                            <td style="padding-top: 0;" align="right">8:00 - 22:00</td>
                        </tr>
                        <tr>
                            <td>Thứ 3</td>
                            <td align="right">8:00 - 22:00</td>
                        </tr>
                        <tr>
                            <td>Thứ 4</td>
                            <td align="right">8:00 - 22:00</td>
                        </tr>
                        <tr>
                            <td>Thứ 6</td>
                            <td align="right">8:00 - 22:00</td>
                        </tr>
                        <tr>
                            <td>Thứ 7</td>
                            <td align="right">8:00 - 22:00</td>
                        </tr>
                    </table>
                </div>
                <div class="col-md-4 col-sm-6 col-12 footer-content">
                    <h1 class="font-blonde-script content-header">Thông tin liên hệ</h1>
                    <p>
                        <b>Địa chỉ:</b>
                        75/6 Trương Văn Hải, Tăng Nhơn Phú B, Q9
                    </p>
                    <p>
                        <b>Email:</b>
                        nhahang@gmail.com
                    </p>
                    <p>
                        <b>Hot line:</b>
                        (098) 765 9898
                    </p>
                    <span class="social">
                            <a></a>
                        </span>
                </div>
                <div class="col-md-4 col-sm-6 col-12 send-contact footer-content">
                    <h1 class="font-blonde-script content-header">Gửi liên hệ</h1>
                    <form action="#" method="post">
                        <div class="form-row">
                            <div class="col-6">
                                <input type="text" class="form-control"/>
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control"/>
                            </div>
                        </div>
                        <textarea class="form-control" rows="8"></textarea>
                        <input type="submit" value="Gửi" class="btn btn-light"/>
                        <input type="button" value="Hủy" class="btn btn-light"/>
                    </form>
                </div>
            </div>
        </div>
    </div>
</footer>

</body>

</html>