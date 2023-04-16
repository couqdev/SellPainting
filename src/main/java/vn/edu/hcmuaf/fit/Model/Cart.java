package vn.edu.hcmuaf.fit.Model;

import vn.edu.hcmuaf.fit.Service.ProductService;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart{
    private Map<Long, Product> cart;
    private long total;
    private long quantity;
    public Cart(){
        this.cart = new HashMap<Long, Product>();
        this.total = 0;
        this.quantity = 0;
    }
    public void addProduct(Product p){
        if(cart.containsKey(p.getId())){
            Product p1 = cart.get(p.getId());
            p1.setQuantity(p1.getQuantity()+p.getQuantity());
            cart.put(p.getId(),p1);
        }else{
            cart.put(p.getId(), p);
        }
    }
    public Collection<Product> getListProduct() {
        Collection<Product> list = cart.values();
        return list;
    }
    public void remove(long key){
        cart.remove(key);
    }
    public void minus(long id) {
        Product p1 = this.cart.get(id);
        if(p1.getQuantity()==1){
            remove(id);
        }else {
            p1.setQuantity(p1.getQuantity() - 1);
            cart.put(id, p1);
        }
    }
    public long getQuantityProduct(long id){
        long quantity = 0;
        try{
            quantity =  cart.get(id).getQuantity();
        }catch (Exception e){
            quantity = 0;
        }
        return quantity;
    }

    public static void main(String[] args) {
    }
}
