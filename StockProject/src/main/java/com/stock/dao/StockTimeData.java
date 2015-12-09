package com.stock.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.StringTokenizer;

public class StockTimeData {

   public static void main(String[] args) {
      // TODO Auto-generated method stub
      StockTimeData a=new StockTimeData();
      String [] startDate ={"31","04","2014"};
      String [] endDate ={"4","5","2015"};
      //a.StockInputOracleTime(startDate,endDate);
      //StockInputOracleToday();
      long start=System.currentTimeMillis();
      double b[]=StockInputOracleMonth("AAPL");
      
      for(int i=0;i<b.length;i++)
      {
         System.out.println("-- : "+b[i]);
      }
      long end=System.currentTimeMillis();
      
      System.out.println("time : "+(end-start));
   
      
      double b1[]=StockInputOracleMonth("AAPL");
      double b2[]=StockInputOracleMonth("ORCL");
      
      System.out.println("d1 count : "+b1.length);
      System.out.println("d2 count : "+b2.length);
      
   }
   public static boolean StockInputOracleTime(String [] startDate,String [] endDate )
   {
      boolean check=false;
      int count=0;
      try {


         /*
          # 국내
   SKT : SK Telecom Co. Ltd. (017670.KS) 
   KT : KT Corp. (030200.KS)
   엔씨 소프트 : NCsoft Corporation (036570.KS)
   네이버 : Naver Corporation (035420.KS)
   LG전자 : LG Electronics Inc. (066570.KS)
   삼성sds : Samsung SDS Co., Ltd. (018260.KS)
   신세계 I&S : SHINSEGAE Information & Communication Co., LTD (035510.KS)
   LG유플러스 :  LG Uplus Corp. (032640.KS)
   효성 ITX : Hyosung ITX Co. Ltd. (094280.KS)
   나이스 : NICE Holdings Co., Ltd. (034310.KS)
   KTcs : KTCS Corporation (058850.KS)
   삼성에스원 : S-1 Corporation (012750.KS)

         
         /*01.AAPL(Apple)   
         02.TSLA(Tesla)      
         03.CSCO(Cisco)   
         04.EMC(EMC Corp)
         05.ORCL(Oracle)   
         06.FB(Facebook)   
         07.INTC(Intel)
         08.PRDSY(Prada)
         09.AMZN(Amazon)
         10.COST(Costco)*/
		String [][] str={ {"AMZN","Amazon"}, {"T","AT&T"},{"AAPL","Apple"},{"MSFT","Microsoft"},{"INTC","Intel"},{"ADBE","Adobe Systems"},{"NVDA","NVIDIA"},{"FB","Facebook"},{"NFLX","Netflix"},{"GOOG","Alphabet"}
			,{"017670.KS","SK�ڷ���"},{"030200.KS","KT"},{"036570.KS","NCsoft"},{"035420.KS","Naver"},{"066570.KS","LG����"},
			{"018260.KS","�ＺSDS"},{"047080.KQ","�Ѻ�����Ʈ"},{"063080.KQ","���Ӻ�"},{"095660.KQ","�׿�����Ȧ����"},{"035720.KQ","īī��"}};
         for(int i=0;i<str.length;i++){
         URL url=new URL("http://real-chart.finance.yahoo.com/table.csv?s=" + str[i][0]+ "&a="+startDate[1]+"&b="+startDate[0]+"&c="+startDate[2]+"&d="+endDate[1]+"&e="+endDate[0]+"&f="+endDate[2]+"&g=d&ignore=.csv");
         StringBuffer sb=new StringBuffer();
         String line="";
         URLConnection conn=url.openConnection();
         if(conn==null)
            return false;
         BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
         br.readLine();
         while(true)
         {
            line=br.readLine();
            sb.append(line+"\n");
            if(line==null) break;
            System.out.println(line);
            count++;
         }
         System.out.println();
         System.out.println("=================  "+ str[i]+ "===================== end" );
         System.out.println();
         //Thread.sleep(1000);
         }
         System.out.println("=============  count : "+count);
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         
         System.out.println("input "+e.getMessage());
      }
      return check;
   }
   public static boolean StockInputOracleToday()
   {
      Calendar cal = new GregorianCalendar();
       cal.add(Calendar.DATE, -1);

   SimpleDateFormat day=new SimpleDateFormat("dd");
   SimpleDateFormat month=new SimpleDateFormat("MM");
   SimpleDateFormat year=new SimpleDateFormat("yyyy");
   SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
   Date yesterday=cal.getTime();
   Date today=new Date();
   String re=day.format(yesterday);
   
   String [] startDate1 ={day.format(yesterday).toString(),String.valueOf(cal.get(Calendar.MONTH)),year.format(yesterday)};
   String [] endDate1={day.format(today).toString(),month.format(today).toString(),year.format(today)};
   
      return StockInputOracleTime(startDate1, endDate1) ;
   }
   
   
   public static double[] StockInputOracleMonth(String StockName)
   {
      Calendar cal = new GregorianCalendar();
       cal.add(Calendar.MONTH, -3);

	   SimpleDateFormat day=new SimpleDateFormat("dd");
	   SimpleDateFormat month=new SimpleDateFormat("MM");
	   SimpleDateFormat year=new SimpleDateFormat("yyyy");
	   SimpleDateFormat d=new SimpleDateFormat("yyyy-MM-dd");
	   Date yesterday=cal.getTime();
	   Date today=new Date();
	   String re=day.format(yesterday);
	   
	   String [] startDate1 ={day.format(yesterday).toString(),String.valueOf(cal.get(Calendar.MONTH)),year.format(yesterday)};
	   String [] endDate1={day.format(today).toString(),month.format(today).toString(),year.format(today)};
   
      return StockMonthData(startDate1, endDate1,StockName) ;
   }
   
   
   public static double[] StockMonthData(String [] startDate,String [] endDate ,String StockName)
   {
      List<Double> list=new ArrayList<Double>();
      boolean check=false;
      int count=0;
      try {
         
         URL url=new URL("http://real-chart.finance.yahoo.com/table.csv?s=" + StockName+ "&a="+startDate[1]+"&b="+startDate[0]+"&c="+startDate[2]+"&d="+endDate[1]+"&e="+endDate[0]+"&f="+endDate[2]+"&g=d&ignore=.csv");
         StringBuffer sb=new StringBuffer();
         String line="";
         URLConnection conn=url.openConnection();
         BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
         br.readLine();
         while(true)
         {
            line=br.readLine();
            if(line==null) break;
            sb.append(line+"\n");
            
            StringTokenizer st=new StringTokenizer(line,",");
            st.nextToken();
            st.nextToken();
            st.nextToken();
            st.nextToken();
            String a=st.nextToken();
            list.add(Double.valueOf(a));
            System.out.println(a);
            
            //System.out.println(line);
            count++;
         }
         System.out.println();
         System.out.println("=================  "+ StockName+ "===================== end" );
         System.out.println();
         //Thread.sleep(1000);
         
         System.out.println("=============  count : "+count);
         
         System.out.println("------------------------");
         System.out.println(sb.toString());
         
      } catch (Exception e) {
         // TODO: handle exception
         e.printStackTrace();
         
         System.out.println("input "+e.getMessage());
      }
      double [] a=new double[list.size()];

      for(int i=0;i<list.size();i++)
      {
         a[i]=list.get(i);
      }
      System.out.println("-----------------------------------");
      return a;
   }
}

