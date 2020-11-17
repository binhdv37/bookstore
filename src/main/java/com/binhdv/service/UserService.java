package com.binhdv.service;

import com.binhdv.dto.UserRegisterDTO;
import com.binhdv.entity.User;

public interface UserService {
    public User getUserById(int userId);
    public User getUserByUsername(String username);
    public int save(UserRegisterDTO userRegisterDTO);
    public void update(User user);
    public void addBookToCart(User user, int bookid);
    public void minus(User user, int bookid);
    public void delete(User user, int bookid);
    public void purchase(User user, int bookid);
    public void cancel(User user, int itemid);
}
