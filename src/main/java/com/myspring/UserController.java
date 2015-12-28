package com.myspring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mybean.UserBean;
import com.myspring.db.FileJT;
import com.myspring.db.UserJT;

@Controller
public class UserController {

	@Autowired UserJT userJT;
	@Autowired FileJT fileJT;

	@RequestMapping(path="/welcome")
    public String welcome(ModelMap model){
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println(auth.getName());
		
		model.addAttribute("arrFiles", fileJT.listUserFiles((Long) model.get("user_id")));
		return "welcome";
	}

	/*
	@RequestMapping(path="/dologin")
	public String login(ModelMap model)
	{
		model.addAttribute("op", "login");
		return "dologin";
	}
	*/

	@RequestMapping(path="/register", method=RequestMethod.GET)
    public String register(ModelMap model){
		model.addAttribute("op", "register");
		return "dologin";
	}

	@RequestMapping(path="/register", method=RequestMethod.POST)
    public String register(@RequestParam("username") String strName, 
    		@RequestParam("password") String strPasswd,
    		RedirectAttributes redirectAttributes,
    		ModelMap model){

		String err = "";
		try{
			UserBean user = userJT.create(strName, strPasswd);
			if (null != user) {
				return "redirect:welcome";
			} else {
				err = "用户名与密码错误";
			}
		}
		catch(Exception e){
			e.printStackTrace();
			err = "数据库错误";
		}

		model.addAttribute("op", "register");
		model.addAttribute("err", err);
		return "dologin";
	}
}
