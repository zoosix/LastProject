package com.inform.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface ReplyMapper {
	@Select("SELECT no,id,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday,group_tab,group_step,group_id,num "
			+ "FROM (SELECT no,id,name,msg,regdate,group_tab,group_step,group_id,rownum as num "
			+ "FROM (SELECT no,id,name,msg,regdate,group_tab,group_step,group_id FROM reply "
			+ "WHERE bno=#{bno} ORDER BY group_id DESC,group_step ASC)) WHERE num BETWEEN #{start} AND #{end}")
	public List<ReplyVO> replyListData(ReplyVO vo);

	@Select("SELECT COUNT(*) FROM reply WHERE bno=#{bno}")
	public int replyRowCount(String bno);

	@Select("SELECT id,msg,TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday FROM reply WHERE no=(SELECT NVL(MAX(no),1) "
			+ "as no FROM reply WHERE bno=#{bno}) ORDER BY no desc")
	public ReplyVO replyData(String bno);

	@SelectKey(keyProperty = "no", before = true, resultType = int.class, statement = "SELECT NVL(MAX(no)+1,1) as no FROM reply")
	@Insert("INSERT INTO reply VALUES(#{no},#{bno},#{id},#{name},#{msg},SYSDATE,(SELECT NVL(MAX(group_id)+1,1) FROM reply),0,0,0,0)")
	public void replyInsert(ReplyVO vo);

	@Delete("DELETE FROM reply WHERE group_id=#{group_id}")
	public void replyParentDelete(int group_id);
	
	@Delete("DELETE FROM reply WHERE no=#{no}")
	public void replyDelete(String no);

	@Select("SELECT group_id,group_step,group_tab FROM reply WHERE no=#{no}")
	public ReplyVO replyParentInfo(String no);
	
	@Update("UPDATE reply SET group_step=group_step+1 WHERE group_id=#{group_id} AND group_step>#{group_step}")
	public void replyStepIncrement(ReplyVO vo); 
	
	@SelectKey(keyProperty = "no", before = true, resultType = int.class, statement = "SELECT NVL(MAX(no)+1,1) as no FROM reply")
	@Insert("INSERT INTO reply VALUES(#{no},#{bno},#{id},#{name},#{msg},SYSDATE,#{group_id},#{group_step},#{group_tab},0,0)")
	public void replyReplyWrite(ReplyVO vo);
	
	@Update("UPDATE reply SET depth=depth+1  WHERE no=#{no}")
	public void replyDepthIncrement(String no);
	
	@Update("UPDATE reply SET msg=#{msg} WHERE no=#{no}")
	public void replyUpdate(Map map);
	
	@Select("SELECT * FROM company_info")
	public List<Company_infoVO> company_info_List();
}
