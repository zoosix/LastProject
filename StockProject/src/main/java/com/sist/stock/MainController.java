package com.sist.stock;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stock.dao.YahooStockVO;
import com.stock.dao.ExVO;
import com.stock.dao.RSSReader;
import com.stock.dao.StockDAO;
import com.stock.dao.StockRankVO;


@Controller
public class MainController {
   @Autowired
   private StockDAO dao;
   @RequestMapping("main.do")
   public String main_page(String page,Model model)
   {
	   String msg="HOME";
	   model.addAttribute("msg",msg);
	   model.addAttribute("list",YahooStockListData());
	   ExVO vo=exchange();
	   model.addAttribute("elist",exData());
	   model.addAttribute("ex",vo);
	   try {
       	RSSReader reader = RSSReader.getInstance();
		reader.setURL(new URL("http://newssearch.naver.com/search.naver?where=rss&query=�궪�꽦�쟾�옄"));		int r=(int)(Math.random()*255);
			int g=(int)(Math.random()*255);
			int b=(int)(Math.random()*255);
			model.addAttribute("r", r);
			model.addAttribute("g", g);
			model.addAttribute("b", b);
			model.addAttribute("rlist", reader.writeFeed());

       } catch (Exception e) {
          e.printStackTrace();
       }
      
      return "main";
   }
   
   @RequestMapping("stockrank.do")
	public String stock_rank(Model model) throws IOException
	{
		 List<StockRankVO> list=dao.stock_rank();
		   model.addAttribute("list", list);
		  String image = dao.kospiImage();
		  model.addAttribute("image", image);
		   return "stockrank/stockrank";
	}
   
   @RequestMapping("test.do")
   public String test(String no,Model model)
   {
	   model.addAttribute("no",no);
	   return "ajax/test";
   }

   @RequestMapping("category.do")
   public String category_list(String cate,Model model)
   {
	   //System.out.println(cate);
	   model.addAttribute("cate",cate);
	   //YahooStockListData(cate)
	   List<YahooStockVO> list=new ArrayList<YahooStockVO>();
	   list=ListData(cate);
	   model.addAttribute("list",list);
	   return "ajax/tab";
   }
   public static List<YahooStockVO>  YahooStockListData()
	{	
		List<YahooStockVO> list=new ArrayList<YahooStockVO>();
		try{
			URL url=new URL("http://finance.yahoo.com/d/quotes.csv?s=AMZN+T+AAPL+MSFT+INTC+ADBE+NVDA+FB+NFLX+GOOG+PYPL+QCOM&f=snd1ll1j1opt1jkghc1");
			StringBuffer sb=new StringBuffer();
			String line="";
			URLConnection conn=url.openConnection();
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			//br.readLine();
			while(true)
			{
				line=br.readLine();
				if(line==null) break;
				line=line.replace(", Inc", " ");
				line=line.replace("\"", "");
				StringTokenizer st=new StringTokenizer(line,",");
				YahooStockVO vo=new YahooStockVO();
				vo.setSymbol(st.nextToken());
				vo.setName(st.nextToken().replace(".", ""));
				vo.setLastDate(st.nextToken());
				vo.setLastTimePrice(st.nextToken());
				vo.setLastPrice(st.nextToken());
				vo.setMarketTotal(st.nextToken());
				vo.setOpen(st.nextToken());
				vo.setPreviousClose(st.nextToken());
				vo.setLastTime(st.nextToken());
				vo.setWeek52Low(st.nextToken());
				vo.setWeek52High(st.nextToken());
				vo.setDayLow(st.nextToken());
				vo.setDayHigh(st.nextToken());
				vo.setChange(st.nextToken());
				vo.setTcolor(vo.getChange().substring(0,1));
				sb.append(line+"\n");
				
				list.add(vo);
				
			}
			//Thread.sleep(1000);
			//System.out.println("---------"+sb.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			System.out.println("input "+e.getMessage());
		}
		return list;
	}

