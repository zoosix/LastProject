package com.sist.member;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import com.sist.member.*;
import java.util.*;
public interface MemberMapper {
	//회원가입 이메일 중복 체크
	/*@Select("SELECT email FROM stock_member")
	public List<MemberVO> memberEmail();*/
	//회원가입
	@Insert("INSERT INTO stock_member (email,pwd,name,gender,birth,tell,favorite) values (#{email},#{pwd},#{name},#{gender},#{birth},#{tell},#{favorite})")
	public void memberInsert(MemberVO vo);
	//로그인 (아이디와 비밀번호 체크) **가져올 항목을 세션으로 쓸예정 내용물수정할것 
	@Select("SELECT COUNT(*) FROM stock_member WHERE email=#{email}")
	public int emailCount(String email);
	
	@Select("SELECT email,pwd,name,gender,favorite FROM stock_member WHERE email=#{email}")
	public MemberVO memberGetInfo(String email);
	
}

