package com.sist.news;

import org.springframework.stereotype.Component;
import java.util.*;
import java.net.*;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
@Component
public class NewsManager {
	public List<Item> getNewsData(String news) {
		List<Item> list=new ArrayList<Item>();
		
		try {
			JAXBContext jc=JAXBContext.newInstance(Rss.class);
			Unmarshaller um=jc.createUnmarshaller();
			URL url=new URL("http://newssearch.naver.com/search.naver?where=rss&query="+URLEncoder.encode(news, "UTF-8"));
			Rss r=(Rss)um.unmarshal(url);
			list=r.getChannel().getItem();
			
			for(Item item:list) {
				item.setPubDate(item.getPubDate().substring(0,item.getPubDate().lastIndexOf(":")+3));
				list.add(item);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}
}
