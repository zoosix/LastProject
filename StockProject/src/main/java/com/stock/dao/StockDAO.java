package com.stock.dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class StockDAO {
	
	@Autowired
	   private StockMapper mapper; 
	   
	/*public int boardTotalpage()
	   {
	      int count=mapper.boardRowCount();
	      return count;
	   }*/
	   public void stockInsert(List<YahooStockVO> list)
	   {
	      for(YahooStockVO vo:list)
	      {
	         mapper.stockInsert(vo);
	      }
	   }
	   
	   public List<YahooStockVO> stockAllData()
	   {
	      return mapper.stockAllData();
	            
	   }
	   public List<YahooStockVO> stock6Data(String symbol)
	   {
	      return mapper.stock6Data(symbol);
	   }
	   public String stock6DataString(String symbol)
	   {
	      String temp="";
	      List<YahooStockVO> list=mapper.stock6Data(symbol);
	      for(YahooStockVO vo:list)
	      {
	         temp=temp+vo.getLastPrice()+",";
	      }
	      return temp.substring(0, temp.length()-1);
	         
	   }
	   
	   public List<StockRankVO> stock_rank()
		{
			List<StockRankVO> list = new ArrayList<StockRankVO>();
			Document document;
			try {
				document = Jsoup.connect("http://finance.naver.com/sise/lastsearch2.nhn").get();
				Elements tbody = document.select("table.type_5 tbody");
			int i = 0;
			for (Element t : tbody) {
				Elements tr = t.getElementsByTag("tr");
				for (Element row : tr) {
					Elements td=row.getElementsByTag("td");
					String head="no,name,searchRate,now,compare,percent,amount,price,high,low,per,roe \n";
					String str ="";
					
					for(Element num:td){
						if(num.hasAttr("colspan")){
							continue;
						}
						if(num.hasClass("no")){
							str += num.text()+" ";
						}
						else if(num.hasClass("number")){
							str += num.text()+" ";
						}
						else{
							str += num.text()+" ";
						}
					}
					if(str.equals(""))
						continue;
					else
					{
						StockRankVO vo=new StockRankVO();
						System.out.println(str);
						StringTokenizer st = new StringTokenizer(str," ");
						vo.setNo(st.nextToken());
						vo.setName(st.nextToken());
						String temp=st.nextToken();
						vo.setSearchRate(Double.parseDouble(temp.substring(0,temp.lastIndexOf('%'))));
						vo.setNow(st.nextToken());
						vo.setCompare(st.nextToken());
						vo.setPercent(st.nextToken());
						vo.setAmount(st.nextToken());
						vo.setPrice(st.nextToken());
						vo.setHigh(st.nextToken());
						vo.setLow(st.nextToken());
						vo.setPer(st.nextToken());
						vo.setRoe(st.nextToken());
						list.add(vo);
					}
					i++;
					if(i>9)
						break;
				}
				
			}
				} catch (IOException ex) {
					// TODO Auto-generated catch block
					System.out.println(ex.getMessage());
				}
			return list;
		}
	   public String kospiImage() throws IOException
	   {
		    Document document;
		   	document = Jsoup.connect("http://finance.naver.com/sise/sise_index.nhn?code=KOSPI").get();
			Elements elements = document.select("div.graph img");
			System.out.println(elements);
			String image=elements.attr("src");
			System.out.println(image);
			
			return image;
	   }
}
