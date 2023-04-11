package vn.edu.hcmuaf.fit.Model;

import java.util.HashMap;
import java.util.Map;

public class Cart{
    private Map<String, Product> cart;
    private long total;
    private long quantity;
    public Cart(){
        this.cart = new HashMap<String, Product>();
        this.total = 0;
        this.quantity = 0;
    }
}
