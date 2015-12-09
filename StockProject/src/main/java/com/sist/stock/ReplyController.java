package com.sist.stock;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.inform.dao.InformDAO;
import com.inform.dao.InformVO;
import com.inform.dao.ReplyDAO;
import com.inform.dao.ReplyVO;


@Controller
public class ReplyController {
	@Autowired
	private ReplyDAO dao;
	@Autowired
	InformDAO dao1;
	
	@RequestMapping("inform_main.do")
	public String inform_main(String bno,Model model) throws IOException{
		String msg="회사상세정보";
		model.addAttribute("msg",msg);
		if(bno==null)bno="3";
		model.addAttribute("bno",bno);
		String code=dao1.code_serach(bno);
		InformVO list1=dao1.company_sinfo(code);
		model.addAttribute("list1",list1);
		InformVO list3=dao1.company_info(code);
		model.addAttribute("list3",list3);
		InformVO list4=dao1.recent_date(code);
		model.addAttribute("list4",list4);
		InformVO list5=dao1.recent_info(code);
		model.addAttribute("list5",list5);
		InformVO list6=dao1.product(code);
		model.addAttribute("list6",list6);
		InformVO list7=dao1.product_rate(code);
		model.addAttribute("list7",list7);
		InformVO list8=dao1.sisae(code);
		model.addAttribute("list8",list8);
		return "inform/inform_main";
	}
	@RequestMapping("inform_reply.do")
	public String inform_reply(Model model,String bno,String no,String page,String en,HttpSession session,String msg,String del,String re,String up) throws IOException{
		
		if(bno==null) bno="1";
		if(page==null) page="1";
		String email=(String)session.getAttribute("email");
		String name=(String)session.getAttribute("name");
		
		
		if(en!=null){
			replyWrite(email, name, bno, msg);
		}
		if(del!=null){
			ReplyVO vo=dao.replyParentInfo(no);
			if(vo.getGroup_step()==0){
			dao.replyParentDelete(vo.getGroup_id());
			}
			else{
			dao.replyDelete(no);
			}
		}
		if(re!=null){
			replyReplyWrite(no, email, bno, name, msg);			
		}
		if(up!=null){
			replyUp(msg, no);
		}
		int curpage=Integer.parseInt(page);
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		ReplyVO vo=new ReplyVO();
		vo.setBno(Integer.parseInt(bno));
		vo.setStart(start);
		vo.setEnd(end);
		List<ReplyVO> list=dao.replyListData(vo);
		int totalpage=dao.replyRowCount(bno);
		model.addAttribute("curpage", curpage);
		model.addAttribute("list",list);
		model.addAttribute("bno",bno);
		model.addAttribute("totalpage",totalpage);
		return "ajax/inform_reply";
	}
	public void replyUp(String msg,String no){
		Map map=new HashMap();
		map.put("msg",msg);
		map.put("no", no);
		dao.replyUpdate(map);
	}
	
	//댓글 추가
	public void replyWrite(String email,String name,String bno,String msg){
		ReplyVO vo=new ReplyVO();
		vo.setId(email);
		vo.setName(name);
		vo.setBno(Integer.parseInt(bno));
		vo.setMsg(msg);
		dao.replyInsert(vo);	
	}
	
	//댓글에 댓글 추가
	public void replyReplyWrite(String no,String email,String bno,String name,String msg){
		ReplyVO info=dao.replyParentInfo(no);
		dao.replyStepIncrement(info);
		ReplyVO d=new ReplyVO();
		d.setId(email);
		d.setBno(Integer.parseInt(bno));
		d.setName(name);
		d.setMsg(msg);
		d.setGroup_id(info.getGroup_id());
		d.setGroup_step(info.getGroup_step()+1);
		d.setGroup_tab(info.getGroup_tab()+1);
		dao.replyReplyWrite(d);
		dao.replyDepthIncrement(no);
	}

}
