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

import com.ebook.model.Book;
import com.ebook.utils.DatabaseUtils;
import com.mysql.cj.xdevapi.Statement;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Connection conn = null;
		PreparedStatement stmt = null;
		PreparedStatement stmt1 = null;
		//ArrayList<User> userlist = new ArrayList<User>();
		
		try {
			
			String bookId = request.getParameter("id");
			//userid = userId;
			conn = DatabaseUtils.getDBConnection();
			
			stmt = conn.prepareStatement("SELECT * FROM books where bookId=?");
			stmt.setString(1, bookId);
			ResultSet rs=stmt.executeQuery();  
			
			Book book = new Book();
			
			while(rs.next()){  
				
				

				book.setBookId(rs.getInt("bookId"));
				book.setCategoryId(rs.getInt("categoryId"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setPublisher(rs.getString("publisher"));
				book.setDescription(rs.getString("description"));
				book.setLanguage(rs.getString("language"));
				book.setAddition(rs.getString("addition"));
				book.setPages(rs.getInt("pages"));
				book.setIsbn(rs.getString("isbn"));
				book.setPrice(rs.getDouble("price"));
				book.setQuantity(rs.getInt("quantity"));
				book.setCreatedDate(rs.getDate("createdDate"));
				book.setCreatedBy(rs.getString("createdBy"));
				book.setUpdatedDate(rs.getDate("updatedDate"));
				book.setUpdatedBy(rs.getString("updatedBy"));

				//userlist.add(user);
				
			}
			request.setAttribute("book", book);
			
			stmt1 = conn.prepareStatement("select fileName from upload where bookId = ?");
			stmt1.setString(1, bookId);
			ResultSet rs1=stmt1.executeQuery();
			String fileName="";
			while(rs1.next()) {
				fileName = rs1.getString("fileName");
			}
			request.setAttribute("fileName", fileName);
			
			request.getRequestDispatcher("product.jsp").forward(request, response);
			
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
