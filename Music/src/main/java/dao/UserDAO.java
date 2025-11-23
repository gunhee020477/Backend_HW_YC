package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.UserDTO;
import util.DBConnection;

public class UserDAO {

    // 회원가입
    public int register(UserDTO dto) {
        int result = 0;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO user(userid, password, name, email) VALUES(?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, dto.getUserid());
            ps.setString(2, dto.getPassword());
            ps.setString(3, dto.getName());
            ps.setString(4, dto.getEmail());

            result = ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return result;
    }

    // 로그인
    public UserDTO login(String userid, String password) {
        UserDTO dto = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM user WHERE userid=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userid);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dto = new UserDTO();
                dto.setUserid(rs.getString("userid"));
                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return dto;
    }

    // 특정 유저 조회
    public UserDTO getUser(String userid) {
        UserDTO dto = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM user WHERE userid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userid);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                dto = new UserDTO();
                dto.setUserid(rs.getString("userid"));
                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return dto;
    }

    // 회원 수정
    public int updateUser(UserDTO dto) {
        int result = 0;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "UPDATE user SET password=?, name=?, email=? WHERE userid=?";
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, dto.getPassword());
            ps.setString(2, dto.getName());
            ps.setString(3, dto.getEmail());
            ps.setString(4, dto.getUserid());

            result = ps.executeUpdate();

            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return result;
    }

    // 회원 삭제
    public int deleteUser(String userid) {
        int result = 0;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "DELETE FROM user WHERE userid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userid);
            result = ps.executeUpdate();
            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return result;
    }

    // 전체 회원 (관리자 용)
    public List<UserDTO> getAllUsers() {
        List<UserDTO> list = new ArrayList<>();
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM user";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                UserDTO dto = new UserDTO();
                dto.setUserid(rs.getString("userid"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                list.add(dto);
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }

    // 아이디 찾기
    public String findId(String name, String email) {
        String userid = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT userid FROM user WHERE name=? AND email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userid = rs.getString("userid");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return userid;
    }

    // 비밀번호 찾기
    public String findPassword(String userid, String email) {
        String pw = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT password FROM user WHERE userid=? AND email=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userid);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pw = rs.getString("password");
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return pw;
    }

    // 아이디 중복 체크
    public boolean checkId(String userid) {
        boolean exists = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT userid FROM user WHERE userid=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, userid);
            ResultSet rs = ps.executeQuery();
            exists = rs.next();
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) { e.printStackTrace(); }
        return exists;
    }
}