package com.practice.member;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public MemberDAO() {
        String url = "jdbc:oracle:thin:@//localhost:1521/xe";
        try {
            Context init = new InitialContext();
            DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
            conn = ds.getConnection();
            System.out.println("DB CONN");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("DB NOT CONN");
        }
    }

    public int isMember(Member member) throws SQLException {
        String sql = "select password from member where id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getId());
            rs = pstmt.executeQuery();
            if(rs.next()) {
                if(member.getPassword().equals(rs.getString("password"))) {
                    //로그인
                    return 1;
                } else {
                    //비밀번호가 올바르지 않음
                    return -2;
                }
            } else {
                //아이디가 올바르지 않음
                return -1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
        return 0;
    }

    public int insertMember(Member member) throws SQLException {
        String sql = "insert into member values(?, ?, ?, ?, ?, ?)";
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member.getId());
            pstmt.setString(2, member.getPassword());
            pstmt.setString(3, member.getName());
            pstmt.setInt(4, member.getGender());
            pstmt.setString(5, member.getEmail());
            pstmt.setInt(6, member.getTel());
            result = pstmt.executeUpdate();
            if (result == 0) {
                return -1;
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
        return -1;
    }
}
