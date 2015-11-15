package com.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import com.database.DbDao;

import java.sql.*;

@SuppressWarnings("serial")
@WebServlet(name="user_login"
	, urlPatterns={"/user_login"})
public class LoginServlet extends HttpServlet
{		public void service(HttpServletRequest request,
		HttpServletResponse response)
		throws ServletException,java.io.IOException {	
		String errMsg = "";
		RequestDispatcher rd;
		String UserName = request.getParameter("UserName");
		String UserPasswd = request.getParameter("UserPasswd");
		try{
			DbDao dd = new DbDao("com.mysql.jdbc.Driver",
				"jdbc:mysql://localhost:3306/user_manage","root","1234");
			ResultSet rs = dd.query("select user_passwd from user_info "
				+ "where user_name = ?", UserName);
			if (rs.next()){
				if (rs.getString("user_passwd").equals(UserPasswd)){
					HttpSession session = request.getSession(true);
					session.setAttribute("UserName" , UserName);
					rd = request.getRequestDispatcher("/welcome.jsp");
					rd.forward(request,response);
				}
				else{
					errMsg += "ERROR";
				}
			}
			else{
				errMsg += "ERROR";
			}
		}
		catch (Exception e){
			e.printStackTrace();			
		}
		if (errMsg != null && !errMsg.equals("")){
			rd = request.getRequestDispatcher("/user_login.jsp");		
			request.setAttribute("err" , errMsg);
			rd.forward(request,response);
		}
	}
}
