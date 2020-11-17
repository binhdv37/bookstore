package com.binhdv.controller;

import com.binhdv.dto.UserLoginDTO;
import com.binhdv.dto.UserRegisterDTO;
import com.binhdv.entity.Item;
import com.binhdv.entity.User;
import com.binhdv.service.BookService;
import com.binhdv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    BookService bookService;

    @Autowired
    UserService userService;

    public boolean isLogin(HttpSession session){
        if(session==null) return false;
        if(session.getAttribute("user")!=null) return true;
        return false;
    }

    @GetMapping("/")
    public String index(){
        return "pages/index";
    }

    @GetMapping("/home")
    public String home(){
        return "pages/index";
    }

    @GetMapping("/product")
    public String product(Model m){
        /*
            - get all book, return
         */
        m.addAttribute("books", bookService.getAllBook());
        return "pages/product";
    }

    @GetMapping("/login")
    public String login(HttpSession session, Model m){
        if(isLogin(session)) return "redirect:/home";

        m.addAttribute("user", new UserLoginDTO());
        return "pages/login";
    }

    @PostMapping("/login")
    public String login(HttpSession session,
                        @ModelAttribute("user") @Valid UserLoginDTO userLoginDTO,
                        BindingResult br,
                        HttpServletRequest request){
        if(isLogin(session)) return "redirect:/home";
        if(br.hasErrors()){
            return "pages/login";
        }
        else{
            String username = userLoginDTO.getUsername();
            String password = userLoginDTO.getPassword();

            User user = userService.getUserByUsername(username);

            if(user!=null && user.getPassword().equals(password)){
                session.setAttribute("user", user);
                return "redirect:/home";
            }
            else{
                String errMessage = "Username or password is not correct. Please try again!";
                request.setAttribute("errMessage", errMessage);
                return "pages/login";
            }
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/home";
    }

    @GetMapping("/register")
    public String register(Model m, HttpSession session){
        if(isLogin(session)) return "redirect:/home";

        m.addAttribute("user", new UserRegisterDTO());
        return "pages/register";
    }

    @PostMapping("/register")
    public String register(HttpSession session,
                           @ModelAttribute("user") @Valid UserRegisterDTO userRegisterDTO,
                           BindingResult br,
                           HttpServletRequest request){
        if(isLogin(session)) return "redirect:/home";

        if(br.hasErrors()){
            return "pages/register";
        }
        else{
            String username = userRegisterDTO.getUsername();
            User user = userService.getUserByUsername(username);

            if(user!=null){
                String errMessage = "Username already exist. Please try a different one !";
                request.setAttribute("errMessage", errMessage);
                return "pages/register";
            }
            else{
                userService.save(userRegisterDTO);
                return "redirect:/login";
            }
        }
    }

    @GetMapping("/shoppingcart")
    public String cart(HttpSession session, HttpServletRequest request){
        if(!isLogin(session)) return "redirect:/login";

        User user = (User)session.getAttribute("user");
        List<Item> list = new ArrayList<Item>();
        for(Item item : user.getItemList()){
            if(item.getStatus()==0){
                list.add(item);
            }
        }
        request.setAttribute("itemList", list);
        return "pages/shoppingcart";
    }

    @GetMapping("/order-{status}")
    public String order(HttpSession session, HttpServletRequest request, @PathVariable("status")int status){
        if(!isLogin(session)) return "redirect:/login";

        User user = (User)session.getAttribute("user");
        List<Item> list = new ArrayList<Item>();

        //status = 2 : delivering
        if(status==2){
            for(Item item : user.getItemList()){
                if(item.getStatus()==2){
                    list.add(item);
                }
            }
            request.setAttribute("itemList", list);
            return "pages/order2";
        }

        //status = 3 : delivered
        if(status==3){
            for(Item item : user.getItemList()){
                if(item.getStatus()==3){
                    list.add(item);
                }
            }
            request.setAttribute("itemList", list);
            return "pages/order3";
        }

        //status = 4 : canceled
        if(status==4){
            for(Item item : user.getItemList()){
                if(item.getStatus()==4){
                    list.add(item);
                }
            }
            request.setAttribute("itemList", list);
            return "pages/order4";
        }

        //else : (status ==1 or else)
        for(Item item : user.getItemList()){
            if(item.getStatus()==1){
                list.add(item);
            }
        }
        request.setAttribute("itemList", list);
        return "pages/order1";
    }



}
