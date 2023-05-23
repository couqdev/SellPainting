package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.Image;
import vn.edu.hcmuaf.fit.Model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    private static ProductService instance;

    public ProductService() {
    }

    public static ProductService getInstance() {
        if (instance == null) {
            instance = new ProductService();
        }
        return instance;
    }

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<Product>();
        DBConnect dbConnect = DBConnect.getInstance();
        Product product = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id, name, price,quantity,decription from products");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt("id"), rs.getString("name"), rs.getLong("price"), rs.getLong("quantity"), rs.getString("decription"));
                product.setImages(addImages(rs.getInt("id")));
                list.add(product);
            }

        } catch (SQLException e) {
        }
        return list;
    }

    public List<Image> addImages(int id) {
        List<Image> list = new ArrayList<Image>();
        Image image = new Image();
        DBConnect dbConnect = DBConnect.getInstance();
        try {
            PreparedStatement prs = dbConnect.getConnection().prepareStatement("select id,id_product ,src, display from images where id_product=? and display=?");
            prs.setInt(1, id);
            prs.setInt(2, 1);
            ResultSet rs = prs.executeQuery();
            while (rs.next()) {
                image = new Image(rs.getInt("id"), rs.getString("src"), rs.getInt("display"));
                list.add(image);
            }
        } catch (SQLException e) {
        }
        return list;
    }
//    9. Tao ra san pham voi thong tin trong database
    public Product getProduct(int id) {
        DBConnect dbConnect = DBConnect.getInstance();
        Product product = new Product();
        try {
            PreparedStatement ps = dbConnect.getConnection().prepareStatement("select id, name, price,quantity,decription from products where id= ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                product = new Product(rs.getInt("id"), rs.getString("name"), rs.getLong("price"), rs.getLong("quantity"), rs.getString("decription"));
                product.setImages(addImages(rs.getInt("id")));
            }

        } catch (SQLException e) {
        }
        return product;
    }

    public static void main(String[] args) {
    }
}
