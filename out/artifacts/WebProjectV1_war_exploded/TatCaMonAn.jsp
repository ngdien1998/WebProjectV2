<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tất cả sản phẩm</title>


    <script type="text/javascript" src="assests/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="assests/js/parallax.min.js"></script>
    <script type="text/javascript" src="assests/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="assests/css/bootstrap.min.css" />

    <link rel="stylesheet" href="./assests/css/style.tat-ca-mon-an.css">
    <link rel="stylesheet" href="./assests/css/global.css">
    <link rel="stylesheet" href="./assests/css/style.trang-chu.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
        crossorigin="anonymous">

    <style>
        .title, .left-title,.right-title, .right-info, .sanphammoi, .product-info, .title-detail, .price-detail{
            font-family: "blonde script";
        }
    </style>
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
                    <input type="text" class="form-control" placeholder="Nhập thông tin tìm kiếm" id="txt-tim-kiem" />
                    <div class="input-group-append">
                        <input class="btn btn-info" type="submit" value="Tìm" id="btn-tim-kiem" />
                    </div>
                </div>
            </form>
        </div>
    </nav>

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="#">Danh mục</a></li>
            <li class="breadcrumb-item active" aria-current="page">Tất cả sản phẩm</li>
        </ol>
    </nav>

    <div class="maincontent">
        <div class="container">
            <div class="row">
                <div class="left-content col-12 col-md-3">
                    <div class="danhmuc">
                        <h3 class="left-title">Danh mục</h3>
                        <ul class="left-margin">
                            <li><a href="#" class="ml-2">Trang chủ</a></li>
                            <li><a href="#" class="ml-2">Thực đơn</a></li>
                            <li><a href="#" class="ml-2">Tin tức - sự kiện</a></li>
                            <li><a href="#" class="ml-2">Giới thiệu</a></li>
                            <li><a href="#" class="ml-2">Liên hệ</a></li>
                        </ul>
                    </div>
                    <div class="timtheo">
                        <h3 class="left-title">Tìm theo</h3>
                        <ul class="left-margin">
                            <li>
                                <span class="font-weight-bold"> Giá</span>
                                <input type="range" class="custom-range" id="customRange" name="points1">
                                <span class="left-price m-auto">0đ - 5000000đ</span>
                            </li>
                            <li>
                                <span class="font-weight-bold">Màu sắc</span>
                                <ul class="left-margin">
                                    <span class="badge badge-danger">Đỏ</span>
                                    <span class="badge badge-warning">Vàng</span>
                                    <span class="badge badge-primary">Xanh dương</span>
                                    <span class="badge badge-success">Xanh lá</span>
                                    <span class="badge badge-info">Xanh nhạt</span>
                                    <span class="badge badge-secondary">Xám</span>
                                    <span class="badge badge-light">Màu sáng</span>
                                    <span class="badge badge-dark">Màu tối</span>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="sanphammoi">
                        <h3 class="left-title">Sản phẩm mới</h3>
                        <div class="sanpham d-flex align-items-center justify-content-start pt-2 ">
                            <img src="./assests/images/cua-rang-me.jpg" alt="" width="100%" style="width:140px; height: 100px;">
                            <span class="info pl-3">
                                <div class="name">Món 1</div>
                                <div class="gia">450.000đ</div>
                            </span>
                        </div>

                        <div class="sanpham d-flex align-items-center justify-content-start pt-2 ">
                            <img src="./assests/images/cua-rang-me.jpg" alt="" width="100%" style="width:140px; height: 100px;">
                            <span class="info pl-3">
                                <div class="name">Món 1</div>
                                <div class="gia">450.000đ</div>
                            </span>
                        </div>

                        <div class="sanpham d-flex align-items-center justify-content-start pt-2 ">
                            <img src="./assests/images/cua-rang-me.jpg" alt="" width="100%" style="width:140px; height: 100px;">
                            <span class="info pl-3">
                                <div class="name">Món 1</div>
                                <div class="gia">450.000đ</div>
                            </span>
                        </div>
                    </div>
                </div>





                <div class="right-content col-12 col-md-9">
                    <div class="row">
                        <div class="filter col-12 col-sm-12 col-md-12">

                            <h3 class="right-title">Tất cả sản phẩm</h3>
                            <div class="option  alert alert-secondary">
                                <a href="#">
                                    <button class="btn btn-success"><i class="fas fa-th-large"></i></button>
                                </a>
                                &nbsp;

                                <a href="#"><button class="btn btn-success"><i class="fas fa-list-ul"></i></button></a>
                                &nbsp; &nbsp; 
                                <label for="sxtheo">Sắp xếp theo : &nbsp;</label>
                                <div class="form-group tabfilter">
                                  <select class="form-control" id="sel1">
                                    <option>Mới nhất</option>
                                    <option>Khuyến mãi</option>
                                    <option>Bán chạy nhất</option>
                                  </select>
                                </div>
                            </div>

                        </div>

                        <div class="monan">
                            <div class="row" style="height:245px">
                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/cua-rang-me.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/bun-mam.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/dinner-food-meal-8313.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="row" style="height:245px">
                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/cua-rang-me.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/bun-mam.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/dinner-food-meal-8313.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="row" style="height:245px">
                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/cua-rang-me.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/bun-mam.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/dinner-food-meal-8313.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>




                            <div class="row" style="height:245px">
                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/cua-rang-me.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/bun-mam.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-4 product-info" style="height:230px">
                                    <img src="./assests/images/dinner-food-meal-8313.jpg" alt="" width="100%" height="165px">
                                    <div class="right-info d-flex justify-content-between">
                                        <div class="tenmonan">Cua rang me</div>
                                        <div class="right-price">
                                            <span class="giagoc">250.000đ</span> <br>
                                            <span class="giakm">400.000đ</span>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="mt-3">
                                <ul class="pagination justify-content-center">
                                    <li class="page-item"><a class="page-link" href="javascript:void(0);">Trang trước</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0);">1</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0);">2</a></li>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0);">Trang sau</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <footer>
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
    </footer>

</body>

</html>