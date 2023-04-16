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
        int quan = 0;
        try {
            quan = Integer.parseInt(request.getParameter("quantity"));
        } catch (Exception e) {

        }
        Product p = ProductService.getInstance().getProduct(id);
        if (quan <= 0) {

        } else {
            if (cart.getQuantityProduct(p.getId()) + quan <= p.getQuantity()) {
                p.setQuantity(quan);
                cart.addProduct(p);
            }
        }
        request.getSession().setAttribute("cart", cart);
        response.sendRedirect("/SellPainting_war/DetailProduct?id=" + id);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}