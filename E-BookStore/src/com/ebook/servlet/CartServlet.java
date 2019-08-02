package com.ebook.servlet;

import java.io.IOException;
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

import com.ebook.model.Book;
import com.ebook.model.Cart;
import com.ebook.model.User;
import com.ebook.utils.DatabaseUtils;
import com.google.gson.Gson;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String reqType = request.getParameter("reqType");
		if (reqType != null && !"".equals(reqType)) {
			int caseType = Integer.parseInt(reqType);
			switch (caseType) {
			case 1:
				viewcart(request, response);
				break;
			case 2:
				//updateBook(request, response);
				break;
			case 3:
				deleteCart(request, response);
				break;
			default:
				System.out.println("No data available!!!");
			}
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	String s;
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String reqType = request.getParameter("reqType");
		s=reqType;
		if (reqType != null && !"".equals(reqType)) {
			int caseType = Integer.parseInt(reqType);
			switch (caseType) {
			case 1:
				savecart(request, response);
				break;
			case 2:
				countItem(request, response);
				break;
			case 3:
				updateFromCart(request, response);
				break;
			case 4:
				//saveBuy(request, response);
				break;
			default:
				System.out.println("No data available!!!");
			}
		}
		
		//doGet(request, response);
	}
	
	private void savecart(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		String query = null;
		
		try {
			
			String bookId = request.getParameter("bookId");
			String username = request.getParameter("username");
			int qty = Integer.parseInt(request.getParameter("quantity"));
			double price = Double.parseDouble(request.getParameter("price"));
			
			
			Cart cart = new Cart();
			
			cart.setBookId(Integer.parseInt(bookId));
			cart.setPrice(price);
			cart.setQuantity(qty);
			cart.setUsername(username);
			cart.setTotalPrice(qty*price);
			
			Cart existingCart = getCartByBookId(cart.getBookId(),cart.getUsername());
			conn = DatabaseUtils.getDBConnection();
			if (existingCart != null) {
				System.out.print("Book already exist in cart...!!!");
				int totalQuant = existingCart.getQuantity() + qty; 
				int exceed=0;
				Statement stmt1 = conn.createStatement();
				ResultSet rs = stmt1.executeQuery("SELECT quantity FROM books where bookId='"+bookId+"'");
				while(rs.next()) {
					
					int available = rs.getInt("quantity");
					if(available < totalQuant) {	
						exceed = 1;
					}
				}
				
				
				if (exceed == 0) {
					query = "UPDATE cart SET quantity = ?, totalPrice = ?,updatedDate = ?,updatedBy = ? WHERE bookId = ? AND username = ?";
					stmt = conn.prepareStatement(query);
					stmt.setString(1, Integer.toString(existingCart.getQuantity() + cart.getQuantity()));
					stmt.setString(2,
							Double.toString(cart.getPrice() * (existingCart.getQuantity() + cart.getQuantity())));
					stmt.setDate(3, getCurrentDate());
					stmt.setString(4, null);
					stmt.setString(5, bookId);
					stmt.setString(6, username);
					int isUpdated = stmt.executeUpdate();

					if (isUpdated > 0) {
						System.out.println(" records updated successfully");
						/*
						 * if(Integer.parseInt(s)==4) { DatabaseUtils.closeDbConnection(conn);
						 * System.out.print("inside if"); //viewcart(request, response);
						 * request.getRequestDispatcher("/CartServlet?reqType=1&username='"+username+"'"
						 * ).forward(request, response); return; }
						 */
					}else {
						
						System.out.println(" error occoured");
					}
				}else {
					request.setAttribute("msg", "Quantity exceeded");
				}
				
			}else {
				
				int exceed=0;
				Statement stmt1 = conn.createStatement();
				ResultSet rs = stmt1.executeQuery("SELECT quantity FROM books where bookId='"+bookId+"'");
				while(rs.next()) {
					int available = rs.getInt("quantity");
					if(available<qty) {
						exceed = 1;
					}else {exceed=0;}
				}
				
				
				if (exceed == 0) {
					query = "INSERT INTO cart(username,bookId,price,quantity,totalPrice,createdDate,createdBy,updatedDate,updatedBy) VALUES(?,?,?,?,?,?,?,?,?)";
					stmt = conn.prepareStatement(query);
					stmt.setString(1, cart.getUsername());
					stmt.setString(2, Integer.toString(cart.getBookId()));
					stmt.setString(3, Double.toString(cart.getPrice()));
					stmt.setString(4, Integer.toString(cart.getQuantity()));
					stmt.setString(5, Double.toString(cart.getTotalPrice()));
					stmt.setDate(6, getCurrentDate());
					stmt.setString(7, null);
					stmt.setDate(8, getCurrentDate());
					stmt.setString(9, null);

					int isInserted = stmt.executeUpdate();

					System.out.println(isInserted + " records inserted in cart table");
					/*
					 * if(Integer.parseInt(s)==4) { DatabaseUtils.closeDbConnection(conn);
					 * System.out.print("inside if"); //viewcart(request, response);
					 * request.getRequestDispatcher("/CartServlet?reqType=1&username='"+username+"'"
					 * ).forward(request, response); return; }
					 */
					
				}else {System.out.println( " quantity exceded");}
			}
			//request.getRequestDispatcher("index.jsp").forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		}finally {
			DatabaseUtils.closeDbConnection(conn);
			//request.getRequestDispatcher("/EditUserForm").forward(request, response);
			
		}
		
	}
	

	public static Cart getCartByBookId(int bookId, String username) {
		
		if (bookId == 0) {
			throw new IllegalArgumentException("BookId is 0");
		}
		Connection conn = null;
		Cart cart = null;
		try {
			
			conn = DatabaseUtils.getDBConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM cart where bookId='"+bookId+"' and username= '"+username+"'");
			while (rs.next()) {
				cart = new Cart();
				
				cart.setCartId(rs.getInt("cartId"));
				cart.setQuantity(rs.getInt("quantity"));
				cart.setPrice(rs.getDouble("price"));
				cart.setTotalPrice(rs.getDouble("totalPrice"));
				cart.setUsername(rs.getString("username"));
				cart.setCreatedDate(rs.getDate("createdDate"));
				cart.setCreatedBy(rs.getString("createdBy"));
				cart.setUpdatedDate(rs.getDate("updatedDate"));
				cart.setUpdatedBy(rs.getString("updatedBy"));
				
			}
			rs.close();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			DatabaseUtils.closeDbConnection(conn);
		}
		return cart;
		
	}
	
	
	
	private void viewcart(HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<Cart> cartlist = new ArrayList<Cart>();
		try {
			
			String username = request.getParameter("username");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "welcome");
			Statement stmt = con.createStatement();
			Statement stmt1 = con.createStatement();
			String que =  "select * from books b,cart c where (c.bookId = b.bookId and c.username = '"+username+"') "; 
			ResultSet rs = stmt.executeQuery(que);
			// request.setAttribute("rs", rs);
			int bookId = 0;
			while (rs.next()) {
				Cart cart = new Cart();
				
				cart.setBookId(rs.getInt("bookId"));
				
				bookId=rs.getInt("bookId");
				
				ResultSet rs1 = stmt1.executeQuery("select fileName from upload where bookId = '"+bookId+"'");
				while (rs1.next()) {
					cart.setFileName(rs1.getString("fileName"));
				}
				
				
				cart.setCartId(rs.getInt("cartId"));
				cart.setUsername(rs.getString("username"));
				cart.setPrice(rs.getDouble("price"));
				cart.setTotalPrice(rs.getDouble("totalPrice"));
				cart.setQuantity(rs.getInt("c.quantity"));
				cart.setTitle(rs.getString("title"));
				cart.setAuthor(rs.getString("author"));
				cart.setPublisher(rs.getString("publisher"));
				cart.setDescription(rs.getString("description"));
				cart.setCreatedDate(rs.getDate("createdDate"));
				cart.setCreatedBy(rs.getString("createdBy"));
				cart.setUpdatedDate(rs.getDate("updatedDate"));
				cart.setUpdatedBy(rs.getString("updatedBy"));

				cartlist.add(cart);
				// System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getInt(3));
			}
			request.setAttribute("cartlist", cartlist);
			System.out.println(cartlist);
			
			//Statement stmt1=null;
			//stmt1 = con.prepareStatement("select fileName from upload where bookId = ?");
			//stmt1.setString(1, bookId);
			//ResultSet rs1=stmt1.executeQuery();
			//String fileName="";
			//while(rs1.next()) {
			//	fileName = rs1.getString("fileName");
			//}
			//request.setAttribute("fileName", fileName);
			
			
			/*
			 * System.out.println(userlist.size());
			 * System.out.println(userlist.get(1).getUsername());
			 * System.out.println(userlist.get(2).getUsername());
			 * System.out.println(userlist.get(3).getUsername());
			 * System.out.println(userlist.get(4));
			 */
			request.getRequestDispatcher("cart.jsp").forward(request, response);
			//response.sendRedirect("http://localhost:8081/E-BookStore/adminlogin?reqType=3");
			con.close();
		} catch (Exception e) {
			System.out.println(e);

		}
		
		
	}
	
	
