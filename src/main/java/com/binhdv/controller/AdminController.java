package com.binhdv.controller;

import com.binhdv.dto.AdminDTO;
import com.binhdv.dto.BookDTO;
import com.binhdv.entity.Book;
import com.binhdv.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.validation.constraints.PastOrPresent;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    BookService bookService;

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

//    @GetMapping("a-usermanager")
//    public String userManager(){
//
//    }


}
