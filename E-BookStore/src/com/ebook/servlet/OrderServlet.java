package com.ebook.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebook.model.Book;
import com.ebook.model.Cart;
import com.ebook.model.Order;
import com.ebook.utils.DatabaseUtils;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int isInserted = 0;
		//Map<String, String> responseObj = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			
			//String orderId = request.getParameter("orderId");
			String username = request.getParameter("username");
			String fullName = request.getParameter("fullName");
			String emailId = request.getParameter("emailId");
			String address = request.getParameter("address");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String zip = request.getParameter("zip");
			
			Order order = new Order();
			//order.setOrderId(Integer.parseInt(orderId));
			//order.setUserId(Integer.parseInt(userId));
			order.setFullName(fullName);
			order.setEmailId(emailId);
			order.setAddress(address);
			order.setCity(city);
			order.setState(state);
			order.setZip(Integer.parseInt(zip));
			
			conn = DatabaseUtils.getDBConnection();
			
			String que = "select userId from users where username = '"+username+"'";
			Statement stmt1 = conn.createStatement();
			ResultSet rs = stmt1.executeQuery(que);
			int userId=0;
			while(rs.next()) {
				 userId = rs.getInt("userId");
			}
			order.setUserId(userId);
			
			
			stmt = conn.prepareStatement(
					"INSERT INTO orders(userId,fullName,emailId,address,city,state,zip,createdDate,createdBy,updatedDate,updatedBy) VALUES(?,?,?,?,?,?,?,?,?,?,?)");

			stmt.setString(1, Integer.toString(order.getUserId()));
			stmt.setString(2, order.getFullName());
			stmt.setString(3, order.getEmailId());
			stmt.setString(4, order.getAddress());
			stmt.setString(5, order.getCity());
			stmt.setString(6, order.getState());
			stmt.setString(7, Integer.toString(order.getZip()));
			stmt.setDate(8, getCurrentDate());
			stmt.setString(9, null);
			stmt.setDate(10, getCurrentDate());
			stmt.setString(11, null);

			isInserted = stmt.executeUpdate();

			System.out.println(isInserted + " records inserted in orders table");
			
			
			
			que = "select * from books b,cart c where c.bookId = b.bookId and c.username = '"+username+"'";
			stmt1 = conn.createStatement();
			rs = stmt1.executeQuery(que); 
			Book book = new Book();
			Cart cart = new Cart();
			
			while(rs.next()) {
				book.setBookId(rs.getInt("bookId"));
				book.setQuantity(rs.getInt("b.quantity"));
				cart.setQuantity(rs.getInt("c.quantity"));
				stmt = conn.prepareStatement("UPDATE books SET quantity = ?  where bookId = ?");
				stmt.setString(1, Integer.toString(book.getQuantity()-cart.getQuantity()));
				stmt.setString(2, Integer.toString(book.getBookId()));
				stmt.executeUpdate();
			 } 
			
			
				
			stmt = conn.prepareStatement("DELETE from cart where username = ?");
			stmt.setString(1, username);
			stmt.executeUpdate();
			
			
			
			
			//request.getRequestDispatcher("/BookServlet?reqType=3").forward(request, response);
			response.sendRedirect("http://localhost:8081/E-BookStore/ordersuccess.jsp");

		} catch (Exception ex) {
			ex.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		} finally {
			DatabaseUtils.closeDbConnection(conn);
		}
		
		//doGet(request, response);
	}

}
