package com.dojo.bookclub.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.dojo.bookclub.models.Book;
import com.dojo.bookclub.models.LoginUser;
import com.dojo.bookclub.models.User;
import com.dojo.bookclub.services.BookService;
import com.dojo.bookclub.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class MainController {

	     @Autowired
	     private UserService userServ;
	     
	     @Autowired
	     private BookService bookServ;
	    
	    @GetMapping("/")
	    public String index(Model model) {
	        model.addAttribute("newUser", new User());
	        model.addAttribute("newLogin", new LoginUser());
	        return "login.jsp";
	    }
	    
	    @PostMapping("/register")
	    public String register(@Valid @ModelAttribute("newUser") User newUser, 
	            BindingResult result, Model model, HttpSession session) {
	        
	    	userServ.register(newUser,  result);
	    	
	        if(result.hasErrors()) {

	            model.addAttribute("newLogin", new LoginUser());
	            return "login.jsp";
	        }
	        
	     session.setAttribute("userId", newUser.getId());
	    
	        return "redirect:/dashboard";
	    }
	    
	    @PostMapping("/login")
	    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
	            BindingResult result, Model model, HttpSession session) {
	        
	         User user = userServ.login(newLogin, result);
	    
	        if(result.hasErrors()) {
	            model.addAttribute("newUser", new User());
	            return "login.jsp";
	        }
	    
	        session.setAttribute("userId", user.getId());
	    
	        return "redirect:/dashboard";
	    }
	    
	    @GetMapping("/logout")
	    public String logout(HttpSession session) {
	    	session.setAttribute("userId", null);
	    	return "redirect:/";
	    }
	    
	    @GetMapping("/dashboard")
	    public String dashboard(Model model, HttpSession session) {
	    	if(session.getAttribute("userId") == null) {
	    		return "redirect:/";
	    	}
	    	
	    	model.addAttribute("books", bookServ.allBooks());
	    	model.addAttribute("user", userServ.findbyId((Long)session.getAttribute("userId")));
	    	return "dashboard.jsp";
	    }
	    
	    @GetMapping("/books")
	    public String addBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
	    	User user = userServ.findbyId((Long)session.getAttribute("userId"));
	    	model.addAttribute("user", user);
	    	return "addbook.jsp";
	    }

	    
	    @PostMapping("/books")
	    public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
	    	
	    	if(result.hasErrors()) {
	    		return "addbook.jsp";
	    	}
	    	
	    	bookServ.createBook(book);
	    	return "redirect:/dashboard";
	    			
	    }
	    
	    @GetMapping("/books/{id}")
	    public String showBook(Model model, @PathVariable("id") Long id, HttpSession session) {
	    	if(session.getAttribute("userId")==null) {
	    		return "redirect:/";
	    		
	    	}
	    	
	    	Book book = bookServ.findbyId(id);
	    	model.addAttribute("book",book);
	    	model.addAttribute("user", userServ.findbyId((Long)session.getAttribute("userId")));
	    	
	    	return "bookdetails.jsp";
	    	
	    }
	    
	    @RequestMapping("/books/{id}/edit")
	    public String edit(@PathVariable("id") Long id, Model model) {
	        Book book = bookServ.findbyId(id);
	        model.addAttribute("book", book);
	        return "editbook.jsp";
	    }
	    
	    @RequestMapping(value="/books/{id}", method=RequestMethod.PUT)
	    public String update(@Valid @ModelAttribute("book") Book book, BindingResult result, Model model) {
	        if (result.hasErrors()) {
	            model.addAttribute("book", book);
	            return "editbook.jsp";
	        } 
	        
	        else {
	            bookServ.updateBook(book);
	            return "redirect:/dashboard";
	        }
	    }
		
		@RequestMapping(value="/books/{id}/delete", method=RequestMethod.DELETE)
		public String deleteBook(@PathVariable("id") Long id) {
			Book book = bookServ.findbyId(id);
			bookServ.deleteBook(book);
			return "redirect:/dashboard";
		}
	    
	}

