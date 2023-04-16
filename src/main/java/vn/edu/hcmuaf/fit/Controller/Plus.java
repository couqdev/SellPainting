package vn.edu.hcmuaf.fit.Controller;

import vn.edu.hcmuaf.fit.Model.Cart;
import vn.edu.hcmuaf.fit.Model.Product;
import vn.edu.hcmuaf.fit.Service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Plus", value = "/Plus")
public class Plus extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = null;
        p = ProductService.getInstance().getProduct(id);
        if(cart.getQuantityProduct(p.getId())+1 <=p.getQuantity()){
            p.setQuantity(1);
            cart.addProduct(p);
        }
        request.getSession().setAttribute("cart", cart);
        response.sendRedirect("/SellPainting_war/Cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
