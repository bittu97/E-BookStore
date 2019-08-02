package com.ebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.ebook.model.User;
import com.ebook.utils.DatabaseUtils;

public class UserDao {
	
	public UserDao() {
		/**
		 * 
		 */
	}
	
	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}

	public static boolean isUserExist(String username) {
		boolean isuserExist = false;

		Connection conn = null;
		int count = 0;
		try {
			conn = DatabaseUtils.getDBConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("SELECT COUNT(userId) as total FROM users where username='" + username + "'");
			while (rs.next()) {
				count = rs.getInt("total");
			}
			rs.close();
			if (count > 0)
				isuserExist = true;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DatabaseUtils.closeDbConnection(conn);
		}
		return isuserExist;
	}
	
	public static int saveUser(User user, String role) {
		int isInserted = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = DatabaseUtils.getDBConnection();
			stmt = conn.prepareStatement(
					"INSERT INTO users(firstName,lastName,emailId,username,password,mobileNumber,createdDate,createdBy,updatedDate,updatedBy,status) VALUES(?,?,?,?,?,?,?,?,?,?,?)");

			stmt.setString(1, user.getFirstName());
			stmt.setString(2, user.getLastName());
			stmt.setString(3, user.getEmailId());
			stmt.setString(4, user.getUsername());
			stmt.setString(5, user.getPassword());
			stmt.setString(6, user.getMobileNumber());
			stmt.setDate(7, getCurrentDate());
			stmt.setString(8, user.getUsername());
			stmt.setDate(9, getCurrentDate());
			stmt.setString(10, null);
			stmt.setString(11, "ACTIVE");

			isInserted = stmt.executeUpdate();

			System.out.println(isInserted + " records inserted in users table");

			if (isInserted > 0) {
				User newUser = getUserByUsername(user.getUsername());
				if (newUser != null) {
					stmt = conn.prepareStatement("INSERT INTO user_roles (user_id,role) VALUES(?,?)");
					stmt.setInt(1, newUser.getUserId());
					stmt.setString(2, role);
					isInserted = stmt.executeUpdate();
					System.out.println(isInserted + " records inserted in user_roles table");
				}
				
			}
			conn.close();
		} catch (Exception e) {
			System.out.println(e);
			DatabaseUtils.closeDbConnection(conn);
		} finally {
			DatabaseUtils.closeDbConnection(conn);
		}
		return isInserted;
	}

	public static User getUserByUsername(String username) {
		
		if (username == null || "".equals(username)) {
			throw new IllegalArgumentException("Username is null");
		}
		Connection conn = null;
		User user = null;
		try {
			conn = DatabaseUtils.getDBConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM users where username='" + username + "'");
			while (rs.next()) {
				user = new User();
				user.setUserId(rs.getInt("userId"));
				user.setUsername(rs.getString("username"));
				user.setFirstName(rs.getString("firstName"));
			}
			rs.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DatabaseUtils.closeDbConnection(conn);
		}
		return user;
		
	}

}
