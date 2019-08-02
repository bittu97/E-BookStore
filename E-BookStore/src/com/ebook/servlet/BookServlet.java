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
import com.ebook.model.Category;
import com.ebook.model.User;
import com.ebook.utils.DatabaseUtils;
import com.google.gson.Gson;
import java.util.UUID;
/**
 * Servlet implementation class BookServlet
 */
@WebServlet("/BookServlet")
public class BookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reqType = request.getParameter("reqType");
		if (reqType != null && !"".equals(reqType)) {
			int caseType = Integer.parseInt(reqType);
			switch (caseType) {
			case 1:
				deleteBook(request, response);
				break;
			case 2:
				editBook(request, response);
				break;
			case 3:
				viewBook(request, response);
				break;
			case 4:
				getCategories(request, response);
				break;
			default:
				System.out.println("No data available!!!");
			}
		}else {
			viewBook(request, response);
		}
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
				saveBook(request, response);
				break;
			case 2:
				updateBook(request, response);
				break;
			case 3:
				//deleteUser(request, response);
				break;
			default:
				System.out.println("No data available!!!");
			}
		}
		
	}
	
	
	private void getCategories(HttpServletRequest request, HttpServletResponse response) {
		
		String query = "select * from category where status='ACTIVE'";
		ArrayList<Category> categories = new ArrayList<Category>();
		Connection conn = null;
		try {
			conn = DatabaseUtils.getDBConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				Category category = new Category();
				category.setCategoryId(rs.getInt("categoryId"));
				category.setCategoryName(rs.getString("categoryName"));
				categories.add(category);
			}
			rs.close();
			request.setAttribute("categories", categories);
			request.getRequestDispatcher("addbook.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println(e);

		}finally {
			DatabaseUtils.closeDbConnection(conn);
		}
	}
	
	private void saveBook(HttpServletRequest request, HttpServletResponse response) {
		int isInserted = 0;
		//Map<String, String> responseObj = null;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			
			String categoryId = request.getParameter("categoryId");
			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			String description = request.getParameter("description");
			String language = request.getParameter("language");
			String addition = request.getParameter("addition");
			String pages = request.getParameter("pages");
			String isbn = request.getParameter("isbn");
			String price = request.getParameter("price");
			String quantity = request.getParameter("quantity");
			
			Book book = new Book();
			book.setCategoryId(Integer.parseInt(categoryId));
			book.setTitle(title);
			book.setAuthor(author);
			book.setPublisher(publisher);
			book.setDescription(description);
			book.setLanguage(language);
			book.setAddition(addition);
			book.setPages(Integer.parseInt(pages));
			book.setIsbn(isbn);
			book.setPrice(Double.parseDouble(price));
			book.setQuantity(Integer.parseInt(quantity));
			
			
			conn = DatabaseUtils.getDBConnection();
			stmt = conn.prepareStatement(
					"INSERT INTO books(categoryId,title,author,publisher,description,language,addition,pages,isbn,price,quantity,createdDate,createdBy,updatedDate,updatedBy,uuid) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			stmt.setString(1, Integer.toString(book.getCategoryId()));
			stmt.setString(2, book.getTitle());
			stmt.setString(3, book.getAuthor());
			stmt.setString(4, book.getPublisher());
			stmt.setString(5, book.getDescription());
			stmt.setString(6, book.getLanguage());
			stmt.setString(7, book.getAddition());
			stmt.setString(8, Integer.toString(book.getPages()));
			stmt.setString(9, book.getIsbn());
			stmt.setString(10, Double.toString(book.getPrice()));
			stmt.setString(11, Integer.toString(book.getQuantity()));
			stmt.setDate(12, getCurrentDate());
			stmt.setString(13, null);
			stmt.setDate(14, getCurrentDate());
			stmt.setString(15, null);
			
			UUID uuid1 = UUID.randomUUID();
	        String uuid = uuid1.toString();
	        
	        System.out.print(uuid);;
	        
	        stmt.setString(16, uuid);

			isInserted = stmt.executeUpdate();

			System.out.println(isInserted + " records inserted in books table");
			
			request.setAttribute("uuid", uuid);
			request.getRequestDispatcher("uploadform.jsp").forward(request, response);
			
			//request.getRequestDispatcher("/BookServlet?reqType=3").forward(request, response);
			//response.sendRedirect("http://localhost:8081/E-BookStore/BookServlet?reqType=3");
			//response.sendRedirect("http://localhost:8081/E-BookStore/uploadform.jsp?uuid='"+uuid+"'");

		} catch (Exception ex) {
			ex.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		} finally {
			DatabaseUtils.closeDbConnection(conn);
		}
	}
	
	
	private void viewBook(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<Book> booklist = new ArrayList<Book>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook", "root", "welcome");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from books");
			// request.setAttribute("rs", rs);
			while (rs.next()) {
				Book book = new Book();

				book.setBookId(rs.getInt("bookId"));
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

				booklist.add(book);
				// System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getInt(3));
			}
			request.setAttribute("booklist", booklist);
			System.out.println(booklist);
			/*
			 * System.out.println(userlist.size());
			 * System.out.println(userlist.get(1).getUsername());
			 * System.out.println(userlist.get(2).getUsername());
			 * System.out.println(userlist.get(3).getUsername());
			 * System.out.println(userlist.get(4));
			 */
			request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
			//response.sendRedirect("http://localhost:8081/E-BookStore/adminlogin?reqType=3");
			con.close();
		} catch (Exception e) {
			System.out.println(e);

		}
		
	}
	
	
	private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("qwerty");
		
		int isDeleted = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			
			String bookId = request.getParameter("id");
			conn = DatabaseUtils.getDBConnection();
			
			stmt = conn.prepareStatement("DELETE FROM books where bookId=?");
			stmt.setString(1, bookId);
			isDeleted = stmt.executeUpdate();
			
			
			if(isDeleted>0) {
				System.out.print(isDeleted+"records deleted from books");
			}
			request.getRequestDispatcher("/BookServlet?reqType=3").forward(request, response);
			
			
		}catch (Exception e) {
			e.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		}finally {
			DatabaseUtils.closeDbConnection(conn);
			
		}
		
	}
	
	
	private void editBook(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("qwerty");
		
		//int isEdited = 0;
		
		Connection conn = null;
		PreparedStatement stmt = null;
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
			request.getRequestDispatcher("editbookform.jsp").forward(request, response);
			
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
	
	
	private void updateBook(HttpServletRequest request, HttpServletResponse response) {
		int isUpdated = 0;

		Connection conn = null;
		PreparedStatement stmt = null;

		try {

			String title = request.getParameter("title");
			String author = request.getParameter("author");
			String publisher = request.getParameter("publisher");
			String description = request.getParameter("description");
			String language = request.getParameter("language");
			String addition = request.getParameter("addition");
			String pages = request.getParameter("pages");
			String isbn = request.getParameter("isbn");
			String price = request.getParameter("price");
			String quantity = request.getParameter("quantity");
			String bookId = request.getParameter("bookId");

			Book book = new Book();
			book.setTitle(title);
			book.setAuthor(author);
			book.setPublisher(publisher);
			book.setDescription(description);
			book.setLanguage(language);
			book.setAddition(addition);
			book.setPages(Integer.parseInt(pages));
			book.setIsbn(isbn);
			book.setPrice(Double.parseDouble(price));
			book.setQuantity(Integer.parseInt(quantity));

			conn = DatabaseUtils.getDBConnection();
			stmt = conn.prepareStatement(
					"UPDATE books SET title=?,author=?,publisher=?,description=?,language=?,addition=?,pages=?,isbn=?,price=?,quantity=?,updatedDate=?,updatedBy=? WHERE bookId=?");

			stmt.setString(1, book.getTitle());
			stmt.setString(2, book.getAuthor());
			stmt.setString(3, book.getPublisher());
			stmt.setString(4, book.getDescription());
			stmt.setString(5, book.getLanguage());
			stmt.setString(6, book.getAddition());
			stmt.setString(7, Integer.toString(book.getPages()));
			stmt.setString(8, book.getIsbn());
			stmt.setString(9, Double.toString(book.getPrice()));
			stmt.setString(10, Integer.toString(book.getQuantity()));
			stmt.setDate(11, getCurrentDate());
			stmt.setString(12, null);
			stmt.setString(13, bookId);

			isUpdated = stmt.executeUpdate();

			System.out.println(isUpdated + " records updated in books table");
			// request.getRequestDispatcher("viewusers.jsp").forward(request, response);
			response.sendRedirect("http://localhost:8081/E-BookStore/BookServlet?reqType=3");

		} catch (Exception ex) {
			ex.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		} finally {
			DatabaseUtils.closeDbConnection(conn);

		}
	}

}
