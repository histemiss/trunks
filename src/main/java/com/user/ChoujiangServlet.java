package com.user;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;


@SuppressWarnings("serial")
@WebServlet(name="choujiang"
	, urlPatterns={"/choujiang"})
public class ChoujiangServlet extends HttpServlet
{		
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException,java.io.IOException {	
		RequestDispatcher rd;
		//HttpSession session = request.getSession(true);
		rd = request.getRequestDispatcher("/choujiang.jsp");
		rd.forward(request,response);
	}
}
