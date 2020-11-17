package com.binhdv.service.impl;

import com.binhdv.dao.ItemDao;
import com.binhdv.entity.Item;
import com.binhdv.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ItemServiceImpl implements ItemService {

    @Autowired
    ItemDao itemDao;

    @Override
    public void update(Item item) {
         itemDao.update(item);
    }

    @Override
    public int save(Item item) {
        return itemDao.save(item);
    }

    @Override
    public void delete(int itemId) {
        itemDao.delete(itemId);
    }

    @Override
    public Item getItemById(int itemId) {
        return itemDao.getItemById(itemId);
    }
}
