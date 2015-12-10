package com.sist.stock;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.twit.dao.TwitterDAO;
import com.twit.dao.TwitterVO;
import com.twit.main.MyTwitterStream;


@Controller
public class TwitController {
	  @Autowired
	   private TwitterDAO twitdao;
	   
	   @Autowired
	   private MyTwitterStream ms;
	   
	   @RequestMapping("social.do")
	   public String twit_page(String page,Model model)
	   {
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   List<TwitterVO> list=twitdao.dataAll(curpage);
		   int totalpage=twitdao.dataTotalPage();
		   String msg="소셜분석";
		   model.addAttribute("list", list);
		   model.addAttribute("curpage", curpage);
		   model.addAttribute("totalpage", totalpage);
		   model.addAttribute("msg", msg);
		   return "social/social";
	   }
	   @PostConstruct
	   public void init()
	   {
		   ms.twitterStart();
	   }
}
