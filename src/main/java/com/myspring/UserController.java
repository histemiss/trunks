package com.myspring;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.database.DbDao;
import com.mybean.FileBean;

@Controller
@SessionAttributes({"user_id","user_name"})
public class UserController {

	@RequestMapping(path="/login", method=RequestMethod.GET)
    public String login(ModelMap model){
		model.addAttribute("op", "login");
		return "login";
	}

	@RequestMapping(path="/login", method=RequestMethod.POST)
    public String login(@RequestParam("UserName") String strName, 
    		@RequestParam("UserPasswd") String strPasswd,
    		RedirectAttributes redirectAttributes,
    		ModelMap model){

		String err = "";
		try{
			DbDao dd = new DbDao("com.mysql.jdbc.Driver",
				"jdbc:mysql://localhost:3306/user_manage","root","1234");
			ResultSet rs = dd.query("select user_id,user_passwd from user_info "
				+ "where user_name = ?", strName);
			if (rs.next()){
				if (rs.getString("user_passwd").equals(strPasswd)){
					redirectAttributes.addFlashAttribute("user_name", strName);
					redirectAttributes.addFlashAttribute("user_id", rs.getLong("user_id"));

					return "redirect:welcome";
				}
			} else {
				err = "用户名与密码错误";
			}
		}
		catch (Exception e){
			e.printStackTrace();
			err = "数据库错误";
		}

		model.addAttribute("op", "login");
		model.addAttribute("err", err);
		return "login";

	}

	@RequestMapping(path="/welcome")
    public String welcome(HttpSession session, ModelMap model){
		if (null == model.get("user_id"))
			return "redirect:login";
		
		long user_id = (Long) model.get("user_id");
		ArrayList<FileBean> arrFiles = new ArrayList<FileBean>();

		//遍历数据库
		try {
			DbDao dd = new DbDao("com.mysql.jdbc.Driver",
				"jdbc:mysql://localhost:3306/user_manage","root","1234");

			ResultSet rs1 = dd.query("select id,file_name,path_name from upload_info where user_id = ?", user_id);
			while (rs1.next()){
				FileBean fb = new FileBean();
				fb.id = rs1.getLong("id");
				fb.ownerId = user_id;
				fb.strName = rs1.getString("file_name");
				fb.strPath = rs1.getString("path_name");
				
				arrFiles.add(fb);
			}

			model.addAttribute("arrFiles", arrFiles);
		} catch (Exception e){
			e.printStackTrace();
		}
		
		return "welcome";
	}

	@RequestMapping(path="/register", method=RequestMethod.GET)
    public String register(ModelMap model){
		model.addAttribute("op", "register");
		return "register";
	}

	@RequestMapping(path="/register", method=RequestMethod.POST)
    public String register(@RequestParam("UserName") String strName, 
    		@RequestParam("UserPasswd") String strPasswd,
    		RedirectAttributes redirectAttributes,
    		ModelMap model){
		
		String err = "";

		try{	
			DbDao dd = new DbDao("com.mysql.jdbc.Driver",
				"jdbc:mysql://localhost:3306/user_manage","root","1234");

			ResultSet rs1 = dd.query("select * from user_info where user_name = ?", strName);
			if(rs1.next()){
				if(rs1.getString("user_name").equals(strName)){
					err = "用户已存在";
				}
			}
			else{
				boolean rs2 = dd.insert("insert into user_info(user_name,user_passwd) values(?,?)", strName, strPasswd);
				if(rs2 == true){
					return login(strName, strPasswd, redirectAttributes, model);
				}
			}			
		}
		catch(Exception e){
			e.printStackTrace();
			err = "数据库错误";
		}

		model.addAttribute("op", "register");
		model.addAttribute("err", err);
		return "register";
	}

	@RequestMapping(path="/logout")
    public String logout(WebRequest request, SessionStatus status) {
        status.setComplete();
        request.removeAttribute("user_id", WebRequest.SCOPE_SESSION);
        request.removeAttribute("user_name", WebRequest.SCOPE_SESSION);
        return "redirect:home.jsp";
    }
}
