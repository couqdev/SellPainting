package vn.edu.hcmuaf.fit.Model;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private long id;
    private String name;
    private long price;
    private long quantity;
    private String decription;

    private List<Image> images;
    public Product() {
    }

    public Product(long id, String name, long price, long quantity, String decription) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.decription = decription;
        this.images = new ArrayList<Image>();
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public long getQuantity() {
        return quantity;
    }

    public void setQuantity(long quantity) {
        this.quantity = quantity;
    }

    public String getDecription() {
        return decription;
    }

    public void setDecription(String decription) {
        this.decription = decription;
    }

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", decription='" + decription + '\'' +
                '}';
    }
}
