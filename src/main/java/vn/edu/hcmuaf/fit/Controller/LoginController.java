package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Account;
import vn.edu.hcmuaf.fit.Service.AccountService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet(name = "Login", value = "/LoginController")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getSession().setAttribute("currentAccount",null);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        5a.Submit dữ liệu đến LoginController
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Account account = null;
        try {
//            7.Tiến hành kiểm tra username/password
            account = AccountService.getInstance().checkLogin(username, password);

        if (account == null) {
            request.setAttribute("error", "Tài khoản hoặc mật khẩu không đúng");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {

            request.getSession().setAttribute("currentAccount", account);

            Account sysoutAccount = (Account) request.getSession().getAttribute("currentAccount");
            out.println(sysoutAccount);

            out.println(account.getUsername() + " dang nhap thanh cong");
            // 8.Thông báo đăng nhập thành công
            response.sendRedirect("message.jsp");

//            response.sendRedirect("index.jsp");
        }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
