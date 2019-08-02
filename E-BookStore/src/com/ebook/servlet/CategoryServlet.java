package com.ebook.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebook.model.Book;
import com.ebook.model.Category;
import com.ebook.model.User;
import com.ebook.utils.DatabaseUtils;

/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String reqType = request.getParameter("reqType");
		if (reqType != null && !"".equals(reqType)) {
			int caseType = Integer.parseInt(reqType);
			switch (caseType) {
			case 1:
				deleteCategory(request, response);
				break;
			case 2:
				editCategory(request, response);
				break;
			case 3:
				viewCategory(request, response);
				break;
			default:
				System.out.println("No data available!!!");
			}
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String reqType = request.getParameter("reqType");
		if (reqType != null && !"".equals(reqType)) {
			int caseType = Integer.parseInt(reqType);
			switch (caseType) {
			case 1:
				//saveBook(request, response);
				break;
			case 2:
				updateCategory(request, response);
				break;
			case 3:
				//deleteUser(request, response);
				break;
			default:
				System.out.println("No data available!!!");
			}
		}
		
	}
	
	
	private void viewCategory(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Category> categorylist = new ArrayList<Category>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "welcome");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from category");
			// request.setAttribute("rs", rs);
			while (rs.next()) {
				Category category = new Category();

				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				category.setStatus(rs.getString("status"));
				category.setDescription(rs.getString("description"));
				category.setCreatedDate(rs.getDate("createdDate"));
				category.setCreatedBy(rs.getString("createdBy"));
				category.setUpdatedDate(rs.getDate("updatedDate"));
				category.setUpdatedBy(rs.getString("updatedBy"));

				categorylist.add(category);
				// System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getInt(3));
			}
			request.setAttribute("categorylist", categorylist);
			System.out.println(categorylist);
			/*
			 * System.out.println(userlist.size());
			 * System.out.println(userlist.get(1).getUsername());
			 * System.out.println(userlist.get(2).getUsername());
			 * System.out.println(userlist.get(3).getUsername());
			 * System.out.println(userlist.get(4));
			 */
			request.getRequestDispatcher("viewcategory.jsp").forward(request, response);
			//response.sendRedirect("http://localhost:8081/E-BookStore/adminlogin?reqType=3");
			con.close();
		} catch (Exception e) {
			System.out.println(e);

		}
		
	}
	
	
private void deleteCategory(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("qwerty");
		
		int isDeleted = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			
			String categoryId = request.getParameter("id");
			conn = DatabaseUtils.getDBConnection();
			
			stmt = conn.prepareStatement("DELETE FROM books where categoryId=?");
			stmt.setString(1, categoryId);
			isDeleted = stmt.executeUpdate();
			System.out.print(isDeleted+"records deleted from books");
			
			
			if(isDeleted>0) {
				stmt = conn.prepareStatement("DELETE FROM category where categoryId=?");
				stmt.setString(1, categoryId);
				isDeleted = stmt.executeUpdate();
				System.out.print(isDeleted+"records deleted from category");
			}
			request.getRequestDispatcher("/CategoryServlet?reqType=3").forward(request, response);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		}finally {
			DatabaseUtils.closeDbConnection(conn);
			
		}
		
	}


private void editCategory(HttpServletRequest request, HttpServletResponse response) {
	
	System.out.println("qwerty");
	
	//int isEdited = 0;
	
	Connection conn = null;
	PreparedStatement stmt = null;
	//ArrayList<User> userlist = new ArrayList<User>();
	
	try {
		
		String categoryId = request.getParameter("id");
		//userid = userId;
		conn = DatabaseUtils.getDBConnection();
		
		stmt = conn.prepareStatement("SELECT * FROM category where categoryId=?");
		stmt.setString(1, categoryId);
		ResultSet rs=stmt.executeQuery();  
		
		Category category = new Category();
		
		while(rs.next()){  
			
			

			category.setCategoryId(rs.getInt("categoryId"));
			category.setCategoryName(rs.getString("categoryName"));
			category.setStatus(rs.getString("status"));
			category.setDescription(rs.getString("description"));
			category.setCreatedDate(rs.getDate("createdDate"));
			category.setCreatedBy(rs.getString("createdBy"));
			category.setUpdatedDate(rs.getDate("updatedDate"));
			category.setUpdatedBy(rs.getString("updatedBy"));

			//userlist.add(user);
			
		}
		request.setAttribute("category", category);
		request.getRequestDispatcher("editcategoryform.jsp").forward(request, response);
		
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


private void updateCategory(HttpServletRequest request, HttpServletResponse response) {
	int isUpdated = 0;

	Connection conn = null;
	PreparedStatement stmt = null;

	try {

		String categoryName = request.getParameter("categoryName");
		String description = request.getParameter("description");
		String status = request.getParameter("status");
		String categoryId = request.getParameter("categoryId");

		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setDescription(description);
		category.setStatus(status);

		conn = DatabaseUtils.getDBConnection();
		stmt = conn.prepareStatement(
				"UPDATE category SET categoryName=?,status=?,description=?,updatedDate=?,updatedBy=? WHERE categoryId=?");

		stmt.setString(1, category.getCategoryName());
		stmt.setString(2, category.getStatus());
		stmt.setString(3, category.getDescription());
		stmt.setDate(4, getCurrentDate());
		stmt.setString(5, null);
		stmt.setString(6, categoryId);

		isUpdated = stmt.executeUpdate();

		System.out.println(isUpdated + " records updated in category table");
		// request.getRequestDispatcher("viewusers.jsp").forward(request, response);
		response.sendRedirect("http://localhost:8081/E-BookStore/CategoryServlet?reqType=3");

	} catch (Exception ex) {
		ex.printStackTrace();
		DatabaseUtils.closeDbConnection(conn);
	} finally {
		DatabaseUtils.closeDbConnection(conn);

	}
}

	

}
