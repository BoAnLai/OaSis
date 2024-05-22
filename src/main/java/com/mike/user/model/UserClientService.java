package com.mike.user.model;

import java.util.ArrayList;
import java.util.List;

public class UserClientService {

	public static UserDAO_interface dao = new UserJNDIDAO();
	
	public static UserForClient getUserById(Integer userId) {
		UserForClient user = new UserForClient(dao.findById(userId));
		return user;
	}
	
	public static List<UserForClient> getAll(){
		List<UserVO> originUserList = dao.getAll();
		List<UserForClient> clientUserList = new ArrayList<UserForClient>();
		
		for(UserVO user:originUserList) {
			clientUserList.add(new UserForClient(user));
		}
		return clientUserList;
	}
}
