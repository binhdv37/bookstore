package com.binhdv.controller;

import com.binhdv.dto.AdminDTO;
import com.binhdv.dto.BookDTO;
import com.binhdv.entity.Book;
import com.binhdv.entity.Item;
import com.binhdv.entity.User;
import com.binhdv.service.BookService;
import com.binhdv.service.ItemService;
import com.binhdv.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpOutputMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.PastOrPresent;
import java.util.ArrayList;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    BookService bookService;

    @Autowired
    UserService userService;

    @Autowired
    ItemService itemService;

    public boolean isLogin(HttpSession session){
        if(session==null) return false;
        if(session.getAttribute("admin")!=null) return true;
        return false;
    }

    @GetMapping("/administrator")
    public String administrator(Model m, HttpSession session){
        if(isLogin(session)) return "redirect:/a-productmanager";
        m.addAttribute("admin", new AdminDTO());
        return "admin/loginForm";
    }

    @PostMapping("/administrator")
    public String administrator(@ModelAttribute("admin") @Valid AdminDTO adminDTO,
                                BindingResult br,
                                HttpServletRequest request,
                                HttpSession session){
        if(br.hasErrors()){
            return "admin/loginForm";
        }
        else{
            String username = adminDTO.getUsername();
            String password = adminDTO.getPassword();
            if(username.equals("binhdv")&&password.equals("123456")){
                session.setAttribute("admin", username);
                return "redirect:/a-productmanager";
            }
            else {
                String errMessage = "Username or password is not correct. Please try again !";
                request.setAttribute("errMessage", errMessage);
                return "admin/loginForm";
            }
        }
    }

    @GetMapping("/a-logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/administrator";
    }

    @GetMapping("/a-productmanager")
    public String productManager(HttpSession session, Model m){
        if(!isLogin(session)) return "redirect:/administrator";
        /*
        todo :
            - access db, get all product : list
            - m.setAttribute(list)
         */
        List<Book> books = bookService.getAllBook();
        m.addAttribute("books", books);
        return "admin/productManager";
    }

    @GetMapping("/a-addproduct")
    public String addProduct(HttpSession session, Model m){
        /*
        todo :
            - !isLogin => return redirect login form
            -  return "add form "
         */
        if(!isLogin(session)) return "redirect:/administrator";

        m.addAttribute("book", new BookDTO());
        return "admin/addProduct";
    }

    @PostMapping("/a-addproduct")
    public String addProduct(HttpSession session,
                             @ModelAttribute("book") @Valid BookDTO bookDTO,
                             BindingResult br){
        if(!isLogin(session)) return "redirect:/administrator";

        if(br.hasErrors()){
            return "admin/addProduct";
        }
        else{
            //save book, redirect productmanager
            bookService.save(bookDTO);
            return "redirect:/a-productmanager";
        }
    }

    @GetMapping("/a-editproduct")
    public String editproduct(HttpSession session, Model m, @RequestParam("book")int bookid){
        if(!isLogin(session)) return "redirect:/administrator";

        /*
            - book exist => return
            - else => redirect productmanager
         */

        Book book = bookService.getBookById(bookid);
        if(book==null) return "redirect:/a-productmanager";

        m.addAttribute("book", book);
        return "admin/editProduct";
    }

    @PostMapping("a-editproduct")
    public String editProduct(@ModelAttribute("book") @Valid BookDTO bookDTO,
                              HttpSession session,
                              BindingResult br){
        if(!isLogin(session)) return "redirect:/administrator";

        if(br.hasErrors()){
            return "admin/editProduct";
        }
        else{
            bookService.update(bookDTO);
            return "redirect:/a-productmanager";
        }

    }

    @GetMapping("/a-deleteproduct")
    public String deleteProduct(@RequestParam("book") int bookid, HttpSession session){
        if(!isLogin(session)) return "redirect:/administrator";

        bookService.delete(bookid);
        return "redirect:/a-productmanager";
    }

    @GetMapping("a-usermanager")
    public String userManager(HttpSession session, HttpServletRequest request){
        if(!isLogin(session)) return "redirect:/administrator";

        List<User> userList = userService.getAllUsers();
        request.setAttribute("userList", userList);
        return "admin/userManager";
    }

    @GetMapping("a-vieworder-{userid}-{status}")
    public String vieworder(HttpSession session,
                            @PathVariable("userid")int userid,
                            @PathVariable("status")int status,
                            HttpServletRequest request,
                            Model m){
        if(!isLogin(session)) return "redirect:/administrator";

        User user = userService.getUserById(userid);
        if(user==null) return "error/404";

        List<Item> itemList = new ArrayList<Item>();

        request.setAttribute("username", user.getUsername());
        request.setAttribute("userid", user.getId());
        //status=2 : delivering
        if(status==2){
            for(Item item : user.getItemList()){
                if(item.getStatus()==2) itemList.add(item);
            }
            request.setAttribute("itemList", itemList);
            return "admin/order2";
        }

        //status=3 : delivered
        if(status==3){
            for(Item item : user.getItemList()){
                if(item.getStatus()==3) itemList.add(item);
            }
            request.setAttribute("itemList", itemList);
            return "admin/order3";
        }

        //status=4 : canceled
        if(status==4){
            for(Item item : user.getItemList()){
                if(item.getStatus()==4) itemList.add(item);
            }
            request.setAttribute("itemList", itemList);
            return "admin/order4";
        }

        //status==1 or else : waiting for confirmation
        for(Item item : user.getItemList()){
            if(item.getStatus()==1) itemList.add(item);
        }
        request.setAttribute("itemList", itemList);
        return "admin/order1";
    }

    //confirm order
    @PostMapping("/a-confirm-{userid}-{itemid}")
    public String confirmOrder(HttpSession session,
                               @PathVariable("itemid")int itemid,
                               @PathVariable("userid")int userid,
                               @RequestParam("shiptime")int shiptime){
        if(!isLogin(session)) return "redirect:/administrator";

        //change status (1->2), add intend shiptime
        itemService.confirm(itemid, shiptime);
        return "redirect:/a-vieworder-"+String.valueOf(userid)+"-1";
    }

    //Confirm item delivered :
    @GetMapping("/a-confirmdelivered-{userid}-{itemid}")
    public String confirmDelivered(HttpSession session,
                                   @PathVariable("userid")int userid,
                                   @PathVariable("itemid")int itemid){
        if(!isLogin(session)) return "redirect:/administrator";

        itemService.confirmDelivered(itemid);
        return "redirect:/a-vieworder-"+String.valueOf(userid)+"-2";
    }

}
