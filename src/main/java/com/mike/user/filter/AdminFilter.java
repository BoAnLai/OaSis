package com.mike.user.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mike.user.model.UserDTO;

@WebFilter(filterName="/AdminFilter")
public class AdminFilter extends HttpFilter implements Filter {
       
    public AdminFilter() {
        super();
    }

	public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {

		HttpSession session = req.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");
		
		if(user !=null) {
			if(user.getUserIdentity().toString().equals("ADMINISTRATOR")) {				
				System.out.println("AdminFilter: user is administrator, allow to proceed");
				chain.doFilter(req, res);
			}else {
				System.out.println("AdminFilter: user is NOT allow to access this page");
				res.sendRedirect("/oasis");
			}
		}else {
			System.out.println("AdminFilter: user in session is NULL");
			res.sendRedirect("/login");
		}
		
	}
}
