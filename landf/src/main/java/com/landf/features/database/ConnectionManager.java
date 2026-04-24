package com.landf.features.database;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    private static final String URL = "jdbc:mysql://localhost:3306/aplf";
    private static final String USER = "root";
    private static final String PASS = "";

    static {
        try {
            Driver driver = new com.mysql.cj.jdbc.Driver();
            DriverManager.registerDriver(driver);
        } catch (SQLException e) {
            throw new RuntimeException("Failed to register MySQL driver", e);
        }
    }

    public static Connection getConnection() throws SQLException {
       try {
           return DriverManager.getConnection(URL, USER, PASS);
       } catch (SQLException e) {
           return DriverManager.getConnection(URL, USER, "1234");
       }
    }
}
