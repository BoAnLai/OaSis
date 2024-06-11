package com.mike.home.controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EncodingFilter extends HttpFilter implements Filter {

	   public EncodingFilter() {
	        super();
	    }

	    public void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain)
	            throws IOException, ServletException {
	        req.setCharacterEncoding("UTF-8");
	        res.setCharacterEncoding("UTF-8");
	        res.setHeader("Cache-Control", "no-cache");

	        chain.doFilter(req, res);
	    }

}
