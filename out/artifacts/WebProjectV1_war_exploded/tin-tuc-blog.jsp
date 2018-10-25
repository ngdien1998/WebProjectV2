<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tin tức - Blog</title>
    <script type="text/javascript" src="assests/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assests/js/parallax.min.js"></script>
    <script type="text/javascript" src="assests/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="assests/js/script.trang-chu.js"></script>
    <link rel="stylesheet" type="text/css" href="assests/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="assests/css/style.trang-chu.css" />
    <link rel="stylesheet" type="text/css" href="assests/css/global.css" />
    <link rel="stylesheet" href="./assests/css/style.tin-tuc-blog.css" />
</head>

<body>
    <div id="header">
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
        <nav class="navbar navbar-expand-lg row" id="navbar-absolute" style="background-color: rgba(0, 0,
         0, 0.4)
        !important;">
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
                        <a class="nav-link font-blonde-script text-white font-size-h5" href="#">Trang chủ
                            <span class="sr-only">(current)</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-blonde-script font-size-h5 text-white" href="#">Thực đơn</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-blonde-script font-size-h5 text-white" href="#">Bài viết</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-blonde-script font-size-h5 text-white" href="#">Nhà hàng</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link font-blonde-script font-size-h5 text-white" href="#">Đặt bàn</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Nhập thông tin tìm kiếm" id="txt-tim-kiem" />
                        <div class="input-group-append">
                            <input class="btn btn-info" type="submit" value="Tìm" id="btn-tim-kiem" />
                        </div>
                    </div>
                </form>
            </div>
        </nav>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-4" style="padding-left:5%">
                <h2 style="margin-bottom: 0px">Danh mục Blog</h2>
                <div id="TrangChu">
                    <a href="https://google.com.vn" style="margin-left: 5px; color: black">Trang chủ</a>
                </div>
                <div id="ThucDon">
                    <a href="https://google.com.vn" style="margin-left: 5px; color: black ">Thực đơn</a>
                </div>
                <div id="Tintuc-sukien">
                    <a href="https://google.com.vn" style="margin-left: 5px; color: black">Tin tức - sự kiện</a>
                </div>
                <div id="GioiThieu">
                    <a href="https://google.com.vn" style="margin-left: 5px; color: black">Giới thiệu</a>
                </div>
                <div id="Lienhe">
                    <a href="https://google.com.vn" style="margin-left: 5px; color: black">Liên hệ</a>
                </div>
                <div id="News">
                    <h2>Bài viết mới nhất</h2>
                </div>
                <div class="row" style="margin-top: 10px;border-bottom:gray solid 1px">
                    <div class="col-4">
                        <div class="NewsImg">
                            <img src="./assests/images/banh-trang-cuon-thit-heo.jpg" width=100% height=100%>
                        </div>
                    </div>
                    <div class="col-8" style="padding-left:5%">
                        <div class="NewsStr">
                            <h6>Thưởng thức cái gì đó, chữ mờ quá không thấy rõ</h6>
                            <p>08/10/2018</p>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;border-bottom:gray solid 1px">
                    <div class="col-4">
                        <div class="NewsImg">
                            <img src="./assests/images/banh-trang-cuon-thit-heo.jpg" width=100% height=100%>
                        </div>
                    </div>
                    <div class="col-8" style="padding-left:5%">
                        <div class="NewsStr">
                            <h6>Thưởng thức cái gì đó, chữ mờ quá không thấy rõ</h6>
                            <p>08/10/2018</p>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;border-bottom:gray solid 1px">
                    <div class="col-4">
                        <div class="NewsImg">
                            <img src="./assests/images/banh-trang-cuon-thit-heo.jpg" width=100% height=100%>
                        </div>
                    </div>
                    <div class="col-8" style="padding-left:5%">
                        <div class="NewsStr">
                            <h6>Thưởng thức cái gì đó, chữ mờ quá không thấy rõ</h6>
                            <p>08/10/2018</p>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 10px;border-bottom:gray solid 1px">
                    <div class="col-4">
                        <div class="NewsImg">
                            <img src="./assests/images/banh-trang-cuon-thit-heo.jpg" width=100% height=100%>
                        </div>
                    </div>
                    <div class="col-8" style="padding-left:5%">
                        <div class="NewsStr">
                            <h6>Thưởng thức cái gì đó, chữ mờ quá không thấy rõ</h6>
                            <p>08/10/2018</p>
                        </div>
                    </div>
                </div>
            </div>

            <!--bên trái-->
            <div class="col-8">
                <!--bên phải-->

                <h2 style="margin-bottom: 0px">Tin tức</h2>
                <div class="News">
                    <!--phần Tin tức-->
                    <div class="NewsImagine">
                        <img src="./assests/images/banh-trang-cuon-thit-heo.jpg" width="250px" height="200px" alt="HinhMonAn"
                            class="img-circle">
                    </div>
                    <div class="NewsInfor">
                        <h3 style="margin-bottom: 8px">Trà ô long của Điền</h3>
                        <p style="margin-top: 8px; margin-bottom: 8px">08/10/2018</p>
                        <p style="margin-top: 8px; margin-bottom: 8px">Đây là 1 đoạn mô tả về món trà ô long của
                            Nguyễn
                            Lê
                            Điền. Không biết viết gì nữa, làm sao bây giờ, thôi
                            cứ viết nhảm nhảm đại thôi. Mà chắc nhiêu đây đủ dài rồi hén!...</p>

                        <a href="https://www.google.com/" style="margin-bottom: 1px; display: block">Xem tiếp</a>
                        <br>
                        <a href="https://http://www.nettruyen.com/">Tác giả: Phạm Gia Thịnh</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="News">
                    <div class="NewsImagine">
                        <img src="./assests/images/banh-trang-cuon-thit-heo.jpg" width="250px" height="200px">
                    </div>
                    <div class="NewsInfor">
                        <h3 style="margin-bottom: 8px">Trà ô long của Điền</h3>
                        <p style="margin-top: 8px; margin-bottom: 8px">08/10/2018</p>
                        <p style="margin-top: 8px; margin-bottom: 8px">Đây là 1 đoạn mô tả về món trà ô long của
                            Nguyễn
                            Lê
                            Điền. Không biết viết gì nữa, làm sao bây giờ, thôi
                            cứ viết nhảm nhảm đại thôi. Mà chắc nhiêu đây đủ dài rồi hén!...</p>

                        <a href="https://www.google.com/" style="margin-bottom: 1px; display: block">Xem tiếp</a>
                        <br>
                        <a href="https://http://www.nettruyen.com/">Tác giả: Phạm Gia Thịnh</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="News">
                    <!-- Phần tin tức-->
                    <div class="NewsImagine">
                        <img src="./assests/images/banh-trang-cuon-thit-heo.jpg" width="250px" height="200px">
                    </div>
                    <div class="NewsInfor">
                        <h3 style="margin-bottom: 8px">Trà ô long của Điền</h3>
                        <p style="margin-top: 8px; margin-bottom: 8px">08/10/2018</p>
                        <p style="margin-top: 8px; margin-bottom: 8px">Đây là 1 đoạn mô tả về món trà ô long của
                            Nguyễn
                            Lê
                            Điền. Không biết viết gì nữa, làm sao bây giờ, thôi
                            cứ viết nhảm nhảm đại thôi. Mà chắc nhiêu đây đủ dài rồi hén!...</p>

                        <a href="https://www.google.com/" style="margin-bottom: 1px; display: block">Xem tiếp</a>
                        <br>
                        <a href="https://http://www.nettruyen.com/">Tác giả: Phạm Gia Thịnh</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="News">
                    <div class="NewsImagine">
                        <img src="./assests/images/banh-trang-cuon-thit-heo.jpg" width="250px" height="200px">
                    </div>
                    <div class="NewsInfor">
                        <h3 style="margin-bottom: 8px">Trà ô long của Điền</h3>
                        <p style="margin-top: 8px; margin-bottom: 8px">08/10/2018</p>
                        <p style="margin-top: 8px; margin-bottom: 8px">Đây là 1 đoạn mô tả về món trà ô long của
                            Nguyễn
                            Lê
                            Điền. Không biết viết gì nữa, làm sao bây giờ, thôi
                            cứ viết nhảm nhảm đại thôi. Mà chắc nhiêu đây đủ dài rồi hén!...</p>

                        <a href="https://www.google.com/" style="margin-bottom: 1px; display: block">Xem tiếp</a>
                        <br>
                        <a href="https://http://www.nettruyen.com/">Tác giả: Phạm Gia Thịnh</a>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <ul class="pagination justify-content-center" style="margin: 20px">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="footer parallax-window" data-parallax="scroll" data-image-src="assests/images/blur-close-up-cutlery-370984.jpg">
        <div class="container-fluid">
            <div class="footer-title">
                <h1 class="font-blonde-script">Liên hệ</h1>
                <img src="assests/images/logo.png" height="100" width="100" />
                <p>
                    <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry</i>
                </p>
                <form action="" method="post" class="email-input">
                    <div class="row">
                        <div class="input-group col-6 offset-3">
                            <input type="text" class="form-control" placeholder="Nhập email của bạn" aria-label="Recipient's username"
                                aria-describedby="button-addon2">
                            <div class="input-group-append">
                                <input class="btn btn-info" type="submit" id="button-addon2" value="Đăng ký" />
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
                                <input type="text" class="form-control" />
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control" />
                            </div>
                        </div>
                        <textarea class="form-control" rows="8"></textarea>
                        <input type="submit" value="Gửi" class="btn btn-light" />
                        <input type="button" value="Hủy" class="btn btn-light" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
<title>Tin tuc - Blog</title>