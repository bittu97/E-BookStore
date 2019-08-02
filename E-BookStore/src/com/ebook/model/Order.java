package com.ebook.model;

import java.sql.Date;

public class Order {
	
	private Integer orderId;
	private Integer userId;
	private String fullName;
	private String emailId;
	private String address;
	private String city;
	private String state;
	private Integer zip;
	private Date createdDate;
    private String createdBy;
    private Date updatedDate;
    private String updatedBy;
    
    
    public Integer getOrderId() {
        return orderId;
    }
 
    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }
    
    
    public int getUserId() {
        return userId;
    }
 
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    
    
    
    public String getFullName() {
        return fullName;
    }
 
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    
    
    public String getEmailId() {
        return emailId;
    }
 
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    
    
    
    public String getAddress() {
        return address;
    }
 
    public void setAddress(String address) {
        this.address = address;
    }
    
    
    
    public String getCity() {
        return city;
    }
 
    public void setCity(String city) {
        this.city = city;
    }
    
    
    
    public String getState() {
        return state;
    }
 
    public void setState(String state) {
        this.state = state;
    }
    
    
    
    public Integer getZip() {
        return zip;
    }
 
    public void setZip(Integer zip) {
        this.zip = zip;
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
