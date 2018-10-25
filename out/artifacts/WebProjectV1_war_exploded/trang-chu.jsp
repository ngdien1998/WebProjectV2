<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ - Quản lý nhà hàng</title>
        <script type="text/javascript" src="assests/js/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="assests/js/parallax.min.js"></script>
        <script type="text/javascript" src="assests/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assests/js/script.trang-chu.js"></script>
        <link rel="stylesheet" type="text/css" href="assests/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="assests/css/style.trang-chu.css" />
        <link rel="stylesheet" type="text/css" href="assests/css/global.css" />
    </head>
    <body>
        <div class="contact-bar row">
            <div class="col-3 contact-bar-greeting">
                <i>Hân hạnh được phục vụ quý khách</i>
            </div>
            <div class="col-9 contact-bar-functions">
                <c:choose>
                    <c:when test="${welcome == null}">
                        <a href="Login">Đăng nhập</a>
                    </c:when>
                    <c:otherwise>
                        <a>${welcome}</a>
                    </c:otherwise>
                </c:choose>
                <a href="#!">Đăng ký</a>
                <a href="#!">Giỏ hàng</a>
            </div>
        </div>

        <div class="slide-show">
            <nav class="navbar navbar-expand-lg row" id="navbar-absolute">
                <a class="navbar-brand font-blonde-script text-white font-size-h3" href="#">
                    <img src="assests/images/logo.png" width="50" height="50" class="d-inline-block align-top"
                         alt="logo">
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
                            <a class="nav-link font-blonde-script text-white font-size-h5" href="#">Thực đơn</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-blonde-script text-white font-size-h5" href="#">Bài viết</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-blonde-script text-white font-size-h5" href="#">Nhà hàng</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link font-blonde-script text-white font-size-h5" href="#">Đặt bàn</a>
                        </li>
                    </ul>
                    <form class="form-inline my-2 my-lg-0">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Nhập thông tin tìm kiếm"
                                   id="txt-tim-kiem" />
                            <div class="input-group-append">
                                <input class="btn btn-info" type="submit" value="Tìm" id="btn-tim-kiem" />
                            </div>
                        </div>
                    </form>
                </div>
            </nav>
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="assests/images/banner1.jpg"
                             alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="assests/images/banner2.jpg"
                             alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="assests/images/banner3.jpg"
                             alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="assests/images/banner4.jpg"
                             alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="assests/images/banner5.jpg"
                             alt="Second slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div class="main-menus">
            <div class="title">
                <img src="assests/images/logo.png" height="50" width="50"/>
                <h1 class="font-blonde-script">Thực đơn chính của nhà hàng</h1>
                <i class="secondary-text-color">Thực đơn buffet phong phú với hơn 50 món do chính đầu bếp có kinh nghiệm
                    lựa chọn
                </i>
                <div id="list-menu">
                    <a class="food-menu background-blue text-white" href="#!">Shushi</a>
                    <a class="food-menu background-yellow text-brown" href="#!">Salad</a>
                    <a class="food-menu background-red text-white" href="#!">Thức uống</a>
                    <a class="food-menu background-orange text-white" href="#!">Bánh Pizza</a>
                    <a class="food-menu background-green text-white" href="#!">Buffet</a>
                    <a class="food-menu background-purple text-white" href="#!">Rượu</a>
                </div>
            </div>
            <div class="menu-foods container">
                <div class="row">
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="#!">
                            <div class="food-img">
                                <img src="assests/images/banh-trang-cuon-thit-heo.jpg"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">Tên món ăn</p>
                                <p class="col-6 price">200 000đ</p>
                            </div>
                            <p class="price old-price">250 000đ</p>
                        </a>
                    </div>
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="#!">
                            <div class="food-img">
                                <img src="assests/images/banh-trang-cuon-thit-heo.jpg"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">Tên món ăn</p>
                                <p class="col-6 price">200 000đ</p>
                            </div>
                            <p class="price old-price">250 000đ</p>
                        </a>
                    </div>
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="#!">
                            <div class="food-img">
                                <img src="assests/images/banh-trang-cuon-thit-heo.jpg"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">Tên món ăn</p>
                                <p class="col-6 price">200 000đ</p>
                            </div>
                            <p class="price old-price">250 000đ</p>
                        </a>
                    </div>
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="#!">
                            <div class="food-img">
                                <img src="assests/images/banh-trang-cuon-thit-heo.jpg"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">Tên món ăn</p>
                                <p class="col-6 price">200 000đ</p>
                            </div>
                            <p class="price old-price">250 000đ</p>
                        </a>
                    </div>
                </div>
                <div class="row">
                    <div class="food-ads food-ads-left col-3">
                        <div class="food-ads-sub-item">
                            <img src="assests/images/banh-xeo.jpg" alt="food">
                        </div>
                        <div class="food-ads-sub-item">
                            <img src="assests/images/banh-xeo.jpg" alt="food">
                        </div>
                    </div>
                    <div class="food-ads food-ads-center col-6">
                        <div class="food-ads-main-item">
                            <img src="assests/images/bun-mam.jpg"/>
                        </div>
                    </div>
                    <div class="food-ads food-ads-right col-3">
                        <div class="food-ads-sub-item">
                            <img src="assests/images/banh-xeo.jpg" alt="food">
                        </div>
                        <div class="food-ads food-ads-sub-item">
                            <img src="assests/images/banh-xeo.jpg" alt="food">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="parallax-window" data-parallax="scroll" data-image-src="assests/images/pabecue.png">
            <div class="container">
                <div id="emp-title">
                    <h1 class="font-blonde-script">Đội ngũ nhân viên</h1>
                    <img src="assests/images/logo.png" alt="logo" width="100" height="100">
                    <p>
                        <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the
                            industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                            of type and scrambled
                            it to make a type specimen book. It has survived not only five centuries, but also the leap
                            into electronic
                            typesetting, remaining essentially unchanged. It was popularised in the 1960s with the
                            release of Letraset
                            sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                            like Aldus PageMaker
                            including versions of Lorem Ipsum.
                        </i>
                    </p>
                </div>
                <div class="emp-list">
                    <div class="row">
                        <div class="col-md-3 col-sm-6 col-12 emp">
                            <img src="assests/images/people.jpg"/>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                has been the
                                industry
                            </p>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 emp">
                            <img src="assests/images/people.jpg"/>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                has been the
                                industry
                            </p>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 emp">
                            <img src="assests/images/people.jpg"/>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                has been the
                                industry
                            </p>
                        </div>
                        <div class="col-md-3 col-sm-6 col-12 emp">
                            <img src="assests/images/people.jpg"/>
                            <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum
                                has been the
                                industry
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="price-off">
            <div class="title">
                <img src="assests/images/logo.png" height="50" width="50"/>
                <h1 class="font-blonde-script">Thực đơn chính của nhà hàng</h1>
                <i class="secondary-text-color">Thực đơn buffet phong phú với hơn 50 món do chính đầu bếp có kinh nghiệm
                    lựa chọn
                </i>
            </div>
            <div class="menu-foods container">
                <div class="row">
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="#!">
                            <div class="food-img">
                                <img src="assests/images/banh-trang-cuon-thit-heo.jpg"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">Tên món ăn</p>
                                <p class="col-6 price">200 000đ</p>
                            </div>
                            <p class="price old-price">250 000đ</p>
                        </a>
                    </div>
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="#!">
                            <div class="food-img">
                                <img src="assests/images/banh-trang-cuon-thit-heo.jpg"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">Tên món ăn</p>
                                <p class="col-6 price">200 000đ</p>
                            </div>
                            <p class="price old-price">250 000đ</p>
                        </a>
                    </div>
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="#!">
                            <div class="food-img">
                                <img src="assests/images/banh-trang-cuon-thit-heo.jpg"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">Tên món ăn</p>
                                <p class="col-6 price">200 000đ</p>
                            </div>
                            <p class="price old-price">250 000đ</p>
                        </a>
                    </div>
                    <div class="food-item col-md-3 col-sm-6 col-12">
                        <a href="#!">
                            <div class="food-img">
                                <img src="assests/images/banh-trang-cuon-thit-heo.jpg"/>
                            </div>
                            <div class="row">
                                <p class="col-6 food-name">Tên món ăn</p>
                                <p class="col-6 price">200 000đ</p>
                            </div>
                            <p class="price old-price">250 000đ</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="parallax-window" data-parallax="scroll" data-image-src="assests/images/paralax2.png">
            <div class="container">
                <div class="comment-title">
                    <h1 class="font-blonde-script">Đội ngũ nhân viên</h1>
                    <img src="assests/images/logo.png" alt="logo" width="100" height="100">
                    <p>
                        <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the
                            industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
                            of type and scrambled
                            it to make a type specimen book. It has survived not only five centuries, but also the leap
                            into electronic
                        </i>
                    </p>
                </div>
                <div class="comment-list">
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="avatar-people-cmt" src="assests/images/people.jpg"/>
                                <p class="cmt-text">
                                    <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                        unknown printer took a galley of type and scrambled it to make a type specimen
                                        book. It has survived not only five centuries, but also the leap into electronic
                                        typesetting, remaining essentially unchanged. It was popularised in the 1960s
                                        with the release of Letraset sheets containing Lorem Ipsum passages, and more
                                        recently with desktop publishing software like Aldus PageMaker including
                                        versions of Lorem Ipsum.
                                    </i>
                                </p>
                            </div>
                            <div class="carousel-item">
                                <img class="avatar-people-cmt" src="assests/images/people.jpg"/>
                                <p class="cmt-text">
                                    <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                        unknown printer took a galley of type and scrambled it to make a type specimen
                                        book. It has survived not only five centuries, but also the leap into electronic
                                        typesetting, remaining essentially unchanged. It was popularised in the 1960s
                                        with the release of Letraset sheets containing Lorem Ipsum passages, and more
                                        recently with desktop publishing software like Aldus PageMaker including
                                        versions of Lorem Ipsum.
                                    </i>
                                </p>
                            </div>
                            <div class="carousel-item">
                                <img class="avatar-people-cmt" src="assests/images/people.jpg"/>
                                <p class="cmt-text">
                                    <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                        unknown printer took a galley of type and scrambled it to make a type specimen
                                        book. It has survived not only five centuries, but also the leap into electronic
                                        typesetting, remaining essentially unchanged. It was popularised in the 1960s
                                        with the release of Letraset sheets containing Lorem Ipsum passages, and more
                                        recently with desktop publishing software like Aldus PageMaker including
                                        versions of Lorem Ipsum.
                                    </i>
                                </p>
                            </div>
                            <div class="carousel-item">
                                <img class="avatar-people-cmt" src="assests/images/people.jpg"/>
                                <p class="cmt-text">
                                    <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem
                                        Ipsum has been the industry's standard dummy text ever since the 1500s, when an
                                        unknown printer took a galley of type and scrambled it to make a type specimen
                                        book. It has survived not only five centuries, but also the leap into electronic
                                        typesetting, remaining essentially unchanged. It was popularised in the 1960s
                                        with the release of Letraset sheets containing Lorem Ipsum passages, and more
                                        recently with desktop publishing software like Aldus PageMaker including
                                        versions of Lorem Ipsum.
                                    </i>
                                </p>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button"
                           data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button"
                           data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="blogs container">
            <div class="blog-title">
                <h1 class="font-blonde-script">Bài viết mới - nổi bật</h1>
                <img src="assests/images/logo.png" width="100" height="100"/>
                <p>
                    <i>Lorem Ipsum is simply dummy text of the printing and typesetting industry</i>
                </p>
            </div>
            <div class="row blog-list">
                <div class="blog col-md-3 col-sm-6 col-12">
                    <a href="#!">
                        <img src="assests/images/bun-mam.jpg"/>
                        <p class="post-date">8/10/2018</p>
                        <p class="post-sumary">Lorem Ipsum is simply dummy text of the printing and typesetting
                            industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                            an unknown printer took a galley of type and scrambled it to make a type specimen book. It
                            has survived not only five centuries, but also the leap into electronic typesetting,
                            remaining essentially unchanged
                        </p>
                    </a>
                </div>
                <div class="blog col-md-3 col-sm-6 col-12">
                    <a href="#!">
                        <img src="assests/images/bun-mam.jpg"/>
                        <p class="post-date">8/10/2018</p>
                        <p class="post-sumary">Lorem Ipsum is simply dummy text of the printing and typesetting
                            industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                            an unknown printer took a galley of type and scrambled it to make a type specimen book. It
                            has survived not only five centuries, but also the leap into electronic typesetting,
                            remaining essentially unchanged
                        </p>
                    </a>
                </div>
                <div class="blog col-md-3 col-sm-6 col-12">
                    <a href="#!">
                        <img src="assests/images/bun-mam.jpg"/>
                        <p class="post-date">8/10/2018</p>
                        <p class="post-sumary">Lorem Ipsum is simply dummy text of the printing and typesetting
                            industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                            an unknown printer took a galley of type and scrambled it to make a type specimen book. It
                            has survived not only five centuries, but also the leap into electronic typesetting,
                            remaining essentially unchanged
                        </p>
                    </a>
                </div>
                <div class="blog col-md-3 col-sm-6 col-12">
                    <a href="#!">
                        <img src="assests/images/bun-mam.jpg"/>
                        <p class="post-date">8/10/2018</p>
                        <p class="post-sumary">Lorem Ipsum is simply dummy text of the printing and typesetting
                            industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when
                            an unknown printer took a galley of type and scrambled it to make a type specimen book. It
                            has survived not only five centuries, but also the leap into electronic typesetting,
                            remaining essentially unchanged
                        </p>
                    </a>
                </div>
            </div>
        </div>

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
    </body>
</html>