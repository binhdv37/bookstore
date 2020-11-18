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

import java.util.Date;
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
    public void addBookToCart(String username, int bookid) {
        /*
        todo :
            - check if book exist in cart
            - true => plusbook
            - false => create new item, add item
            - change db
         */

        Book book = bookService.getBookById(bookid);
        if(book==null) return;


        User user = getUserByUsername(username);

        //find item, exist => change quatity
        for(Item item : user.getItemList()){
            if(item.getBook().getId()==bookid && item.getStatus()==0){
                item.setQuantity(item.getQuantity()+1);
                item.setTotalprice(item.getTotalprice()+item.getBook().getPrice());
                itemService.update(item);
                return;
            }
        }

        //book did not exist in cart
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

    @Override
    public void minus(String username, int bookid) {
        User user = getUserByUsername(username);

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
    public void delete(String username, int bookid) {
        User user = getUserByUsername(username);
        List<Item> itemList = user.getItemList();

        int position = -1;
        int itemid = -1;

        //find item
        for(int i=0 ; i<itemList.size(); i++){
            if(itemList.get(i).getStatus()==0 && itemList.get(i).getBook().getId()==bookid){
                position = i;
                itemid = itemList.get(i).getId();
            }
        }

        if(position==-1)return;

        //delete item :
        itemList.remove(itemList.get(position));
        update(user);
        itemService.delete(itemid);

    }

    @Override
    public void purchase(String username, int bookid) {
        User user = getUserByUsername(username);

        //find item, change status.

        Date placedtime = new Date();

        //find item :
        for(Item item : user.getItemList()){
            if(item.getStatus()==0 && item.getBook().getId()==bookid){
                item.setStatus(1);
                item.setPlacedTime(placedtime);
                itemService.update(item);
                return;
            }
        }

    }

    @Override
    public void cancel(String username, int itemid) {
        User user = getUserByUsername(username);

        //find item, change status to 4
        for(Item item : user.getItemList()){
            if(item.getId()==itemid && item.getStatus()==1){
                item.setStatus(4);
                item.setCancelTime(new Date());
                itemService.update(item);
                return;
            }
        }
    }

    @Override
    public List<User> getAllUsers() {
        return userDao.getAllUsers();
    }


}
