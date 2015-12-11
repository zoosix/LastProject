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
   @Autowired
   private NewsDAO dao;
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
      dao.newsSave(find);
      dao.createImage();
      String msg = "실시간 뉴스";
      model.addAttribute("msg", msg);
      model.addAttribute("list", list);
      return "news/news";
   }
//   @RequestMapping("newsrank.do")
//   public String news_rank(Model model)throws Exception{
//      System.out.println("newsrank.do");
//      manager.newsSelect();
//      System.out.println("selec완료");
//      List<Word> fList = new ArrayList<Word>();
//      RConnection rc = new RConnection();
//      rc.setStringEncoding("utf8");
//      rc.voidEval("feel<-read.table(\"c:/data2/feel.txt\",header=T,sep=\",\")");
//      REXP p = rc.eval("feel$word");
//      String[] word = p.asStrings();
//      p = rc.eval("feel$count");
//      int[] count = p.asIntegers();
//      rc.close();
//      for (int i = 0; i < word.length; i++) {
//         Word w = new Word();
//         w.setWord(word[i]);
//         w.setCount(count[i]);
//         fList.add(w);
//      }
//      model.addAttribute("fList", fList);
//
//      return "news/newsrank";
//   }
}