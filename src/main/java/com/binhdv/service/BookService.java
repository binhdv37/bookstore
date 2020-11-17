package com.binhdv.service;

import com.binhdv.dto.BookDTO;
import com.binhdv.entity.Book;

import java.util.List;

public interface BookService {
    public Book getBookById(int bookid);
    public List<Book> getAllBook();
    public void save(BookDTO bookDTO);
    public void update(BookDTO bookDTO);
    public void delete(int bookid);
}
