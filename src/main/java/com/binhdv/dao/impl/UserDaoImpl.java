package com.binhdv.dao.impl;

import com.binhdv.dao.UserDao;
import com.binhdv.entity.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

    @Autowired
    public SessionFactory sessionFactory;

    @Override
    public User getUserById(int userId) {
        return sessionFactory.getCurrentSession().get(User.class, userId);
    }

    @Override
    public User getUserByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from Users where username = :username";
        Query<User> query = session.createQuery(sql);
        query.setParameter("username", username);
        List<User> list = query.list();
        if(list.size()==0) return null;
        return list.get(0);
    }

    @Override
    public int save(User user) {
        return (Integer)sessionFactory.getCurrentSession().save(user);
    }

    @Override
    public void update(User user) {
        sessionFactory.getCurrentSession().update(user);
    }

    @Override
    public List<User> getAllUsers() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from Users ";
        Query<User> query = session.createQuery(sql);
        return query.list();
    }

}
