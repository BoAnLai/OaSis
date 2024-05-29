package com.mike.user.model;

import com.mike.tool.StringProcessor;
import com.mike.user.model.entity.UserVO;
import com.mike.user.model.enumeration.Identity;

public class UserDTO {
	
	private Integer userId;
	private String userEmail;
	private Identity userIdentity;
	private String userCompanyName;
	private String userNickname;
	private String userAvatar;
	private String userIntro;
	private String userRealName;
	private String userCellphone;
	private String userAddress;
	
	public UserDTO(UserVO userVO) {		
		this.userId = userVO.getUserId();
		this.userEmail = userVO.getUserEmail();
		this.userIdentity = userVO.getUserIdentity();
		this.userCompanyName = userVO.getUserCompanyName();
		this.userNickname = userVO.getUserNickname();
		this.userAvatar = userVO.getUserAvatar();
		this.userIntro = userVO.getUserIntro();
		this.userRealName = userVO.getUserRealName();
		this.userCellphone = userVO.getUserCellphone();
		this.userAddress = userVO.getUserAddress();
	}
	
	public String getUserName() {
		if(!(userNickname == null || userNickname == "")) {
			return userNickname;
		}else {
			return StringProcessor.getUserNameFromEmail(userEmail);
		}
	}

	public Integer getUserId() {
		return userId;
	}
	
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Identity getUserIdentity() {
		return userIdentity;
	}

	public void setUserIdentity(Identity userIdentity) {
		this.userIdentity = userIdentity;
	}

	public String getUserCompanyName() {
		return userCompanyName;
	}

	public void setUserCompanyName(String userCompanyName) {
		this.userCompanyName = userCompanyName;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserAvatar() {
		return userAvatar;
	}

	public void setUserAvatar(String userAvatar) {
		this.userAvatar = userAvatar;
	}

	public String getUserIntro() {
		return userIntro;
	}

	public void setUserIntro(String userIntro) {
		this.userIntro = userIntro;
	}

	public String getUserRealName() {
		return userRealName;
	}

	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}

	public String getUserCellphone() {
		return userCellphone;
	}

	public void setUserCellphone(String userCellphone) {
		this.userCellphone = userCellphone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	
}
