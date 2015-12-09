package com.inform.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReplyDAO {
	  @Autowired
	  private ReplyMapper mapper;
	  
	  public List<ReplyVO> replyListData(ReplyVO vo)
	  {
	    	return mapper.replyListData(vo);
	  }
	  public int replyRowCount(String bno){
			int count=mapper.replyRowCount(bno);
	    	return (int)(Math.ceil(count/10.0));
	  }
	   public void replyInsert(ReplyVO vo){
		   mapper.replyInsert(vo);
	   }
	   public ReplyVO replyData(String bno){
		   return mapper.replyData(bno); 
	   }
	   public void replyParentDelete(int group_id){
		   mapper.replyParentDelete(group_id);
	   }
	   public void replyDelete(String no){
		   mapper.replyDelete(no);
	   }
	   public ReplyVO replyParentInfo(String no){
		   return mapper.replyParentInfo(no);
	   }
	   public void replyStepIncrement(ReplyVO vo){
		   mapper.replyStepIncrement(vo);
	   }
	   public void replyReplyWrite(ReplyVO vo){
		   mapper.replyReplyWrite(vo);
	   }
	   public void replyDepthIncrement(String no){
		   mapper.replyDepthIncrement(no);
	   }
	   public void replyUpdate(Map map){
		   mapper.replyUpdate(map);
	   }
	   public List<Company_infoVO> company_info_List(){
		   return mapper.company_info_List();
	   }
}
