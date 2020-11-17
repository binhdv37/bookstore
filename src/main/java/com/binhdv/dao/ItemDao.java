package com.binhdv.dao;

import com.binhdv.entity.Item;

public interface ItemDao {
    public Item getItemById(int itemId);
    public void update(Item item);
    public int save(Item item);
    public void delete(int itemId);
}
