package org.jsp.controller;

import java.util.ArrayList;


import org.jsp.dao.TodoDao;
import org.jsp.dao.UserDao;
import org.jsp.dto.Todo;
import org.jsp.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class App {
	@Autowired
	private UserDao userDao;
	@Autowired
	private TodoDao todoDao;
	private User user;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String username,@RequestParam String password,ModelAndView view) {
		user = userDao.verifyUser(username, password);
		if(user!=null) {
			view.setViewName("index");
			view.addObject("message",userDao.userHtml(user));
			return view;
		}else {
			view.setViewName("print");
			view.addObject("message","invalid username or password");
			return view;
		}
	}
	
	@RequestMapping(value = "/open-register")
	public String openRegister() {
		return "register";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public ModelAndView register(@RequestParam String username,@RequestParam String password,@RequestParam String email,ModelAndView view) {
		if(username.equals("") || password.equals("") || email.equals("")) {
			view.setViewName("print");
			view.addObject("message","do not enter empty value");
			return view;
		}
		User newUser = new User();
		newUser.setEmail(email);
		newUser.setPassword(password);
		newUser.setUsername(username);
		newUser.setTodos(new ArrayList<Todo>());
		userDao.saveUser(newUser);
		view.setViewName("login");
		view.addObject("message","Some massage");
		return view;
		
	}
	@RequestMapping(value = "/add-todo",method = RequestMethod.POST)
	public ModelAndView register(@RequestParam String item,ModelAndView view) {
		if(item.equals("")) {
			view.setViewName("print");
			view.addObject("message","Enter a valid input");
			return view;
		}
		Todo todo = new Todo();
		todo.setCpmlited(false);
		todo.setText(item);
		todoDao.saveTodo(todo, user.getId());
		view.setViewName("index");
		view.addObject("message",userDao.userHtml(user));
		return view;
	}
	@RequestMapping(value = "delete")
	public ModelAndView delete(@RequestParam int id,ModelAndView view) {
		if(todoDao.deleteTodo(id)) {
			view.setViewName("index");
			view.addObject("message",userDao.userHtml(user));
		}else {
			view.setViewName("print");
			view.addObject("message","invalid ID");
		}
		return view;
	}
	
	@RequestMapping(value = "mark")
	public ModelAndView mark(@RequestParam int id,ModelAndView view) {
		if(todoDao.markTodo(id)) {
			view.setViewName("index");
			view.addObject("message",userDao.userHtml(user));
		}else {
			view.setViewName("print");
			view.addObject("message","invalid ID");
		}
		return view;
	}
	
}
