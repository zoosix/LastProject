package com.sist.stock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.*;

import com.sist.news.*;
@Controller
public class NewsController {
	@Autowired
	private NewsManager manager;
	@RequestMapping("news.do")
	public String news_list(String find,Model model) throws InterruptedException {
		if(find==null)
			find="삼성";
		List<Item> list=manager.getNewsData(find);
		/*String[] temp={"[","...","&quot;","&lt;","&gt;","'","'","\""};
		for(Item item:list) {
			for(String s:temp) {
				item.getDescription().replace(s, "");
			}
			list.add(item);
		}*/
		
		model.addAttribute("list", list);
		return "news/news";
	}
}
