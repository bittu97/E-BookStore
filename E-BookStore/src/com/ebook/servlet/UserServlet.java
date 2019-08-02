package com.ebook.servlet;

import java.io.IOException;
import java.net.http.HttpResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebook.ServiceImpl.UserServiceImpl;
import com.ebook.model.Book;
import com.ebook.model.User;
import com.ebook.service.UserService;
import com.ebook.utils.DatabaseUtils;
import com.google.gson.Gson;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService userService = new UserServiceImpl();
	
	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}

	/*
	 * private static java.sql.Date getCurrentDate() { java.util.Date today = new
	 * java.util.Date(); return new java.sql.Date(today.getTime()); }
	 */

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String reqType = request.getParameter("reqType");
		if (reqType != null && !"".equals(reqType)) {
			int caseType = Integer.parseInt(reqType);
			switch (caseType) {
			case 1:
				deleteUser(request, response);
				break;
			case 2:
				viewUser(request, response);
				break;
			case 3:
				//viewBook(request, response);
				break;
			case 4:
				editUser(request, response);
			default:
				System.out.println("No data available!!!");
			}
		}
		

		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String reqType = request.getParameter("reqType");
		if (reqType != null && !"".equals(reqType)) {
			int caseType = Integer.parseInt(reqType);
			switch (caseType) {
			case 1:
				saveUser(request, response);
				break;
			case 2:
				updateUser(request, response);
				break;
			case 3:
				//deleteUser(request, response);
				break;
			default:
				System.out.println("No data available!!!");
			}
		}
	}

	private void saveUser(HttpServletRequest request, HttpServletResponse response) {
		int insertedRecord = 0;
		Map<String, String> responseObj = null;
		try {
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String emailId = request.getParameter("emailId");
			String username = request.getParameter("userName");
			String password = request.getParameter("password");
			String mobileNumber = request.getParameter("mobileNo");
			responseObj = new HashMap<String, String>();
			if (username != null) {
				if (isUserExist(username)) {
					responseObj.put("status", "fail");
					responseObj.put("message",
							"User already exist, kindly proceed for login or try with another username!!");
				} else {
					User user = new User();
					user.setFirstName(firstName);
					user.setLastName(lastName);
					user.setEmailId(emailId);
					user.setUsername(username);
					user.setPassword(password);
					user.setMobileNumber(mobileNumber);

					insertedRecord = userService.saveUser(user, "ROLE_USER");
					if (insertedRecord > 0) {
						responseObj.put("status", "success");
						responseObj.put("message", "User registerd successfully, Please proceed for login!!!");
					} else {
						responseObj.put("status", "fail");
						responseObj.put("message", "Some error occured! kindly try again!!");
					}
					System.out.println("Inserted .............." + insertedRecord);
				}

			} else {
				responseObj.put("status", "fail");
				responseObj.put("message", "Username is not valid or null!!!");
			}
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(responseObj));

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {

		}
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response) {
		int isUpdated = 0;

		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String emailId = request.getParameter("emailId");
			String username = request.getParameter("userName");
			String password = request.getParameter("password");
			String mobileNumber = request.getParameter("mobileNo");
			String status = request.getParameter("status");
			String enabled = request.getParameter("enabled");
			String userId = request.getParameter("userId");

			User user = new User();
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setEmailId(emailId);
			user.setUsername(username);
			user.setPassword(password);
			user.setMobileNumber(mobileNumber);
			user.setEnabled(Integer.parseInt(enabled));
			user.setStatus(status);

			conn = DatabaseUtils.getDBConnection();
			stmt = conn.prepareStatement(
					"UPDATE users SET firstName=?,lastName=?,emailId=?,username=?,password=?,mobileNumber=?,updatedDate=?,updatedBy=?,status=? WHERE userId=?");

			stmt.setString(1, user.getFirstName());
			stmt.setString(2, user.getLastName());
			stmt.setString(3, user.getEmailId());
			stmt.setString(4, user.getUsername());
			stmt.setString(5, user.getPassword());
			stmt.setString(6, user.getMobileNumber());
			stmt.setDate(7, getCurrentDate());
			stmt.setString(8, null);
			stmt.setString(9, user.getStatus());
			stmt.setString(10, userId);

			isUpdated = stmt.executeUpdate();

			System.out.println(isUpdated + " records updated in users table");
			// request.getRequestDispatcher("viewusers.jsp").forward(request, response);
			response.sendRedirect("http://localhost:8081/E-BookStore/UserServlet?reqType=2");

		} catch (Exception ex) {
			ex.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		} finally {
			DatabaseUtils.closeDbConnection(conn);

		}
	}
	
	
	private void editUser(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("qwerty");
		
		//int isEdited = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		//ArrayList<User> userlist = new ArrayList<User>();
		
		try {
			
			String userId = request.getParameter("id");
			//userid = userId;
			conn = DatabaseUtils.getDBConnection();
			
			stmt = conn.prepareStatement("SELECT * FROM users where userId=?");
			stmt.setString(1, userId);
			ResultSet rs=stmt.executeQuery();  
			
			User user = new User();
			
			while(rs.next()){  
				
				

				user.setUserId(rs.getInt("userId"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmailId(rs.getString("emailId"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setMobileNumber(rs.getString("mobileNumber"));
				user.setCreatedDate(rs.getDate("createdDate"));
				user.setCreatedBy(rs.getString("createdBy"));
				user.setUpdatedDate(rs.getDate("updatedDate"));
				user.setUpdatedBy(rs.getString("updatedBy"));
				user.setStatus(rs.getString("status"));
				user.setEnabled(rs.getInt("enabled"));

				//userlist.add(user);
				
			}
			request.setAttribute("user", user);
			request.getRequestDispatcher("edituserform.jsp").forward(request, response);
			
			//System.out.print(isEdited+"entry selected from users of id:"+userId);
			
			
			/*
			 * if(isEdited>0) {
			 * 
			 * System.out.print(isEdited+"record is edited successfully"); }
			 */
			
			
		}catch (Exception e) {
			e.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		}finally {
			DatabaseUtils.closeDbConnection(conn);
			//request.getRequestDispatcher("/EditUserForm").forward(request, response);
			
		}
		
	}
	
	private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("qwerty");
		
		int isDeleted = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			
			String userId = request.getParameter("id");
			conn = DatabaseUtils.getDBConnection();
			
			stmt = conn.prepareStatement("DELETE FROM user_roles where user_id=?");
			stmt.setString(1, userId);
			isDeleted = stmt.executeUpdate();
			System.out.print(isDeleted+"records deleted from user_roles");
			
			
			if(isDeleted>0) {
				stmt = conn.prepareStatement("DELETE FROM users where userId=?");
				stmt.setString(1, userId);
				isDeleted = stmt.executeUpdate();
				System.out.print(isDeleted+"records deleted from users");
			}
			request.getRequestDispatcher("/UserServlet?reqType=2").forward(request, response);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		}finally {
			DatabaseUtils.closeDbConnection(conn);
			
		}
		
	}
	
	private void viewUser(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<User> userlist = new ArrayList<User>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "welcome");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from users");
			// request.setAttribute("rs", rs);
			while (rs.next()) {
				User user = new User();

				user.setUserId(rs.getInt("userId"));
				user.setFirstName(rs.getString("firstName"));
				user.setLastName(rs.getString("lastName"));
				user.setEmailId(rs.getString("emailId"));
				user.setUsername(rs.getString("username"));
				user.setPassword(rs.getString("password"));
				user.setMobileNumber(rs.getString("mobileNumber"));
				user.setCreatedDate(rs.getDate("createdDate"));
				user.setCreatedBy(rs.getString("createdBy"));
				user.setUpdatedDate(rs.getDate("updatedDate"));
				user.setUpdatedBy(rs.getString("updatedBy"));
				user.setStatus(rs.getString("status"));
				user.setEnabled(rs.getInt("enabled"));

				userlist.add(user);
				// System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getInt(3));
			}
			request.setAttribute("userlist", userlist);
			System.out.println(userlist);
			/*
			 * System.out.println(userlist.size());
			 * System.out.println(userlist.get(1).getUsername());
			 * System.out.println(userlist.get(2).getUsername());
			 * System.out.println(userlist.get(3).getUsername());
			 * System.out.println(userlist.get(4));
			 */
			request.getRequestDispatcher("viewusers.jsp").forward(request, response);
			con.close();
		} catch (Exception e) {
			System.out.println(e);

		}
		
	}
	

	private boolean isUserExist(String username) {
		boolean isUserExist = false;
		if (username != null && !"".equals(username)) {
			isUserExist = userService.isUserExist(username);
		} else {
			throw new IllegalArgumentException("Username is null");
		}
		return isUserExist;
	}

}
