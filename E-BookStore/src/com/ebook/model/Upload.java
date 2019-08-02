package com.ebook.model;

import java.sql.Date;

public class Upload {

	private Integer uploadId;
	private Integer bookId;
	private String fileName;
	private String status;
	private String filePath;
	private Date createdDate;
    private String createdBy;
    private Date updatedDate;
    private String updatedBy;
    
    
    public Integer getUploadId() {
        return uploadId;
    }
 
    public void setUploadId(Integer uploadId) {
        this.uploadId = uploadId;
    }
    
    
    
    
    public Integer getBookId() {
        return bookId;
    }
 
    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }
    
    
    
    public String getFileName() {
        return fileName;
    }
 
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    
    
    
    public String getFilePath() {
        return filePath;
    }
 
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
    
    
    
    public String getStatus() {
        return status;
    }
 
    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
    public Date getCreatedDate() {
        return createdDate;
    }
 
    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }
    
    
    
    public String getCreatedBy() {
        return createdBy;
    }
 
    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }
    
    
    
    public Date getUpdatedDate() {
        return updatedDate;
    }
 
    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }
    
    
    
    public String getUpdatedBy() {
        return updatedBy;
    }
 
    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }

}
