package com.user;

import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.database.DbDao;

@SuppressWarnings("serial")
@WebServlet(name="user_regist", urlPatterns={"/user_regist"})
public class RegistServlet extends HttpServlet {
	public void service(HttpServletRequest request, 
			HttpServletResponse response) 
			throws ServletException,java.io.IOException{
		String errMsg = "";
		RequestDispatcher rd;
		String UserName = request.getParameter("UserName");
		String UserPasswd = request.getParameter("UserPasswd");		
		try{	DbDao dd = new DbDao("com.mysql.jdbc.Driver",
					"jdbc:mysql://localhost:3306/user_manage","root","1234");

				ResultSet rs1 = dd.query("select * from user_info where user_name = ?", UserName);
				if(rs1.next()){
					if(rs1.getString("user_name").equals(UserName)){
						errMsg += "ERROR";
					}
				}
				else{
					boolean rs2 = dd.insert("insert into user_info(user_name,user_passwd) values(?,?)", UserName,UserPasswd);
					if(rs2 == true){
						HttpSession session = request.getSession(true);
						session.setAttribute("UserName", UserName);
						rd = request.getRequestDispatcher("/welcome.jsp");
						rd.forward(request, response);
					}
				}			
			}
		catch(Exception e){
			e.printStackTrace();
		}
		if(errMsg != null && !errMsg.equals("")){
			rd = request.getRequestDispatcher("/user_regist.jsp");
			request.setAttribute("err", errMsg);
			rd.forward(request, response);
		}
	}
}
