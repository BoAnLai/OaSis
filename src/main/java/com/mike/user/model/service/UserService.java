package com.mike.user.model.service;

import java.lang.reflect.Field;
import java.sql.SQLException;
import java.util.List;

import com.mike.tool.StringProcessor;
import com.mike.user.model.entity.UserVO;
import com.mike.user.model.exception.EmailNotFoundException;
import com.mike.user.model.repository.UserDAO_interface;
import com.mike.user.model.repository.UserJNDIDAO;

public class UserService {

	private UserDAO_interface dao;

	public UserService() {
		dao = new UserJNDIDAO();
	}

	//使用者註冊
	public UserVO register(UserVO user) throws SQLException {
		dao.insert(user);

		return user;
	}
	
	public List<UserVO> getAll(){
		return dao.getAll();
	}
	
	//使用者更新資料
	public void userUpdate(Integer userId,UserVO userUpdating) {
		
		UserVO user = dao.findById(userId);
		if(userUpdating.getUserEmail()!=null) {
			user.setUserEmail(userUpdating.getUserEmail());
		}
		if(userUpdating.getUserPassword()!=null) {
			user.setUserPassword(userUpdating.getUserPassword());
		}
		if(userUpdating.getUserIdentity()!=null) {
			user.setUserIdentity(userUpdating.getUserIdentity());
		}
		if(userUpdating.getUserCompanyName()!=null) {
			user.setUserCompanyName(StringProcessor.EmptyToNull(userUpdating.getUserCompanyName()));
		}		
		if(userUpdating.getUserNickname()!=null) {
			user.setUserNickname(StringProcessor.EmptyToNull(userUpdating.getUserNickname()));
		}
		if(userUpdating.getUserIntro()!=null) {
			user.setUserIntro(StringProcessor.EmptyToNull(userUpdating.getUserIntro()));
		}
		if(userUpdating.getUserRealName()!=null) {
			user.setUserRealName(StringProcessor.EmptyToNull(userUpdating.getUserRealName()));
		}
		if(userUpdating.getUserCellphone()!=null) {
			user.setUserCellphone(StringProcessor.EmptyToNull(userUpdating.getUserCellphone()));
		}
		if(userUpdating.getUserAddress()!=null) {
			user.setUserAddress(StringProcessor.EmptyToNull(userUpdating.getUserAddress()));
		}
		dao.update(userId,user);
	}
	
	public void updateAvatar(Integer userId, String avatarPath) {
		
		UserVO userUpdating = dao.findById(userId);
		if(avatarPath != null && avatarPath.equals("")) {
			userUpdating.setUserAvatar(avatarPath);
		}
		dao.update(userId, userUpdating);
	}
	
	public UserVO getOneUserByEmail(String email) {
		List<UserVO> userList = dao.getByEmail(email);
		UserVO user = userList.get(0);

		return user;
	}
	
	public boolean identityConfirm(String email, String password) throws SQLException, EmailNotFoundException {
		
		try {			
			UserVO user = dao.findByEmail(email);
			if(password.equals(user.getUserPassword())) {
				return true;			
			}else {
				return false;
			}
		}catch(SQLException se){
			throw se;
		}catch(EmailNotFoundException ee) {
			throw ee;
		}		
	}
	
	public UserVO findByEmail(String email) throws SQLException {
			UserVO user = dao.findByEmail(email);
			return user;
	}

}
