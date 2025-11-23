package dao;

import java.sql.*;

import model.AdminDTO;
import util.DBConnection;

public class AdminDAO {

    public AdminDTO login(String adminid, String password) {
        AdminDTO dto = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM admin WHERE adminid=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, adminid);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dto = new AdminDTO();
                dto.setAdminid(rs.getString("adminid"));
                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return dto;
    }
}