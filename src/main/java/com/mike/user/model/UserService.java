package com.mike.user.model;

import java.sql.SQLException;
import java.util.List;

import com.mike.user.model.exception.EmailNotFoundException;

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
	public void userUpdate(Integer userId,UserVO userVO) {
		
		dao.update(userId,userVO);
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
	
//	public boolean emailExist(String email) {
//		
//		try {
//			if(dao.findByEmail(email) != null) {
//				return true;
//			}else {
//				return false;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			return false;
//		}
//		
//	}
}
