package com.sist.news;

import org.springframework.stereotype.Component;

import com.sist.news.Word;
import java.util.*;
import java.io.File;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;


import kr.co.shineware.nlp.komoran.core.analyzer.Komoran;
import kr.co.shineware.util.common.model.Pair;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Component
public class NewsManager {
	static Komoran komoran=new Komoran("C:\\data2");
	static List<Word> list=new ArrayList<Word>();
	
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
	//-----------------------------------------------------------------------
	//-----------------------------------------------------------------------
	public void newsSelect()
			   throws Exception
			   {
				   list.clear();
				   File f=new File("c:\\data2\\feel.txt");
				   f.delete();
				   news_data();
				   dataSave();
			   }
	public void news_data()
			   throws Exception
			   {
				   File file=new File("c:\\data2\\desc.txt");
				   if(file.exists())
				       file.delete();
				   for(int j=0;j<12;j++){
					   String[] company = {"SKT","KT","엔씨 소프트","네이버","LG전자",
								"삼성sds","신세계 I&S","LG유플러스","효성 ITX","나이스","KTcs",
								"삼성에스원"};
				   for(int i=1;i<=10;i++)
			       {
			         String data=readNews(company[j],i);
			         System.out.println(data);
			         System.out.println("파스하기전");
			         jsonParse(data);
			       }
			       //dataSave();
				   }
			   }
	public String readNews(String company,int page)
			   throws Exception
			   {
							StringBuffer sb=new StringBuffer();
//							URL url=new URL("http://newssearch.naver.com/search.naver?where=rss&query="+URLEncoder.encode(company, "UTF-8")+"&output=json&result=20&pageno="+page);
							URL url=new URL("https://apis.daum.net/search/blog?apikey=7f0cc186c5e6fcf9cdfd7ab70a03af18&q="+URLEncoder.encode(company,"UTF-8")+"&output=json&result=20&pageno="+page);
							HttpURLConnection conn=
									(HttpURLConnection)url.openConnection();
							if(conn!=null) // 연결되었다면 
							{
								BufferedReader in=
									new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
								while(true)
								{
									String data=in.readLine();
									if(data==null)
										break;
									sb.append(data+"\n");
								}
							}
							return sb.toString();
						}
	public void komo(String s){
		List<List<Pair<String,String>>> result=komoran.analyze(s);
		
		for (List<Pair<String, String>> eojeolResult : result) {
			for (Pair<String, String> wordMorph : eojeolResult) {
				if(wordMorph.getSecond().equals("NNG")||wordMorph.getSecond().equals("NNP")){
					boolean ch=true;
					for(Word tmp:list){
						if(tmp.getWord().equals(wordMorph.getFirst())){
							int count=tmp.getCount()+1;
							tmp.setCount(count);
							ch=false;
							break;
						}
					}
					if(ch){
						Word a=new Word();
						a.setWord(wordMorph.getFirst());
						a.Incerement();
						list.add(a);
					}
				}
			}
		}
	}
	public void dataSave() throws Exception
	{
		File file = new File("c:\\data2\\desc.txt");
		FileReader fr = new FileReader(file);
//		BufferedReader br = new BufferedReader(fr);
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"EUC-KR"));

		String str = "";
		while((str = br.readLine()) != null) {
			komo(str);
		}
		
		String s1 = "";
		int ttt = 1;
		for(int i=0; i<list.size(); i++){
			for(int j=i; j<list.size(); j++){
				if(list.get(j).getCount()>list.get(i).getCount()){
					s1 = list.get(i).getWord();
					ttt = list.get(i).getCount();
					list.get(i).setWord(list.get(j).getWord()); 
					list.get(i).setCount(list.get(j).getCount());
					list.get(j).setWord(s1);
					list.get(j).setCount(ttt);
				}
			}
		}
		
