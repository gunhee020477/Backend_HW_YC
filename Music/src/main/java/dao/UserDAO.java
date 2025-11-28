package dao;

import model.UserDTO;
import util.DBConnection;
import java.sql.*;

public class UserDAO {

    // 로그인
    public UserDTO login(String id, String pw) {
        String sql = "SELECT * FROM user WHERE userid=? AND password=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, id);
            ps.setString(2, pw);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO dto = new UserDTO();
                dto.setUserid(rs.getString("userid"));
                dto.setPassword(rs.getString("password"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                return dto;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    // 회원가입
    public int insertUser(UserDTO dto) {
        String sql = "INSERT INTO user(userid, password, name, email) VALUES(?,?,?,?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getUserid());
            ps.setString(2, dto.getPassword());
            ps.setString(3, dto.getName());
            ps.setString(4, dto.getEmail());

            return ps.executeUpdate();

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // 아이디 찾기
    public String findId(String name, String email) {
        String sql = "SELECT userid FROM user WHERE name=? AND email=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, name);
            ps.setString(2, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getString("userid");

        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    // 임시 비밀번호 업데이트
    public int updateTempPw(String userid, String name, String email, String tempPw) {
        String sql = "UPDATE user SET password=? WHERE userid=? AND name=? AND email=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, tempPw);
            ps.setString(2, userid);
            ps.setString(3, name);
            ps.setString(4, email);

            return ps.executeUpdate();

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // 정보 수정
    public int updateUser(UserDTO dto) {
        String sql = "UPDATE user SET password=?, name=?, email=? WHERE userid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, dto.getPassword());
            ps.setString(2, dto.getName());
            ps.setString(3, dto.getEmail());
            ps.setString(4, dto.getUserid());

            return ps.executeUpdate();

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }

    // 회원 삭제
    public int deleteUser(String userid) {
        String sql = "DELETE FROM user WHERE userid=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, userid);
            return ps.executeUpdate();

        } catch (Exception e) { e.printStackTrace(); }
        return 0;
    }
}