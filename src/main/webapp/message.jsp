<%@ page import="vn.edu.hcmuaf.fit.Model.Account" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login successful</title>
</head>
<body>
<style>
    body {
        margin: auto;
        padding-top: 50px;
        text-align: center;
        text-justify: initial;
        justify-content: center;
    }
</style>
<%-- 8.Thông báo đăng nhập thành công--%>
<h1>Đăng nhập thành công</h1>

<p>Chức mừng bạn đã đăng nhập thành công!</p>

<script>
    var countDown = 3; // Thời gian đếm ngược ban đầu là 3 giây
    var countdownTimer = setInterval(function () {
        // Hiển thị giá trị của biến countDown
        document.getElementById("countdown").innerHTML = countDown;
        countDown--;
        if (countDown < 0) {
            clearInterval(countdownTimer);
            // Chuyển hướng sau khi đếm ngược kết thúc
            window.location.href = "index.jsp";
        }
    }, 1000); // Thời gian cập nhật là 1 giây (1000 ms)
</script>

<p style="color: #ff0000">Bạn sẽ được chuyển về trang chủ trong <span id="countdown">3</span> giây...</p>
</body>
</html>
