package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Cart;
import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddToCart", value = "/AddToCart")
public class AddToCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
        }
        int id = Integer.parseInt(request.getParameter("id"));
        int quan = Integer.parseInt(request.getParameter("quantity"));
        //8. Lấy ra sản phẩm trong database
        Product p = ProductService.getInstance().getProduct(id);
        long quantity = p.getQuantity();
        // 10.Kiểm tra số lượng
        if (p.getQuantity() == 0) {
            //11.3 Neu san pham da het hang hien thi thong bao
            response.sendRedirect("/SellPainting_war/DetailProduct?id=" + id + "&noti=outSold");
            return;
        }
        if (cart.getQuantityProduct(p.getId()) + quan <= p.getQuantity()) {
            //11.1 Neu du so luong them san pham vao gio hang
            p.setQuantity(quan);
            cart.addProduct(p);
            //12. Luu gio hang vao session
            request.getSession().setAttribute("cart", cart);
            //13. Hien thi thong bao thanh cong
            response.sendRedirect("/SellPainting_war/DetailProduct?id=" + id + "&noti=successfully");
            return;
        }
        if (cart.getQuantityProduct(p.getId()) + quan > p.getQuantity()) {
            //11.2 Neu san pham khong du so luong hien thi thong bao
            response.sendRedirect("/SellPainting_war/DetailProduct?id=" + id + "&noti=notEnough");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
