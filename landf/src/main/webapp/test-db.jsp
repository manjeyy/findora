<%@ page import="java.sql.*" %>
<%@ page import="com.landf.util.DatabaseConnection" %>
<%
    try (Connection conn = DatabaseConnection.getConnection();
         Statement stmt = conn.createStatement();
         ResultSet rs = stmt.executeQuery("SELECT item_id, title, image_url FROM Items")) {
        while (rs.next()) {
            out.println("ID: " + rs.getInt("item_id") + " | Title: " + rs.getString("title") + " | ImageUrl: " + rs.getString("image_url") + "<br>");
        }
    } catch (Exception e) {
        e.printStackTrace(new java.io.PrintWriter(out));
    }
%>
