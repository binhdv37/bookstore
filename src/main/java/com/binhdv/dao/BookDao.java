package com.binhdv.dao;

import com.binhdv.entity.Book;

import java.util.List;

public interface BookDao {
    public Book getBookById(int bookid);
    public List<Book> getAllBook();
    public void save(Book book);
    public void update(Book book);
    public void delete(int bookid);
}
