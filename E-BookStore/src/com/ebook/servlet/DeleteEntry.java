package com.ebook.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ebook.utils.DatabaseUtils;

/**
 * Servlet implementation class DeleteEntry
 */
@WebServlet("/DeleteEntry")
public class DeleteEntry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteEntry() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
			
			
		}catch (Exception e) {
			e.printStackTrace();
			DatabaseUtils.closeDbConnection(conn);
		}finally {
			DatabaseUtils.closeDbConnection(conn);
			request.getRequestDispatcher("/UserServlet").forward(request, response);
		}
		
	}

}
