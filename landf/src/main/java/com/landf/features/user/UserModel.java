package com.landf.features.user;

public class UserModel {
    private int user_id;
    private String username;
    private String email;
    private String password;
    private String role;
    private String created_at;

    public UserModel(int user_id, String username, String email, String password, String role, String created_at) {
        this.user_id = user_id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
        this.created_at = created_at;
    }

    public UserModel(String username, String email, String password, String role) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCreated_at() {
        return created_at;
    }

    public void setCreated_at(String created_at) {
        this.created_at = created_at;
    }
}
