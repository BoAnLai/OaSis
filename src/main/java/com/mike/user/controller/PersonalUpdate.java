package com.mike.user.controller;

import java.io.File;
import java.io.IOException;

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

@MultipartConfig
@WebServlet(name = "PersonalUpdate", urlPatterns = {"/personalUpdate", "/personalUpdating"})
public class PersonalUpdate extends HttpServlet{

	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("/user/personalUpdate.jsp").forward(req, res);
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
		
		
		
		
		UserDTO userClient = (UserDTO)session.getAttribute("user");
		System.out.println(userClient);
		
		UserService userSvc = new UserService();
		
		UserVO userUpdating = userSvc.getByUserId(userClient.getUserId());
		
		
		
		
		String password = req.getParameter("password").trim();
		String confirmPassword = req.getParameter("confirmPassword").trim();
		boolean bothBlank = password.isBlank() && confirmPassword.isBlank();
		boolean bothContain = (!password.isBlank()) && (!confirmPassword.isBlank());
		
		if(bothContain) {
			
			if(password.equals(confirmPassword)) {
				userUpdating.setUserPassword(password);
			}else {
				req.setAttribute("errorMsg", "兩次密碼不相符");
				req.getRequestDispatcher("/user/personalUpdate.jsp").forward(req,res);
				return;
			}
		}else if(bothBlank) {
		}else {
			req.setAttribute("errorMsg", "若要更改密碼，請完整填寫 密碼 及 確認密碼 兩個區塊");
			req.getRequestDispatcher("/user/personalUpdate.jsp").forward(req,res);
			return;
		}
		
		userUpdating.setUserNickname(StringProcessor.blankToNull(req.getParameter("nickname")));
		userUpdating.setUserIntro(StringProcessor.blankToNull(req.getParameter("intro")));
		userUpdating.setUserRealName(StringProcessor.blankToNull(req.getParameter("realName")));
		userUpdating.setUserCellphone(StringProcessor.blankToNull(req.getParameter("cellphone")));
		userUpdating.setUserAddress(StringProcessor.blankToNull(req.getParameter("address")));
		
		
		try {
			userSvc.userUpdate(userUpdating.getUserId(),userUpdating);
		} catch (IllegalArgumentException e) {
			System.out.println("catching error");
			req.setAttribute("errorMsg", "手機號碼只接受 09XX-XXX-XXX 或相近的格式");
			req.getRequestDispatcher("/user/personalUpdate.jsp").forward(req,res);
			return;
		}
		
		
		Part part = req.getPart("avatar");
		if(part.getSize()!=0) {
			String filename;
			if(userUpdating.getUserAvatar()!=null && !(userUpdating.getUserAvatar().isBlank())) {				
				filename = StringProcessor.getFilename(((UserDTO)session.getAttribute("user")).getUserAvatar());
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
			userSvc.updateAvatar(userUpdating.getUserId(),imgSrcPath);				
		}
		
		session.setAttribute("user", new UserDTO(userUpdating));
		
//		res.sendRedirect("/oasis");
		req.getRequestDispatcher("/").forward(req, res);
	}
}
