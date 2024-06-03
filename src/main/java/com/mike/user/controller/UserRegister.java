package com.mike.user.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mike.tool.StringProcessor;
import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;

@MultipartConfig
@WebServlet(name = "PersonalUpdate", urlPatterns = {"/register", "/registering"})
public class UserRegister extends HttpServlet{

	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/user/userRegister.jsp").forward(req, res);
	}
	
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String saveDirectory = "/user/resources/avatarUploaded";
		String realPath = getServletContext().getRealPath(saveDirectory);
		File fsaveDirectory = new File(realPath);
		if (!fsaveDirectory.exists()) {				
			fsaveDirectory.mkdirs();
		}
		UserService userSvc = new UserService();

		
		UserVO userRegistering = new UserVO();
		userRegistering.setUserEmail(req.getParameter("email"));
		userRegistering.setUserPassword(req.getParameter("password"));
		userRegistering.setUserNickname(req.getParameter("nickname"));
		userRegistering.setUserIntro(req.getParameter("intro"));
		
		try {
			userSvc.register(userRegistering);				
		}catch(SQLException e) {
			RequestDispatcher dispatcher = req
					.getRequestDispatcher("/user/userRegister.jsp");
			
			dispatcher.forward(req,res);
		}
		
		userRegistering = userSvc.getOneUserByEmail(userRegistering.getUserEmail());
		Integer userId = userRegistering.getUserId();
		
		Part part = req.getPart("avatar");
		if(part.getSize()!=0) {				
			String submittedFilename = part.getSubmittedFileName();
			String submittedFileExtension = StringProcessor.getFileExtension(submittedFilename);
			String filename = userId +"."+ submittedFileExtension;
			
			String imgSrcPath = null;
			
			if (filename!= null && filename.length()!=0 && part.getContentType()!=null) {
				File f = new File(fsaveDirectory, filename);
				part.write(f.toString());
				imgSrcPath = req.getContextPath()+saveDirectory + "/" + filename;
			}
			userRegistering.setUserAvatar(imgSrcPath);
			userSvc.userUpdate(userRegistering.getUserId(),userRegistering);				
		}
					
		res.sendRedirect("userList.jsp");
		
		
		
	}
	
}
