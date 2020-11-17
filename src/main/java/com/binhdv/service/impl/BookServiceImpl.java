package com.binhdv.service.impl;

import com.binhdv.dao.BookDao;
import com.binhdv.dto.BookDTO;
import com.binhdv.entity.Book;
import com.binhdv.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    BookDao bookDao;

    public Book convertToEntity(BookDTO bookDTO){
        Book book = new Book();
        book.setId(bookDTO.getId());
        book.setName(bookDTO.getName());
        book.setPrice(bookDTO.getPrice());
        book.setAuthor(bookDTO.getAuthor());
        book.setInfo(bookDTO.getInfo());
        book.setImgurl(bookDTO.getImgurl());

        return book;
    }

    @Override
    public Book getBookById(int bookid) {
        return bookDao.getBookById(bookid);
    }

    @Override
    public List<Book> getAllBook() {
        return bookDao.getAllBook();
    }

    @Override
    public void save(BookDTO bookDTO) {
        bookDao.save(convertToEntity(bookDTO));
    }

    @Override
    public void update(BookDTO bookDTO) {
        bookDao.update(convertToEntity(bookDTO));
    }

    @Override
    public void delete(int bookid) {
        bookDao.delete(bookid);
    }
}