   /*
    * 1) �쟾泥� 
    * 
    *          URL url =new URL("http://finance.yahoo.com/d/quotes.csv?s=AMZN+T+AAPL+MSFT+INTC+ADBE+NVDA+FB+NFLX+GOOG+PYPL+QCOM"
         + "+017670.KS+030200.KS+036570.KS+035420.KS+066570.KS+018260.KS+035510.KS+032640.KS+094280.KS+034310.KS+058850.KS+012750.KS&f=snd1ll1j1opt1jkghc1");
    *   
    * 2) �빐�쇅
    *          URL url=new URL("http://finance.yahoo.com/d/quotes.csv?s=AMZN+T+AAPL+MSFT+INTC+ADBE+NVDA+FB+NFLX+GOOG+PYPL+QCOM&f=snd1ll1j1opt1jkghc1");
    * 
    * 3) 援��궡
    *          URL url=new URL("http://finance.yahoo.com/d/quotes.csv?s=017670.KS+030200.KS+036570.KS+035420.KS+066570.KS+018260.KS+035510.KS+032640.KS+094280.KS+034310.KS+058850.KS+012750.KS&f=snd1ll1j1opt1jkghc1");
    * 
    */
  public static List<YahooStockVO> ListData(String category)
	{	
		List<YahooStockVO> list=new ArrayList<YahooStockVO>();
		try{
			URL url=null;
			if(category.equals("all"))
			{
				url=new URL("http://finance.yahoo.com/d/quotes.csv?s=AMZN+T+AAPL+MSFT+INTC+ADBE+NVDA+FB+NFLX+GOOG+PYPL+QCOM"
			               + "+017670.KS+030200.KS+036570.KS+035420.KS+066570.KS+018260.KS+035510.KS+032640.KS+094280.KS+034310.KS+058850.KS+012750.KS&f=snd1ll1j1opt1jkghc1");
			}
			if(category.equals("for"))
			{
				url=new URL("http://finance.yahoo.com/d/quotes.csv?s=AMZN+T+AAPL+MSFT+INTC+ADBE+NVDA+FB+NFLX+GOOG+PYPL+QCOM&f=snd1ll1j1opt1jkghc1");
			}
			if(category.equals("kor"))
			{
				url=new URL("http://finance.yahoo.com/d/quotes.csv?s=017670.KS+030200.KS+036570.KS+035420.KS+066570.KS+018260.KS+035510.KS+032640.KS+094280.KS+034310.KS+058850.KS+012750.KS&f=snd1ll1j1opt1jkghc1");
			}

			StringBuffer sb=new StringBuffer();
			String line="";
			URLConnection conn=url.openConnection();
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			//br.readLine();
			while(true)
			{
				line=br.readLine();
				if(line==null) break;
				line=line.replace(", Inc", " ");
				line=line.replace("\"", "");
				StringTokenizer st=new StringTokenizer(line,",");
				YahooStockVO vo=new YahooStockVO();
				vo.setSymbol(st.nextToken());
				vo.setName(st.nextToken().replace(".", ""));
				vo.setLastDate(st.nextToken());
				vo.setLastTimePrice(st.nextToken());
				vo.setLastPrice(st.nextToken());
				vo.setMarketTotal(st.nextToken());
				vo.setOpen(st.nextToken());
				vo.setPreviousClose(st.nextToken());
				vo.setLastTime(st.nextToken());
				vo.setWeek52Low(st.nextToken());
				vo.setWeek52High(st.nextToken());
				vo.setDayLow(st.nextToken());
				vo.setDayHigh(st.nextToken());
				vo.setChange(st.nextToken());
				vo.setTcolor(vo.getChange().substring(0,1));
				sb.append(line+"\n");
				
				list.add(vo);
				
			}
			//Thread.sleep(1000);
			//System.out.println("---------"+sb.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			System.out.println("input "+e.getMessage());
		}
		return list;
	}
  public static List<YahooStockVO> exData()
	{	
		List<YahooStockVO> list=new ArrayList<YahooStockVO>();
		try{
			URL url=null;
			ExVO v=exchange();
			for(int i=0;i<2;i++)
			{
				if(i==0) url=new URL("http://finance.yahoo.com/d/quotes.csv?s=AMZN+T+AAPL+MSFT+INTC+ADBE+NVDA+FB+NFLX+GOOG+PYPL+QCOM&f=snd1ll1j1opt1jkghc1k3");
				if(i==1) url=new URL("http://finance.yahoo.com/d/quotes.csv?s=017670.KS+030200.KS+036570.KS+035420.KS+066570.KS+018260.KS+035510.KS+032640.KS+094280.KS+034310.KS+058850.KS+012750.KS&f=snd1ll1j1opt1jkghc1k3");
				StringBuffer sb=new StringBuffer();
				String line="";
				URLConnection conn=url.openConnection();
				BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
				//br.readLine();
				while(true)
				{
					line=br.readLine();
					if(line==null) break;
					line=line.replace(", Inc", " ");
					line=line.replace("\"", "");
					StringTokenizer st=new StringTokenizer(line,",");
					YahooStockVO vo=new YahooStockVO();
					vo.setSymbol(st.nextToken());
					vo.setName(st.nextToken().replace(".", ""));
					vo.setLastDate(st.nextToken());
					vo.setLastTimePrice(st.nextToken());
					String ee=st.nextToken();
					Double e=Double.parseDouble(ee);
					if(i==0)
					{
						e=e*v.getEx();
						ee=String.format("%.2f", e);
						System.out.println(ee);
						vo.setLastPrice(ee);
					}
					if(i==1)
					{
						ee=String.format("%.2f", e);
						vo.setLastPrice(ee);
					}
					vo.setMarketTotal(st.nextToken());
					vo.setOpen(st.nextToken());
					vo.setPreviousClose(st.nextToken());
					vo.setLastTime(st.nextToken());
					vo.setWeek52Low(st.nextToken());
					vo.setWeek52High(st.nextToken());
					vo.setDayLow(st.nextToken());
					vo.setDayHigh(st.nextToken());
					vo.setChange(st.nextToken());
					vo.setTcolor(vo.getChange().substring(0,1));
					vo.setLastTradeSize(Integer.parseInt(st.nextToken()));
					sb.append(line+"\n");
					
					list.add(vo);
					
				}
			}
			System.out.println(list.size());
			//Thread.sleep(1000);
			//System.out.println("---------"+sb.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
			System.out.println("input "+e.getMessage());
		}
		return list;
	}
 public static ExVO exchange()
	{
	   ExVO vo=new ExVO();
		try
		{	
			//snd1lt1
			URL url=new URL("http://finance.yahoo.com/d/quotes.csv?s=USDKRW=X&f=d1l1");
			//StringBuffer sb=new StringBuffer();
			
			String line="";
			URLConnection conn=url.openConnection();
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
		
				line=br.readLine();
				//System.out.println(line);
				line=line.replace(", Inc", " ");
				line=line.replace("\"", "");
				//System.out.println(line);
				StringTokenizer st=new StringTokenizer(line,",");
				String date=st.nextToken();
				String ee=st.nextToken();
				//int e=Integer.parseInt(ee.substring(0,ee.lastIndexOf(".")));
				Double e=Double.parseDouble(ee);
				vo.setDate(date);
				vo.setEx(e);
				System.out.println("controller"+e);
		}catch(Exception ex)
		{
			System.out.println(ex.getMessage());
		}
		return vo;
	}
   public static boolean StockListData() {
      boolean check=false;
      int count=0;
      try {

       //AMZN+T+AAPL+MSFT+INTC+ADBE+NVDA+FB+NFLX+GOOG+017670.KS+030200.KS+036570.KS+035420.KS+066570.KS+018260.KS+047080.KQ+063080.KQ+095660.KQ+035720.KQ

       
       
  	  String [][] str={ {"AMZN","Amazon"}, {"T","AT&T"},{"AAPL","Apple"},{"MSFT","Microsoft"},{"INTC","Intel"},{"ADBE","Adobe Systems"},{"NVDA","NVIDIA"},{"FB","Facebook"},{"NFLX","Netflix"},{"GOOG","Alphabet"}
			,{"017670.KS","SK�뀛�젅肄�"},{"030200.KS","KT"},{"036570.KS","NCsoft"},{"035420.KS","Naver"},{"066570.KS","LG�쟾�옄"},
			{"018260.KS","�궪�꽦SDS"},{"012750.KS","�궪�꽦�뿉�뒪�썝"},{"058850.KS","KTcs"},{"034310.KS","�굹�씠�뒪"},{"094280.KS","�슚�꽦 ITX"}};

         //URL url=new URL("http://finance.yahoo.com/d/quotes.csv?s="+ str[i][0]+ "&f=snl1");
         URL url=new URL("http://finance.yahoo.com/d/quotes.csv?s=AMZN+T+AAPL+MSFT+INTC+ADBE+NVDA+FB+NFLX+GOOG+PYPL+QCOM+017670.KS+030200.KS+036570.KS+035420.KS+066570.KS+018260.KS+047080.KQ+063080.KQ+095660.KQ+035720.KQ+022100.KQ+010280.KQ&f=snl1");
         StringBuffer sb=new StringBuffer();
         String line="";
         URLConnection conn=url.openConnection();
         if(conn==null)
            return false;
         BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
         //br.readLine();
         while(true)
         {
            line=br.readLine();
            
            if(line==null) break;
            sb.append(line+"\n");
            System.out.println("+++"+line);
            count++;
         }
         System.out.println();
         System.out.println("=================  "+ str[1]+ "===================== end" );
         System.out.println();
         //Thread.sleep(1000);
         System.out.println("---------"+sb.toString());
         
         System.out.println("=============  count : "+count);
      } catch (Exception e) {
         e.printStackTrace();
         System.out.println("input "+e.getMessage());
      }
      return check;
   }
}
