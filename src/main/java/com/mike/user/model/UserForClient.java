package com.mike.user.model;

public class UserForClient extends UserVO {
	
	private Integer userId;
	private String userEmail;
	private Identity userIdentity;
	private String userCompanyName;
	private String userNickname;
	private String userAvatar;
	private String userIntro;
	
	public UserForClient(UserVO userVO) {		
		this.userId = userVO.getUserId();
		this.userEmail = userVO.getUserEmail();
		this.userIdentity = userVO.getUserIdentity();
		this.userCompanyName = userVO.getUserCompanyName();
		this.userNickname = userVO.getUserNickname();
		this.userAvatar = userVO.getUserAvatar();
		this.userIntro = userVO.getUserIntro();
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
	
}
