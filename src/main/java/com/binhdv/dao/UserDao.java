package com.binhdv.dao;

import com.binhdv.entity.User;

public interface UserDao {
    public User getUserById(int userId);
    public User getUserByUsername(String username);
    public int save(User user);
    public void update(User user);
}
