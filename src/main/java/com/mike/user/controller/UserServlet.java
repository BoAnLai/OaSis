package com.mike.user.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mike.tool.StringProcessor;
import com.mike.user.model.UserDTO;
import com.mike.user.model.UserJNDIDAO;
import com.mike.user.model.UserService;
import com.mike.user.model.UserVO;

@MultipartConfig
public class UserServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	
		System.out.print("req URL:");
		System.out.println(req.getRequestURL());
		
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
		
		
		
		if(req.getServletPath().equals("/user/list")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/user/userList.jsp");
			dispatcher.forward(req,res);
		}
		
		
		
		
		if (req.getServletPath().equals("/user/update")) {
			
			
			System.out.println(req.getParameter("updateUserId"));
			System.out.println(session.getAttribute("updateUserId"));
			
			UserDTO user = null;
			
			if(req.getParameter("updateUserId")==null) {
				
				user = new UserDTO(userDAO.findById(Integer.valueOf((String)session.getAttribute("updateUserId"))));
			}else {
				user = new UserDTO(userDAO.findById(Integer.valueOf((String)req.getParameter("updateUserId"))));				
				session.setAttribute("updateUserId",req.getParameter("updateUserId"));
			}
			
			session.setAttribute("userDisplayed", user);
			
			String url = "/user/userUpdate.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
		} //if(user/update)
		
		
		
		
		if(req.getServletPath().equals("/user/updating")) {
			
			UserVO userUpdating = new UserVO();
			userUpdating.setUserId(((UserDTO)session.getAttribute("userDisplayed")).getUserId());
			
			userUpdating.setUserEmail(req.getParameter("email"));
			
			
//			System.out.print("password: ");
//			System.out.println(req.getParameter("password"));
//			System.out.println(req.getParameter("password").isBlank());
//			System.out.println(req.getParameter("password")==null);
//			System.out.print("confirm password: ");
//			System.out.println(req.getParameter("confirmPassword"));
//			System.out.println(req.getParameter("confirmPassword").isBlank());
//			System.out.println(req.getParameter("confirmPassword")==null);
			
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
				}
				System.out.println("password both contain");
			}else if(bothBlank) {
				System.out.println("password both blank");
			}else {
				
				req.setAttribute("errorMsg", "若要更改密碼，請完整填寫 密碼 及 確認密碼 兩個區塊");
				req.getRequestDispatcher("/user/userUpdate.jsp").forward(req,res);
//				res.sendRedirect("/user/update");
				System.out.println("one contain one blank");
			}
			
			
			
			
			userUpdating.setUserNickname(StringProcessor.EmptyToNull(req.getParameter("nickname")));
			userUpdating.setUserIntro(StringProcessor.EmptyToNull(req.getParameter("intro")));
			userUpdating.setUserRealName(StringProcessor.EmptyToNull(req.getParameter("realName")));
			userUpdating.setUserCellphone(StringProcessor.EmptyToNull(req.getParameter("cellphone")));
			userUpdating.setUserAddress(StringProcessor.EmptyToNull(req.getParameter("address")));
			
			UserService userService = new UserService();
			userService.userUpdate(userUpdating.getUserId(),userUpdating);
			
			Part part = req.getPart("avatar");
			if(part.getSize()!=0) {
				String filename;
				if(userUpdating.getUserAvatar()!=null) {				
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
				userUpdating.setUserAvatar(imgSrcPath);
				userService.userUpdate(userUpdating.getUserId(),userUpdating);				
			}
//			req.getRequestDispatcher("userList.jsp").forward(req, res);
			res.sendRedirect("/oasis/user/list");
		} //if(user/updating)

		
		
		
		if(req.getServletPath().equals("/user/register")) {
			RequestDispatcher dispatcher = req.getRequestDispatcher("/user/userRegister.jsp");
			dispatcher.forward(req,res);
		}  //if(user/register)
		
		
		
		
		if(req.getServletPath().equals("/user/registering")) {
			
			//新增資料(不包含圖片) ============================
			UserVO user = new UserVO();
			user.setUserEmail(req.getParameter("email"));
			user.setUserPassword(req.getParameter("password"));
			user.setUserNickname(req.getParameter("nickname"));
			user.setUserIntro(req.getParameter("intro"));
			
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				UserService userService = new UserService();
				userService.register(user);				
			}catch(SQLException e) {
				RequestDispatcher dispatcher = req
						.getRequestDispatcher("/user/userRegister.jsp");
				
				errorMsgs.add("出現SQLException");
				dispatcher.forward(req,res);
			}
			
			//取得userId PK ============================
			UserService userService = new UserService();
			user = userService.getOneUserByEmail(user.getUserEmail());
			Integer userId = user.getUserId();
			
			//上傳圖片 ===========================
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
				user.setUserAvatar(imgSrcPath);
				userService.userUpdate(user.getUserId(),user);				
			}
						
			res.sendRedirect("userList.jsp");
			
		} //if(/user/registering)
		
	} //doPost 
} //Class
