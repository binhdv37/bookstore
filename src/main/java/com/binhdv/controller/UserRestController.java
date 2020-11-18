package com.binhdv.controller;

import com.binhdv.entity.User;
import com.binhdv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;

@RestController
public class UserRestController {

    @Autowired
    public UserService userService;

    public boolean isLogin(HttpSession session){
        if(session==null) return false;
        if(session.getAttribute("username")!=null) return true;
        return false;
    }

    @GetMapping("/addtocart")
    public String addtocart(HttpSession session, @RequestParam("book") int bookid){
        if(!isLogin(session)) return "false";

        String username = (String)session.getAttribute("username");
        userService.addBookToCart(username, bookid);
        return "ok";
    }

    @GetMapping("/minus")
    public String minus(HttpSession session, @RequestParam("book")int bookid){
        if(!isLogin(session)) return "false";

        String username = (String)session.getAttribute("username");
        userService.minus(username, bookid);
        return "ok";

    }

    @GetMapping("/delete")
    public String delete(HttpSession session, @RequestParam("book")int bookid){
        if(!isLogin(session)) return "false";

        String username = (String)session.getAttribute("username");
        userService.delete(username, bookid);
        return "ok";
    }

    @GetMapping("/purchase")
    public String purchase(HttpSession session, @RequestParam("book")int bookid){
        if(!isLogin(session)) return "false";

        String username = (String)session.getAttribute("username");
        userService.purchase(username, bookid);
        return "ok";
    }

    @GetMapping("/cancel")
    public String cancel(HttpSession session, @RequestParam("item")int itemid){
        if(!isLogin(session)) return "false";

        String username = (String)session.getAttribute("username");
        userService.cancel(username, itemid);
        return "ok";
    }

}
