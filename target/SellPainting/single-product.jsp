<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.Model.Image" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="zxx">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>pillloMart</title>
    <link rel="icon" href="img/favicon.png">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- animate CSS -->
    <link rel="stylesheet" href="css/animate.css">
    <!-- owl carousel CSS -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/all.css">
    <!-- flaticon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- font awesome CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <!-- swiper CSS -->
    <link rel="stylesheet" href="css/slick.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
    <style>
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
    </style>
</head>

<body>
<!--::header part start::-->
<%@include file="header.jsp" %>
<!-- Header part end-->

<!-- breadcrumb part start-->
<section class="breadcrumb_part single_product_breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->
<%
    Locale localeVN = new Locale("vi", "VN");
    NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
    Product p = (Product) request.getAttribute("product");
    String noti = request.getParameter("noti");
    if(noti==null){
        noti="";
    }
%>
<!--================Single Product Area =================-->
<div class="product_image_area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                <div class="product_img_slide owl-carousel">
                    <%if (p.getImages().size() <= 0) {%>
                    <div class="single_product_img">
                        <img src="img/product/noimage.jpg" alt="#" class="img-fluid">
                    </div>
                    <%
                    } else {
                        for (Image i : p.getImages()) {
                    %>
                    <div class="single_product_img">
                        <img src="<%= i.getSrc() %>" alt="#" class="img-fluid">
                    </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
            <div class="col-lg-8">
                <div class="single_product_text text-center">
                    <h3><%= p.getName() %>
                    </h3>
                    <p>Số lượng còn lại: <%= p.getQuantity() %>
                    </p>
                    <p>
                        <%= p.getDecription() %>
                    </p>
                    <div class="card_area">
                        <%--5. Nguoi dung chon so luong va nhan vao nut them vao gio hang --%>
                        <form action="/SellPainting_war/AddToCart" method="get" id="add">
                            <div class="product_count_area">
                                <p>Quantity</p>
                                <div class="product_count d-inline-block">
                                    <span class="product_count_item inumber-decrement"> <i class="ti-minus"></i></span>
                                    <input id="qu" required="required" class="product_count_item input-number"
                                           name="quantity" type="number" value="1"
                                           min="1">
                                    <span class="product_count_item number-increment"> <i class="ti-plus"></i></span>
                                </div>
                                <p><%= currencyVN.format(p.getPrice()) %>
                                </p>
                            </div>
                            <p id="alertcontent" class="help-block text-danger"></p>
                            <%if(!noti.equals("successfully")){%>
                            <p id="noti" class="help-block text-danger">
                                <%if(noti.equals("notEnough")){%>
                                Không đủ số lượng
                                <%}%>
                                <%if(noti.equals("outSold")){%>
                                Đã hết hàng
                                <%}%>
                                <%if(noti.equals("atLeastOne")){%>
                                Yêu cầu nhập ít nhất 1 sản phẩm
                                <%}%>
                            </p>
                            <%}else{%>
                            <p id="noti" class="help-block text-success">
                                Thêm thành công
                            </p>
                            <%}%>
                            <div class="add_to_cart">
                                <input type="hidden" name="id" value="<%= p.getId() %>">
                                <%--6. Kiem tra tinh hop le (Khong duoc de trong so luong) --%>
                                <button onclick="check()" required="required" type="submit" class="btn_3">add to cart
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================End Single Product Area =================-->
<!-- subscribe part here -->
<section class="subscribe_part section_padding">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="subscribe_part_content">
                    <h2>Get promotions & updates!</h2>
                    <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic”
                        sources credibly innovate granular internal .</p>
                    <div class="subscribe_form">
                        <input type="email" placeholder="Enter your mail">
                        <a href="#" class="btn_1">Subscribe</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- subscribe part end -->

<!--::footer_part start::-->
<footer class="footer_part">
    <div class="footer_iner">
        <div class="container">
            <div class="row justify-content-between align-items-center">
                <div class="col-lg-8">
                    <div class="footer_menu">
                        <div class="footer_logo">
                            <a href="index.html"><img src="img/logo.png" alt="#"></a>
                        </div>
                        <div class="footer_menu_item">
                            <a href="index.html">Home</a>
                            <a href="about.html">About</a>
                            <a href="product_list.html">Products</a>
                            <a href="#">Pages</a>
                            <a href="blog.html">Blog</a>
                            <a href="contact.html">Contact</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="social_icon">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-google-plus-g"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="copyright_part">
        <div class="container">
            <div class="row ">
                <div class="col-lg-12">
                    <div class="copyright_text">
                        <P><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i>
                            by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></P>
                        <div class="copyright_link">
                            <a href="#">Turms & Conditions</a>
                            <a href="#">FAQ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--::footer_part end::-->
<script>

    function check() {
        var quantity = add.quantity.value;
        if (quantity == "") {
            <%--7.2. Hien thi thong bao "khong duoc de trong so luong" --%>
            document.getElementById("alertcontent").innerHTML = "Không được để trống số lượng";
            document.getElementById("noti").innerHTML = "";
        }else{
            <%--7.1. Gui id san pham va so luong len sever --%>
        }
    }

    window.addEventListener("onclick", function () {
        check()
    })
</script>
<!-- jquery plugins here-->
<script src="js/jquery-1.12.1.min.js"></script>
<!-- popper js -->
<script src="js/popper.min.js"></script>
<!-- bootstrap js -->
<script src="js/bootstrap.min.js"></script>
<!-- easing js -->
<script src="js/jquery.magnific-popup.js"></script>
<!-- swiper js -->
<script src="js/swiper.min.js"></script>
<!-- swiper js -->
<script src="js/mixitup.min.js"></script>
<!-- particles js -->
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.nice-select.min.js"></script>
<!-- slick js -->
<script src="js/slick.min.js"></script>
<script src="js/jquery.counterup.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/contact.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<!-- custom js -->
<script src="js/custom.js"></script>
</body>

</html>