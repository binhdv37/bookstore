package com.binhdv.dao.impl;

import com.binhdv.dao.BookDao;
import com.binhdv.entity.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class BookDaoImpl implements BookDao {

    @Autowired
    public SessionFactory sessionFactory;

    @Override
    public Book getBookById(int bookid) {
        return sessionFactory.getCurrentSession().get(Book.class, bookid);
    }

    @Override
    public List<Book> getAllBook() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from Book";
        Query<Book> query = session.createQuery(sql);
        return query.list();
    }

    @Override
    public void save(Book book) {
        sessionFactory.getCurrentSession().save(book);
    }

    @Override
    public void update(Book book) {
        sessionFactory.getCurrentSession().merge(book);
    }

    @Override
    public void delete(int bookid) {
        sessionFactory.getCurrentSession().delete(getBookById(bookid));
    }


}
