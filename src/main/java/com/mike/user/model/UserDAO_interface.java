package com.mike.user.model;

import java.sql.SQLException;
import java.util.*;

public interface UserDAO_interface {
          public void insert(UserVO userVO) throws SQLException;
          public void update(Integer userId,UserVO userVO);
          public UserVO findById(Integer userId);
          public List<UserVO> getAll();
          public List<UserVO> getByEmail(String userEmail);
          public List<UserVO> getByIdentity(String identity);
          public List<UserVO> getByCompanyName(String userCompanyName);
          public List<UserVO> getByLastIp(String userLastIp);
          public List<UserVO> getByNickname(String userNickname);
          public void updateLastLogin(Integer userId);      
//          public void updateLastIp(Integer userId);      
}
