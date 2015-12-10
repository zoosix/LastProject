package com.sist.stock;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.member.*;
import com.stock.dao.CurStockVO;
import com.stock.dao.StockMapper;
import com.stock.dao.StockRankVO;
import com.stock.dao.YahooStockVO;

@Controller
public class MemberController {
	@Autowired
	private MemberDAO dao;
	@Autowired
	   private StockMapper mapper; 
	@RequestMapping("join.do")
	public String member_join(String page, Model model) {
		String msg = "회원가입";
		model.addAttribute("msg", msg);
		return "member/join";
	}
	@RequestMapping("join_ok.do")
	@ResponseBody
	public String memberInsert(String email, String pwd, String name, String gender, String birth, String tell,
			String[] favorite, Model model) {

		System.out.println("hi");
		MemberVO vo = new MemberVO();
		vo.setEmail(email);
		System.out.println("email? " + email);
		vo.setPwd(pwd);
		vo.setName(name);
		System.out.println("name: " + name);
		vo.setGender(gender);
		System.out.println("gender: " + gender);
		vo.setBirth(birth);
		System.out.println("birth: " + birth);
		vo.setTell(tell);
		System.out.println("tell: " + tell);
		String data = "";
		int i;
		String[] ftemp=new String[favorite.length];
		for (String f : favorite) {
			data += f + ",";
			for(i=0;i<ftemp.length;i++){
				ftemp[i]=f;
				
			}
			//System.out.println(ftemp[i]);
		}
		data = data.substring(0, data.length() - 1);
		System.out.println(data);
		vo.setFavorite(data);
		//System.out.println("favorite: "+favorite);
		//System.out.println("favorite: "+vo.getFavorite());

		dao.joinOk(vo);

		//model.addAttribute("email", email);
		//System.out.println("email은 " + email);
		String res = "<script>" + "location.href=\"/stock/main.do\";" + "</script>";
		return res;
	}

	@RequestMapping("login_ok.do")
	@ResponseBody
	public String memberLogin(String email, String pwd, Model model, HttpSession session) {
		System.out.println("email은? " + email);
		System.out.println("pwd은?" + pwd);
		
		int count = dao.emailCount(email);
		String res = "";
		if (count == 0) {
			res = "<script> alert(\"Login fail\");" + "history.back(); " + "</script>";
		} else {
			MemberVO vo = dao.memberGetInfo(email);
			if (pwd.equals(vo.getPwd())) {
				res = "<script>" + "location.href=\"/stock/main.do\";" + "</script>";
				session.setAttribute("email", email);
				session.setAttribute("name", vo.getName());
				session.setAttribute("favorite", vo.getFavorite());
			} else {
				res = "<script> alert(\"password Fail\");" + "history.back(); " + "</script>";
			}
			String fav = (String)session.getAttribute("favorite");
			System.out.println("favorite은?"+fav);
		}
		return res;
	}

	@RequestMapping("logout.do")
	@ResponseBody
	public String logout(HttpSession session) {
		session.invalidate();
		String res = "<script>" + "location.href=\"/finalbigdata/main.do\";" + "</script>";
		return res;
	}
	@RequestMapping("mypage.do")
	public String member_mypage(String page,Model model,HttpSession session) throws Exception{
		String msg = "마이페이지";
		model.addAttribute("msg", msg);
		String fav = (String)session.getAttribute("favorite"); 
		fav=fav.replace(',','+');
		System.out.println(fav);
    	List<YahooStockVO> list=YahooStockListData(fav); 	
    	
    	model.addAttribute("list",list);
    
		return "member/mypage";
	}

///////////////////////////소수점**************************
	private static List<YahooStockVO> YahooStockListData(String name) {
		// TODO Auto-generated method stub
		List<YahooStockVO> list=new ArrayList<YahooStockVO>();
		try{
			URL url=new URL("http://finance.yahoo.com/d/quotes.csv?s="+name+"&f=snd1ll1j1opt1jkghc1");
			StringBuffer sb=new StringBuffer();
			String line="";
			URLConnection conn=url.openConnection();
			BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
			//br.readLine();
			double rate;
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
				double a=Double.parseDouble(vo.getLastPrice())-Double.parseDouble(vo.getPreviousClose());
				double b=Double.parseDouble(vo.getPreviousClose());
				double c=(a/b)*100;
				String d=String.format("%.2f", c);
				vo.setRate(d);
				//${((f.lastPrice-f.previousClose)/f.previousClose)*100}
				list.add(vo);
				
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

}