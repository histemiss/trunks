package com.user;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet(name="user_logout",urlPatterns={"/user_logout"})
public class LogoutServlet extends HttpServlet {
	public void service(HttpServletRequest request,
			HttpServletResponse response)throws ServletException,java.io.IOException{
		RequestDispatcher rd;
		//String UserName = request.getParameter("UserName");
		//String pass = request.getParameter("UserPasswd");
		try{
			HttpSession session = request.getSession(true);
			session.removeAttribute("UserName");
			//session.removeAttribute("UserPasswd");
			rd = request.getRequestDispatcher("/user_login.jsp");
			rd.forward(request, response);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
