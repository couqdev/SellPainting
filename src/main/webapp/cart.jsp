<%@ page import="vn.edu.hcmuaf.fit.Model.Product" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.Service.ProductService" %>
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
    <!-- icon CSS -->
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <!-- magnific popup CSS -->
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <!-- style CSS -->
    <link rel="stylesheet" href="css/style.css">
</head>

<body>
<!--::header part start::-->
<%@include file="header.jsp" %>
<!-- Header part end-->

<!-- breadcrumb part start-->
<section class="breadcrumb_part" style="height: 100px">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="breadcrumb_iner">
                    <h2>cart list</h2>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- breadcrumb part end-->

<!--================Cart Area =================-->
<section class="cart_area section_padding">
    <div class="container">
        <div class="cart_inner">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Product</th>
                        <th scope="col">Price</th>
                        <th scope="col">Quantity</th>
                        <th scope="col">Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        Locale localeVN = new Locale("vi", "VN");
                        NumberFormat currencyVN = NumberFormat.getCurrencyInstance(localeVN);
                        for (Product p : cart.getListProduct()) {
                    %>
                    <tr>
                        <td>
                            <div class="media">
                                <div class="d-flex">
                                    <img <%if(p.getImages().size()<=0){%>src="img/product/noimage.jpg"<%} else {%>
                                         src="<%=p.getImages().get(0).getSrc()%>" <%}%> alt=""/>
                                </div>
                                <div class="media-body">
                                    <p><%= p.getName() %>
                                    </p>
                                </div>
                            </div>
                        </td>
                        <td>
                            <h5><%= currencyVN.format(p.getPrice()) %>
                            </h5>
                        </td>
                        <td>
                            <div class="product_count">
                                <a href="<%= "/SellPainting_war/Minus?id="+p.getId() %>"><span class="input-number-decrement"> <i class="ti-minus"></i></span></a>
                                <input class="" type="text" value="<%= p.getQuantity() %>" min="0">
                                <%if(cart.getQuantityProduct(p.getId())+1 <= ProductService.getInstance().getProduct((int)p.getId()).getQuantity()){%>
                                <a href="<%= "/SellPainting_war/Plus?id="+p.getId() %>"> <span class="input-number-increment"> <i class="ti-plus"></i></span></a>
                                <%}else{%>
                                <a style="pointer-events: none;color: gray;text-decoration: none;cursor: default;" href="<%= "/SellPainting_war/Plus?id="+p.getId() %>"> <span class="input-number-increment"> <i class="ti-plus"></i></span></a>
                                <%}%>
                            </div>
                        </td>
                        <td>
                            <h5><%= currencyVN.format(p.getPrice() * p.getQuantity()) %>
                            </h5>
                        </td>
                    </tr>
                    <%}%>
                    <tr class="bottom_button">
                        <td>
                            <a class="btn_1" href="#">Update Cart</a>
                        </td>
                        <td></td>
                        <td></td>
                        <td>
                            <div class="cupon_text float-right">
                                <a class="btn_1" href="#">Close Coupon</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <h5>Subtotal</h5>
                        </td>
                        <td>
                            <h5>$2160.00</h5>
                        </td>
                    </tr>
                    <tr class="shipping_area">
                        <td></td>
                        <td></td>
                        <td>
                            <h5>Shipping</h5>
                        </td>
                        <td>
                            <div class="shipping_box">
                                <ul class="list">
                                    <li>
                                        Flat Rate: $5.00
                                        <input type="radio" aria-label="Radio button for following text input">
                                    </li>
                                    <li>
                                        Free Shipping
                                        <input type="radio" aria-label="Radio button for following text input">
                                    </li>
                                    <li>
                                        Flat Rate: $10.00
                                        <input type="radio" aria-label="Radio button for following text input">
                                    </li>
                                    <li class="active">
                                        Local Delivery: $2.00
                                        <input type="radio" aria-label="Radio button for following text input">
                                    </li>
                                </ul>
                                <h6>
                                    Calculate Shipping
                                    <i class="fa fa-caret-down" aria-hidden="true"></i>
                                </h6>
                                <select class="shipping_select">
                                    <option value="1">Bangladesh</option>
                                    <option value="2">India</option>
                                    <option value="4">Pakistan</option>
                                </select>
                                <select class="shipping_select section_bg">
                                    <option value="1">Select a State</option>
                                    <option value="2">Select a State</option>
                                    <option value="4">Select a State</option>
                                </select>
                                <input class="post_code" type="text" placeholder="Postcode/Zipcode"/>
                                <a class="btn_1" href="#">Update Details</a>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="checkout_btn_inner float-right">
                    <a class="btn_1" href="#">Continue Shopping</a>
                    <a class="btn_1 checkout_btn_1" href="#">Proceed to checkout</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!--================End Cart Area =================-->
<!--::footer_part start::-->
<footer class="footer_part">
    <div class="footer_iner section_bg">
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