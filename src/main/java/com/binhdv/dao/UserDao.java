package com.binhdv.dao;

import com.binhdv.entity.User;

import java.util.List;

public interface UserDao {
    public User getUserById(int userId);
    public User getUserByUsername(String username);
    public int save(User user);
    public void update(User user);
    public List<User> getAllUsers();
}
