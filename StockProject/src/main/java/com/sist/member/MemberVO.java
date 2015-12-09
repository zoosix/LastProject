package com.sist.member;

public class MemberVO {
	private String email;
	private String pwd;
	private String name;
	private String gender;
	private String birth;
	private String tell;
	private String favorite;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTell() {
		return tell;
	}
	public void setTell(String tell) {
		this.tell = tell;
	}
	public String getFavorite() {
		return favorite;
	}
	public void setFavorite(String favorite) {
		this.favorite = favorite;
	}
	
}
/*
 	 email VARCHAR2(100) PRIMARY KEY,
 	pwd VARCHAR2(20) NOT NULL,
 name VARCHAR2(50) NOT NULL,
 gender VARCHAR2(10) NOT NULL,
 birth VARCHAR2(8) NOT NULL,
 tell NUMBER NOT NULL,
 favorite VARCHAR2(2000) NOT NULL
 */
