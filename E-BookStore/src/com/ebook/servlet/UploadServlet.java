package com.ebook.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ebook.model.Upload;
import com.ebook.utils.DatabaseUtils;



/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/uploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static java.sql.Date getCurrentDate() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}

	private final String UPLOAD_DIRECTORY = "C:\\Users\\hp\\eclipse-workspace\\E-BookStore\\WebContent\\images";  //"F:/uploads";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				String fileName="";
				String filePath="";
				String uuid = null;
				for (FileItem item : multiparts) {
					if ("uuid".equals(item.getFieldName())) {
						uuid = item.getString();
					}
					System.out.println(uuid);
					if (!item.isFormField()) {
						String name = new File(item.getName()).getName();
						fileName = name;
						item.write(new File(UPLOAD_DIRECTORY + File.separator + name));
						filePath = UPLOAD_DIRECTORY + File.separator + name;
					}
				}

				// File uploaded successfully
				request.setAttribute("message", "File Uploaded Successfully");
				
				int isInserted = 0;
				
				Connection conn = null;
				PreparedStatement stmt = null;
				
				
				conn = DatabaseUtils.getDBConnection();
				
				String que = "select bookId from books where uuid = '"+uuid+"'";
				Statement stmt1 = conn.createStatement();
				ResultSet rs = stmt1.executeQuery(que);
				int bookId=0;
				while(rs.next()) {
					 bookId = rs.getInt("bookId");
				}
				
				Upload upload = new Upload();
				upload.setBookId(bookId);
				upload.setFileName(fileName);
				upload.setStatus("ACTIVE");
				upload.setFilePath(filePath);
				
				conn = DatabaseUtils.getDBConnection();
				
				stmt = conn.prepareStatement(
						"INSERT INTO upload(bookId,fileName,status,filePath,createdDate,createdBy,updatedDate,updatedBy) VALUES(?,?,?,?,?,?,?,?)");
				
				stmt.setString(1, Integer.toString(upload.getBookId()));
				stmt.setString(2, upload.getFileName());
				stmt.setString(3, upload.getStatus());
				stmt.setString(4, upload.getFilePath());
				stmt.setDate(5, getCurrentDate());
				stmt.setString(6, null);
				stmt.setDate(7, getCurrentDate());
				stmt.setString(8, null);
				
				
				isInserted = stmt.executeUpdate();

				System.out.println(isInserted + " records inserted in upload table");
				
				
				response.sendRedirect("http://localhost:8081/E-BookStore/BookServlet?reqType=3");
				//request.getRequestDispatcher("/BookServlet?reqType=3").forward(request, response);
				
			} catch (Exception ex) {
				System.out.println(ex.getMessage());
				request.setAttribute("message", "File Upload Failed due to " + ex);
			}

		} else {
			request.setAttribute("message", "Sorry this Servlet only handles file upload request");
		}
	}

}
