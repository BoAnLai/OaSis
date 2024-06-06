package com.ryan.subs.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mike.user.model.UserDTO;
import com.ryan.subs.model.SubsService;
import com.ryan.subs.model.SubsVO;


@WebFilter(filterName="/SubsFilter")
public class SubsFilter extends HttpFilter implements Filter {
	       
	    public SubsFilter() {
	        super();
	    }

	public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {

	HttpSession session = req.getSession();
	UserDTO user = (UserDTO)session.getAttribute("user");
	
	SubsVO subsId = (SubsVO)session.getAttribute("subsId");
	
//	SubsService subsSvc = new SubsService();
//	List<SubsVO> subsList = subsSvc.findByUserId(user.getUserId());
	
	String headingPath = req.getRequestURI();
	session.setAttribute("headingPath", headingPath);

	if(user == null) {
		req.getRequestDispatcher("/login").forward(req, res);
		}
	
	}
	
}
