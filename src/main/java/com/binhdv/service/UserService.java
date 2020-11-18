package com.binhdv.service;

import com.binhdv.dto.UserRegisterDTO;
import com.binhdv.entity.User;

import java.util.List;

public interface UserService {
    public User getUserById(int userId);
    public User getUserByUsername(String username);
    public int save(UserRegisterDTO userRegisterDTO);
    public void update(User user);
    public void addBookToCart(String username, int bookid);
    public void minus(String username, int bookid);
    public void delete(String username, int bookid);
    public void purchase(String username, int bookid);
    public void cancel(String username, int itemid);
    public List<User> getAllUsers();
}
