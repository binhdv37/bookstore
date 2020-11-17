package com.binhdv.service.impl;

import com.binhdv.dao.UserDao;
import com.binhdv.dto.UserRegisterDTO;
import com.binhdv.entity.Book;
import com.binhdv.entity.Item;
import com.binhdv.entity.User;
import com.binhdv.service.BookService;
import com.binhdv.service.ItemService;
import com.binhdv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    @Autowired
    BookService bookService;

    @Autowired
    ItemService itemService;

    public User convertToEntity(UserRegisterDTO userRegisterDTO){
        User user = new User();
        user.setUsername(userRegisterDTO.getUsername());
        user.setPassword(userRegisterDTO.getPassword());
        user.setFullname(userRegisterDTO.getFullname());
        user.setPhone(userRegisterDTO.getPhone());
        user.setAddress(userRegisterDTO.getAddress());

        return user;
    }

    @Override
    public User getUserById(int userId) {
        return userDao.getUserById(userId);
    }

    @Override
    public User getUserByUsername(String username) {
        return userDao.getUserByUsername(username);
    }

    @Override
    public int save(UserRegisterDTO userRegisterDTO) {
        return userDao.save(convertToEntity(userRegisterDTO));
    }

    @Override
    public void update(User user) {
        userDao.update(user);
    }

    @Override
    public void addBookToCart(User user, int bookid) {
        /*
        todo :
            - check if book exist in cart
            - true => plusbook
            - false => create new item, add item
            - change db
         */

        Book book = bookService.getBookById(bookid);
        if(book==null) return;

        boolean bookExistInCart = false;

        //find item, exist => change quatity
        for(Item item : user.getItemList()){
            if(item.getBook().getId()==bookid && item.getStatus()==0){
                bookExistInCart = true;
                item.setQuantity(item.getQuantity()+1);
                item.setTotalprice(item.getTotalprice()+item.getBook().getPrice());
                itemService.update(item);
            }
        }

        //book did not exist in cart
        if(bookExistInCart==false){
            //create new item :
            Item item = new Item();
            item.setBook(book);
            item.setQuantity(1);
            item.setTotalprice(book.getPrice());
            item.setStatus(0);

            itemService.save(item);
            user.getItemList().add(item);
            update(user);
        }

    }

    @Override
    public void minus(User user, int bookid) {
        //find item, exist => change quatity
        for(Item item : user.getItemList()){
            if(item.getBook().getId()==bookid && item.getStatus()==0 && item.getQuantity()>1){
                item.setQuantity(item.getQuantity() - 1);
                item.setTotalprice(item.getTotalprice() - item.getBook().getPrice());
                itemService.update(item);
            }
        }
    }

    @Override
    public void delete(User user, int bookid) {
        //find item, delete
        int x = -1;
        int itemId = -1;
        List<Item> itemList = user.getItemList();
        //find item
        for(int i=0; i<itemList.size(); i++){
            if(itemList.get(i).getStatus()==0 && itemList.get(i).getBook().getId()==bookid){
                x = i;
                itemId = itemList.get(i).getId();
            }
        }
        if(x==-1) return;

        user.getItemList().remove(x);

        //update db :
        User user1 = getUserById(user.getId());
        user1.getItemList().remove(x);
        update(user1);
        itemService.delete(itemId);
    }

    @Override
    public void purchase(User user, int bookid) {
        //find item, change status.
        int itemid = -1;

        //find item :
        for(Item item : user.getItemList()){
            if(item.getStatus()==0 && item.getBook().getId()==bookid){
                item.setStatus(1);
                itemid = item.getId();
            }
        }

        if(itemid==-1)return;

        //update db :
        Item item = itemService.getItemById(itemid);
        item.setStatus(1);
        itemService.update(item);
    }

    @Override
    public void cancel(User user, int itemid) {
        //find item, change status to 4
        for(Item item : user.getItemList()){
            if(item.getId()==itemid && item.getStatus()==1){
                item.setStatus(4);
            }
        }

        //update db :
        Item item = itemService.getItemById(itemid);
        item.setStatus(4);
        itemService.update(item);
    }


}
