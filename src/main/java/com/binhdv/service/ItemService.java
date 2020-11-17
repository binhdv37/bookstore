package com.binhdv.service;

import com.binhdv.entity.Item;

public interface ItemService {
    public void update(Item item);
    public int save(Item item);
    public void delete(int itemId);
    public Item getItemById(int itemId);
}
