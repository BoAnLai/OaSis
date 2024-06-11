package com.mike.user.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mike.tool.StringProcessor;
import com.mike.user.model.Identity;
import com.mike.user.model.UserDTO;
import com.mike.user.model.UserJNDIDAO;
import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;

@MultipartConfig
public class UserUpdate extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	
		String saveDirectory = "/user/resources/avatarUploaded";
		String realPath = getServletContext().getRealPath(saveDirectory);
		File fsaveDirectory = new File(realPath);
		if (!fsaveDirectory.exists()) {				
			fsaveDirectory.mkdirs();
		}
	
		UserJNDIDAO userDAO = new UserJNDIDAO();
		
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		
		if (req.getServletPath().equals("/user/update")) {
			
			UserDTO user = null;
			
			if(req.getParameter("updateUserId")==null) {
				
				user = new UserDTO(userDAO.findById(Integer.valueOf((String)session.getAttribute("updateUserId"))));
			}else {
				user = new UserDTO(userDAO.findById(Integer.valueOf((String)req.getParameter("updateUserId"))));				
				session.setAttribute("updateUserId",req.getParameter("updateUserId"));
			}
			
			session.setAttribute("userDisplayed", user);
			
			String url = "/user/userUpdate.jsp";
			req.getRequestDispatcher(url).forward(req, res);
		} //if(user/update)
		
		
		
		
		if(req.getServletPath().equals("/user/updating")) {
			
			UserVO userUpdating = new UserVO();
			userUpdating.setUserId(((UserDTO)session.getAttribute("userDisplayed")).getUserId());
			
			userUpdating.setUserEmail(req.getParameter("email"));
			
			
			String password = req.getParameter("password").trim();
			String confirmPassword = req.getParameter("confirmPassword").trim();
			boolean bothBlank = password.isBlank() && confirmPassword.isBlank();
			boolean bothContain = (!password.isBlank()) && (!confirmPassword.isBlank());
			
			if(bothContain) {
				
				if(password.equals(confirmPassword)) {
					userUpdating.setUserPassword(password);
				}else {
					req.setAttribute("errorMsg", "兩次密碼不相符");
					req.getRequestDispatcher("/user/userUpdate.jsp").forward(req,res);
					return;
				}
			}else if(bothBlank) {
			}else {
				
				req.setAttribute("errorMsg", "若要更改密碼，請完整填寫 密碼 及 確認密碼 兩個區塊");
				req.getRequestDispatcher("/user/userUpdate.jsp").forward(req,res);
				return;
			}
			
			userUpdating.setUserIdentity(Identity.valueOf(req.getParameter("identity")));
			userUpdating.setUserCompanyName(StringProcessor.blankToNull(req.getParameter("companyName")));
			
			userUpdating.setUserNickname(StringProcessor.blankToNull(req.getParameter("nickname")));
			userUpdating.setUserIntro(StringProcessor.blankToNull(req.getParameter("intro")));
			userUpdating.setUserRealName(StringProcessor.blankToNull(req.getParameter("realName")));
			userUpdating.setUserCellphone(StringProcessor.blankToNull(req.getParameter("cellphone")));
			userUpdating.setUserAddress(StringProcessor.blankToNull(req.getParameter("address")));
			
			UserService userService = new UserService();
			try {
		    	userService.userUpdate(userUpdating.getUserId(), userUpdating);
			} catch (IllegalArgumentException e) {
				
				req.setAttribute("errorMsg", "手機號碼只接受 09XX-XXX-XXX 或相近的格式");
				req.getRequestDispatcher("/user/userUpdate.jsp").forward(req,res);
				return;
				
//				try {
//					res.sendError(HttpServletResponse.SC_BAD_REQUEST,e.getMessage());
//				} catch (IOException e1) {
//					// TODO Auto-generated catch block
//					e1.printStackTrace();
//				}
			}
			
			
			
			
			Part part = req.getPart("avatar");
			if(part.getSize()!=0) {
				String filename;
				if(userUpdating.getUserAvatar()!=null && !(userUpdating.getUserAvatar().isBlank())) {
					filename = StringProcessor.getFilename(((UserDTO)session.getAttribute("userDisplayed")).getUserAvatar());
				}else {
					String submittedFilename = part.getSubmittedFileName();
					String submittedFileExtension = StringProcessor.getFileExtension(submittedFilename);
					filename = userUpdating.getUserId() +"."+ submittedFileExtension;
				}

				
				String imgSrcPath = null;
				if (filename!= null && filename.length()!=0 && part.getContentType()!=null && part.getSize()!=0) {
					File f = new File(fsaveDirectory, filename);
					part.write(f.toString());
					imgSrcPath = req.getContextPath()+saveDirectory + "/" + filename;
				}
				userService.updateAvatar(userUpdating.getUserId(),imgSrcPath);				
			}
			res.sendRedirect("/oasis/user/list");
		} //if(user/updating)
	}
	
}
