package com.mike.user.model;
import java.sql.Date;
import java.sql.Timestamp;

import com.mike.tool.StringProcessor;

public class UserVO implements java.io.Serializable{
	
	private Integer userId;
	private String userEmail;
	private String userPassword;
	private Identity userIdentity;
	private String userCompanyName;
	private Date userRegisterDate;
	private Timestamp userLastLogin;
	private String userLastIp;
	private String userNickname;
	private String userAvatar;
	private String userIntro;
	private String userRealName;
	private String userCellphone;
	private String userAddress;
	
	public UserVO() {
		super();
	}
	

	public UserVO(String userEmail, String userPassword, Identity userIdentity, String userCompanyName
			, Date userRegisterDate, Timestamp userLastLogin, String userLastIp, String userNickname
			, String userAvatar, String userIntro, String userRealName, String userCellphone
			, String userAdress) {
		
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userIdentity = userIdentity;
		this.userCompanyName = userCompanyName;
		this.userRegisterDate = userRegisterDate;
		this.userLastLogin = userLastLogin;
		this.userLastIp = userLastIp;
		this.userNickname = userNickname;
		this.userAvatar = userAvatar;
		this.userIntro = userIntro;
		
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
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public Identity getUserIdentity() {
		return userIdentity;
	}
	public void setUserIdentity(Identity userIdentity) {
		this.userIdentity = userIdentity;
	}
	public String getUserCompanyName() {
		return StringProcessor.nullDealer(userCompanyName);
	}
	public void setUserCompanyName(String userCompanyName) {
		this.userCompanyName = userCompanyName;
	}
	public Date getUserRegisterDate() {
		return userRegisterDate;
	}
	public void setUserRegisterDate(Date userRegisterDate) {
		this.userRegisterDate = userRegisterDate;
	}
	public Timestamp getUserLastLogin() {
		return userLastLogin;
	}
	public void setUserLastLogin(Timestamp userLastLogin) {
		this.userLastLogin = userLastLogin;
	}
	public String getUserLastIp() {
		return userLastIp;
	}

	public void setUserLastIp(String userLastIp) {
		this.userLastIp = userLastIp;
	}

	public String getUserNickname() {
		return StringProcessor.nullDealer(userNickname);
	}
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	public String getUserAvatar() {
		return StringProcessor.nullDealer(userAvatar);
	}
	public void setUserAvatar(String userAvatar) {
		this.userAvatar = userAvatar;
	}
	
	public String getUserIntro() {
		return StringProcessor.nullDealer(userIntro);
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
	
	@Override
	public String toString() {
		String outputStr = "User: [";
		
		outputStr += "\r userId="+ this.getUserId();
		outputStr += "\r userEmail="+ this.getUserEmail();
		outputStr += "\r userPassword="+ this.getUserPassword();
		outputStr += "\r userIdentity="+ this.getUserIdentity();
		outputStr += "\r userCompanyName="+ this.getUserCompanyName();
		outputStr += "\r userRegisterDate="+ this.getUserRegisterDate();
		outputStr += "\r userLastLogin="+ this.getUserLastLogin();
		outputStr += "\r userLastIp="+ this.getUserLastIp();
		outputStr += "\r userNickname="+ this.getUserNickname();
		outputStr += "\r userAvatar="+ this.getUserAvatar();
		outputStr += "\r userIntro="+ this.getUserIntro();
		outputStr += "\r userRealName="+ this.getUserRealName();
		outputStr += "\r userCellphone="+ this.getUserCellphone();
		outputStr += "\r userAddress="+ this.getUserAddress();
		outputStr += "]\r\r";
		
		
		return outputStr;
	}
}

