package vn.edu.hcmuaf.fit.Service;

import vn.edu.hcmuaf.fit.Database.DBConnect;
import vn.edu.hcmuaf.fit.Model.Account;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.stream.Collectors;

public class AccountService {
    private static AccountService instance;

    public AccountService() {
    }

    public static AccountService getInstance() {
        if (instance == null) {
            instance = new AccountService();
        }
        return instance;
    }

//    6.Lấy thông tin tên tài khoản/mật khẩu từ csdl để kiểm tra.
    public static Account checkLogin(String username, String password) throws SQLException {
        DBConnect dbConnect = DBConnect.getInstance();
        Account account = null;
        try {
            PreparedStatement statement = dbConnect.getConnection().prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet result = statement.executeQuery();
            while (result.next()) {
                    account = new Account(result.getInt("id"),result.getString("username"), result.getString("password"), result.getString("fullname"), result.getString("birth"), result.getString("mail"), result.getString("phone"),result.getInt("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }
    public static String checkPassword(String username) {
        String result = "";
        try {
            DBConnect dbConnect = DBConnect.getInstance();
            PreparedStatement statement = dbConnect.getConnection().prepareStatement("SELECT password FROM users WHERE username=?");
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
//                String storedPassword = resultSet.getString("password");
//                result = storedPassword.equals(password); // So sánh mật khẩu đã lưu với mật khẩu đầu vào
                result = resultSet.getString("password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    public static void main(String[] args) throws SQLException {
        System.out.println(checkPassword("test2"));

    }
}
