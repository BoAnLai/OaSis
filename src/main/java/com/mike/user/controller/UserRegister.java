package com.mike.user.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

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
import com.mike.user.model.UserDTO;
import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;
import com.mike.user.model.exception.EmailNotFoundException;

@MultipartConfig
@WebServlet(name = "userRegister", urlPatterns = {"/register", "/registering"})
public class UserRegister extends HttpServlet{

	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/user/userRegister.jsp").forward(req, res);
	}
	
	
	// /registering
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

		try {
			userSvc.findByEmail(req.getParameter("email"));
			req.setAttribute("errorMsg", "此信箱已註冊");
			req.getRequestDispatcher("/user/userRegister.jsp").forward(req,res);
			return;
		} catch (SQLException e) {
			req.setAttribute("errorMsg", "資料庫連線異常");
			req.getRequestDispatcher("/user/userRegister.jsp").forward(req,res);
			return;
		} catch(EmailNotFoundException e) {}
		
		
		UserVO userRegistering = new UserVO();
		userRegistering.setUserEmail(req.getParameter("email"));
		userRegistering.setUserPassword(req.getParameter("password"));
		
		
		
		String password = req.getParameter("password").trim();
		String confirmPassword = req.getParameter("confirmPassword").trim();
		boolean bothBlank = password.isBlank() && confirmPassword.isBlank();
		boolean bothContain = (!password.isBlank()) && (!confirmPassword.isBlank());
		
		if(bothContain) {
			if(password.equals(confirmPassword)) {
				userRegistering.setUserPassword(password);
			}else {
				req.setAttribute("errorMsg", "兩次密碼不相符");
				req.getRequestDispatcher("/user/userRegister.jsp").forward(req,res);
				return;
			}
		}else if(bothBlank) {
		}else {
			
			req.setAttribute("errorMsg", "請完整填寫 輸入密碼 及 再次輸入密碼 兩個區塊");
			req.getRequestDispatcher("/user/userRegister.jsp").forward(req,res);
			return;
		}
		
		
		
		
		userRegistering.setUserNickname(req.getParameter("nickname"));
		userRegistering.setUserIntro(req.getParameter("intro"));
		
		try {
			userSvc.register(userRegistering);				
		}catch(SQLException e) {
			req.getRequestDispatcher("/user/userRegister.jsp").forward(req,res);
			return;
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
//			userRegistering.setUserAvatar(imgSrcPath);
//			userSvc.userUpdate(userRegistering.getUserId(),userRegistering);
			userSvc.updateAvatar(userRegistering.getUserId(),imgSrcPath);
		}
		
		UserDTO user = new UserDTO(userRegistering);
		session.setAttribute("user", user);
					
//		res.sendRedirect("/oasis");
		req.getRequestDispatcher("/").forward(req, res);
		
		
	}
	
}
