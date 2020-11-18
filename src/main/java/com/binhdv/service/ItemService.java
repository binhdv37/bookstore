package com.binhdv.service;

import com.binhdv.entity.Item;

import java.util.Date;

public interface ItemService {
    public void update(Item item);
    public int save(Item item);
    public void delete(int itemId);
    public Item getItemById(int itemId);
    //confirm order
    public void confirm(int itemid, int intendShiptime);
    public void confirmDelivered(int itemid);

}
