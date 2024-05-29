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

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter("/LoginFilter")
public class LoginFilter extends HttpFilter implements Filter {
       
    public LoginFilter() {
        super();
    }

	public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {

		System.out.println("filter exeute!");
		
		HttpSession session = req.getSession();
		UserDTO user = (UserDTO)session.getAttribute("user");
		System.out.println(user);
		
		if(user == null) {
			req.getRequestDispatcher("/login").forward(req, res);
		}else {
			System.out.println("user has login!");
		}
		
		chain.doFilter(req, res);
	}


}
