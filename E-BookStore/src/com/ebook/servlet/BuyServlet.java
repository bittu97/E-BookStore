package com.ebook.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebook.model.Book;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/BuyServlet")
public class BuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
 
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
		
		
		
		try {
			
			String bookId = request.getParameter("bookId");
			//String username = request.getParameter("username");
			int qty = Integer.parseInt(request.getParameter("quantity"));
			double price = Double.parseDouble(request.getParameter("price"));
			Book book = new Book();
			book.setBookId("".equals(bookId) ? null : Integer.parseInt(bookId));
			book.setQuantity(qty);
			book.setPrice(price);
			
			request.setAttribute("book", book);
			//request.getRequestDispatcher("/buyorderform").forward(request, response);
			response.sendRedirect("buyorderform");
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			//request.getRequestDispatcher("/EditUserForm").forward(request, response);
			//request.getRequestDispatcher("buyorderform.jsp").forward(request, response);
			//response.sendRedirect("http://localhost:8081/E-BookStore/buyorderform.jsp");
		}
		
		
		//doGet(request, response);
	}

}
