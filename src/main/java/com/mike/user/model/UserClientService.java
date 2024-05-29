package com.mike.user.model;

import java.util.ArrayList;
import java.util.List;

public class UserClientService {

	public static UserDAO_interface dao = new UserJNDIDAO();
	
	public static UserDTO getUserById(Integer userId) {
		UserDTO user = new UserDTO(dao.findById(userId));
		return user;
	}
	
	public static List<UserDTO> getAll(){
		List<UserVO> originUserList = dao.getAll();
		List<UserDTO> clientUserList = new ArrayList<UserDTO>();
		
		for(UserVO user:originUserList) {
			clientUserList.add(new UserDTO(user));
		}
		return clientUserList;
	}
}
