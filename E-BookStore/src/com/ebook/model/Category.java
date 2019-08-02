package com.ebook.model;

import java.sql.Date;

public class Category {
	
	private Integer categoryId;
	private String categoryName;
	private String status;
	private String description;
	private Date createdDate;
    private String createdBy;
    private Date updatedDate;
    private String updatedBy;
    
    
    public Integer getCategoryId() {
        return categoryId;
    }
 
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    
    
    public String getCategoryName() {
        return categoryName;
    }
 
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
    
    
    public String getStatus() {
        return status;
    }
 
    public void setStatus(String status) {
        this.status = status;
    }
    
    
    public String getDescription() {
        return description;
    }
 
    public void setDescription(String description) {
        this.description = description;
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
