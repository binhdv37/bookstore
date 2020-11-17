package com.binhdv.dao.impl;

import com.binhdv.dao.ItemDao;
import com.binhdv.entity.Item;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ItemDaoImpl implements ItemDao {

    @Autowired
    SessionFactory sessionFactory;

    @Override
    public Item getItemById(int itemId) {
        return sessionFactory.getCurrentSession().get(Item.class, itemId);
    }

    @Override
    public void update(Item item) {
        sessionFactory.getCurrentSession().update(item);
    }

    @Override
    public int save(Item item) {
        return (Integer)sessionFactory.getCurrentSession().save(item);
    }

    @Override
    public void delete(int itemId) {
        sessionFactory.getCurrentSession().delete(getItemById(itemId));
    }

}
