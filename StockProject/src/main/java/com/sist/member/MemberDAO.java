package com.sist.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	@Autowired
	private MemberMapper memberMapper;
	public void joinOk(MemberVO vo){
		memberMapper.memberInsert(vo);
	}
	public int emailCount(String email){
	   	int count=0;
	   	try{
	   		count=memberMapper.emailCount(email);
	   	}catch(Exception ex){System.out.println(ex.getMessage());}
	   	return count;
	   }
	   public MemberVO memberGetInfo(String email){
	   	MemberVO vo= new MemberVO();
	   	try{
			vo=memberMapper.memberGetInfo(email);	
		}catch(Exception ex){System.out.println(ex.getMessage());}
		return vo;
	   }
}
/*
	@Repository
public class MemberDAO {
   @Autowired
   private MemberMapper memberMapper;

   public int memberIdCount(String id) {      
      return memberMapper.memberIdCount(id);
   }
   public MemberVO getMemberInfo(String id) {
      MemberVO d = memberMapper.getMemberInfo(id);
      return d;
   }   

   public List<MemberVO> memberId(){
      List<MemberVO> list=memberMapper.memberId();

      return list;
   }   
   
   public String memberIdCheck(String id){
      String nid=memberMapper.memberIdCheck(id);
      if(nid=="0"||nid==null)
         nid="0";
      return nid;
   }
   public void joinOk(MemberVO vo){
      memberMapper.memberInsert(vo);
   }
//트랜잭션 이용 값검사 메소  _____________통신부분____________  _________롤백_______________
//   : 진행중인 트랜잭션이 없으면 트랜잭션을 새로 생성함
   @Transactional(propagation=Propagation.REQUIRED,rollbackFor={Exception.class})
   public void memberEmailChk(String id,boolean bCheck){
      System.out.println("idㄴㄴ ------------------------------------------------------"+id);
      System.out.println("bCheckㄴㄴ ------------------------------------------------------"+bCheck);
      if(bCheck==false){
         memberMapper.memberDelete(id);
      }
   }
}
*/