private void deleteCart(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("qwerty");
		
		int isDeleted = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			
			String cartId = request.getParameter("id");
			String username = request.getParameter("username"); 
			conn = DatabaseUtils.getDBConnection();
			
			stmt = conn.prepareStatement("DELETE FROM cart where cartId=?");
			stmt.setString(1, cartId);
			isDeleted = stmt.executeUpdate();
			
			
			if(isDeleted>0) {
				System.out.print(isDeleted+"records deleted from cart");
			}
			request.getRequestDispatcher("/CartServlet?reqType=1&username="+username).forward(request, response);
			//response.sendRedirect("http://localhost:8081/E-BookStore/CartServlet?username='"+username+"'&reqType=1");
			
			
		}catch (Exception e) {
			e.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		}finally {
			DatabaseUtils.closeDbConnection(conn);
			
		}
		
	}

	private void countItem(HttpServletRequest request, HttpServletResponse response) {
		
		Map<String, String> responseObj = null;
		try {
			
			String username = request.getParameter("username");
			responseObj = new HashMap<String, String>();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "welcome");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(" SELECT SUM(quantity) AS cartItems FROM cart where username = '"+username+"'");
			// request.setAttribute("rs", rs);
			int cartItems=0;
			while (rs.next()) {

				cartItems = rs.getInt("cartItems");
				// System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getInt(3));
			}
			//request.setAttribute("cartItems", cartItems);
			responseObj.put("cartItems", Integer.toString(cartItems));
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(new Gson().toJson(responseObj));
			System.out.println(cartItems);
			
			//request.getRequestDispatcher("cart.jsp").forward(request, response);
			//response.sendRedirect("http://localhost:8081/E-BookStore/adminlogin?reqType=3");
			con.close();
		} catch (Exception e) {
			System.out.println(e);

		}
		
	}
	
	
	private void updateFromCart(HttpServletRequest request, HttpServletResponse response) {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		String query = null;
		
		try {
			
			String bookId = request.getParameter("bookId");
			String username = request.getParameter("username");
			int qty = Integer.parseInt(request.getParameter("quantity"));
			double price = Double.parseDouble(request.getParameter("price"));
			
			
			Cart cart = new Cart();
			
			cart.setBookId(Integer.parseInt(bookId));
			cart.setPrice(price);
			cart.setQuantity(qty);
			cart.setUsername(username);
			cart.setTotalPrice(qty*price);
			
			conn = DatabaseUtils.getDBConnection();
				
					query = "UPDATE cart SET quantity = ?, totalPrice = ?,updatedDate = ?,updatedBy = ? WHERE bookId = ? AND username = ?";
					stmt = conn.prepareStatement(query);
					stmt.setString(1, Integer.toString(cart.getQuantity()));
					stmt.setString(2,
							Double.toString(cart.getPrice() * (cart.getQuantity())));
					stmt.setDate(3, getCurrentDate());
					stmt.setString(4, null);
					stmt.setString(5, bookId);
					stmt.setString(6, username);
					int isUpdated = stmt.executeUpdate();

					if (isUpdated > 0) {
						System.out.println(" records updated successfully");
					}else {
						
						System.out.println(" error occoured");
					}
				
				
			
			request.getRequestDispatcher("/CartServlet?reqType=1&username='"+username+"'").forward(request, response);
			
		}catch (Exception e) {
			e.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		}finally {
			DatabaseUtils.closeDbConnection(conn);
			//request.getRequestDispatcher("/EditUserForm").forward(request, response);
			
		}
		
	}
	

}
