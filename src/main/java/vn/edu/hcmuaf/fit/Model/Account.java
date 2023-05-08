package vn.edu.hcmuaf.fit.Model;

import java.io.Serializable;

public class Account implements Serializable {
    private int id;
    private String username;
    private String password;
    private String fullname;
    private String birth;
    private String phone;
    private String mail;
    private int role;

    public Account(int id, String username, String password, String fullname, String birth, String phone, String mail, int role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.fullname = fullname;
        this.birth = birth;
        this.phone = phone;
        this.mail = mail;
        this.role = role;
    }

    public Account(String username, String password) {
        this.username = username;
        this.password = password;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getBirth() {
        return birth;
    }

    public void setBirth(String birth) {
        this.birth = birth;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", ussername='" + username + '\'' +
                ", password='" + password + '\'' +
                ", fullname='" + fullname + '\'' +
                ", birth='" + birth + '\'' +
                ", phone='" + phone + '\'' +
                ", mail='" + mail + '\'' +
                ", role=" + role +
                '}';
    }

    public static void main(String[] args) {
    }
}
