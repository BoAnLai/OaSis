package com.mike.user.model.service;

import java.util.ArrayList;
import java.util.List;

import com.mike.user.model.UserDTO;
import com.mike.user.model.entity.UserVO;
import com.mike.user.model.repository.UserDAO_interface;
import com.mike.user.model.repository.UserJNDIDAO;

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
