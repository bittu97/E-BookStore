package com.ebook.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebook.model.User;
import com.ebook.utils.DatabaseUtils;

/**
 * Servlet implementation class EditUsers
 */
@WebServlet("/EditUsers")
public class EditUsers extends HttpServlet {
	
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //String userid;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
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
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		

	}

}
