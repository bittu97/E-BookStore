package com.ebook.model;

import java.sql.Date;

public class Book {
	
	private String uuid;
	private Integer bookId;
	private Integer categoryId;
	private String title;
	private String author;
	private String publisher;
	private String description;
	private String language;
	private String addition;
	private int pages;
	private String isbn;
	private double price;
	private int quantity;
	private Date createdDate;
    private String createdBy;
    private Date updatedDate;
    private String updatedBy;
	
	
    public String getUuid() {
        return uuid;
    }
 
    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
    
    
	public Integer getBookId() {
        return bookId;
    }
 
    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }
    
    
    public Integer getCategoryId() {
        return categoryId;
    }
 
    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
    
    
    public String getTitle() {
        return title;
    }
 
    public void setTitle(String title) {
        this.title = title;
    }
    
    
    public String getAuthor() {
        return author;
    }
 
    public void setAuthor(String author) {
        this.author = author;
    }
    
    
    public String getPublisher() {
        return publisher;
    }
 
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }
    
    
    public String getDescription() {
        return description;
    }
 
    public void setDescription(String description) {
        this.description = description;
    }
    
    
    public String getLanguage() {
        return language;
    }
 
    public void setLanguage(String language) {
        this.language = language;
    }
    
    
    public String getAddition() {
        return addition;
    }
 
    public void setAddition(String addition) {
        this.addition = addition;
    }
    
    
    public int getPages() {
        return pages;
    }
 
    public void setPages(int pages) {
        this.pages = pages;
    }
    
    
    public String getIsbn() {
        return isbn;
    }
 
    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }
    
    
    public double getPrice() {
        return price;
    }
 
    public void setPrice(double price) {
        this.price = price;
    }
    
    
    public int getQuantity() {
        return quantity;
    }
 
    public void setQuantity(int quantity) {
        this.quantity = quantity;
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