//		for(Word tmp:list){
//			System.out.println(tmp.getWord()+" "+tmp.getCount());
//		}
		String[] company = {"SKT","KT","엔씨 소프트","네이버","LG전자",
				"삼성sds","신세계 I&S","LG유플러스","효성 ITX","나이스","KTcs",
				"삼성에스원"};
//		# 국내
//		   SKT : SK Telecom Co. Ltd. (017670.KS) 
//		   KT : KT Corp. (030200.KS)
//		   엔씨 소프트 : NCsoft Corporation (036570.KS)
//		   네이버 : Naver Corporation (035420.KS)
//		   LG전자 : LG Electronics Inc. (066570.KS)
//		   삼성sds : Samsung SDS Co., Ltd. (018260.KS)
//		   신세계 I&S : SHINSEGAE Information & Communication Co., LTD (035510.KS)
//		   LG유플러스 :  LG Uplus Corp. (032640.KS)
//		   효성 ITX : Hyosung ITX Co. Ltd. (094280.KS)
//		   나이스 : NICE Holdings Co., Ltd. (034310.KS)
//		   KTcs : KTCS Corporation (058850.KS)
//		   삼성에스원 : S-1 Corporation (012750.KS)
//		         
//
//		# 해외
//		   아마존 : Amazon.com, Inc. (AMZN) 
//		   AT&T : AT&T, Inc. (T)
//		   애플 : Apple Inc. (AAPL)
//		   마이크로소프트 : Microsoft Corporation (MSFT)
//		   인텔 : Intel Corporation (INTC)
//		   어도비 : Adobe Systems Incorporated (ADBE)
//		   NVIDIA : NVIDIA Corporation (NVDA) 
//		   FaceBook : Facebook, Inc. (FB)
//		   Netflix : Netflix, Inc. (NFLX)
//		   구글 : Alphabet Inc. (GOOG)
//		   paypal : PayPal Holdings, Inc. (PYPL)
//		   퀄컴 : QUALCOMM Incorporated (QCOM)
		   
		File f=new File("c:\\data2\\feel.txt");
		if(!f.exists())
		{
			f.createNewFile();
		}
		FileWriter fw=new FileWriter(f);
		String data="word,count\n";
		for(Word tmp:list){
			for(int k = 0; k<company.length; k++){
				if(company[k].equals(tmp.getWord()))
				{
					data+=tmp.getWord()+","
						+tmp.getCount()+"\n";
				}
				//System.out.println(tmp.getWord()+" "+tmp.getCount());
			}
//			System.out.println(tmp.getWord()+" "+tmp.getCount());
		}
		fw.write(data);
		fw.close();
	}
	public void jsonParse(String json)
		     throws Exception
					{
						// {}  [] 
						JSONParser jp=new JSONParser();
						JSONObject jo=(JSONObject)jp.parse(json);
						JSONObject channel=(JSONObject)jo.get("channel");
						JSONArray array=(JSONArray)channel.get("item");
						// description
						String desc="";
						for(int i=0;i<array.size();i++)
						{
							JSONObject obj=(JSONObject)array.get(i);
							String data=(String)obj.get("description");
							//System.out.println(data);
							desc+=data+"\n";
						}
						desc=desc.replaceAll("&lt;", "");//< &lt;%name%&gt; <%=name%>
						desc=desc.replaceAll("&gt;", "");//>
						desc=desc.replaceAll("&lt;", "");
						desc=desc.replaceAll("/b&gt;", "");
						desc=desc.replaceAll("b&gt;", "");
						desc=desc.replaceAll("&quot;", "");
						desc=desc.replaceAll("&#39", "");
						desc=desc.replace(".", "");
						desc=desc.replace("?", "");
						desc=desc.replace("/b", "");
						desc=desc.replace("/", "");
						desc=desc.replace(";", "");
						//System.out.println(desc);
						File file=new File("c:\\data2\\desc.txt");
						FileWriter fw=new FileWriter(file);
						fw.write(desc);
						fw.close();
					}
}
