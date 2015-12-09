package com.inform.dao;
import java.io.IOException;
import java.util.StringTokenizer;

import org.apache.ibatis.annotations.Case;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Repository;
@Repository
public class InformDAO {
	//Samsung SDS,KOSPI : 서비스업,WICS : IT서비스,BPS 53,164,PER 49.94,업종PER 58.05,PBR 5.01,배당수익률 0.19%,
		public InformVO company_sinfo(String code) throws IOException{
			Document document=Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/c1020001.aspx?cmp_cd="+code).get();
			Elements info=document.select("tr.cmp-table-row dt.line-left");
			String company_data1="";
			for(int i=0;i<info.size();i++) {
				String data=info.get(i).text();
				company_data1+=data+"_";
			}
			company_data1=company_data1.substring(0,company_data1.lastIndexOf('_'));
			StringTokenizer st=new StringTokenizer(company_data1,"_");
			InformVO vo=new InformVO();
			vo.setD1_name(st.nextToken());
			vo.setD1_kosipi(st.nextToken());
			vo.setD1_WICS(st.nextToken());
			vo.setD1_BPS(st.nextToken());
			vo.setD1_PER(st.nextToken());
			vo.setD1_up_PER(st.nextToken());
			vo.setD1_PBR(st.nextToken());
			vo.setD1_income(st.nextToken());
			return vo; 
		}
		public InformVO company_gaeyo(String code) throws IOException{
			Document document=Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/c1010001.aspx?cmp_cd="+code).get();
			Elements info=document.select("li.dot_cmp");
			String company_data2="";
			for(int i=0;i<info.size();i++) {
				String data=info.get(i).text();
				company_data2+=data+"_";
			}
			company_data2=company_data2.substring(0,company_data2.lastIndexOf('_'));
			StringTokenizer st=new StringTokenizer(company_data2,"_");
			InformVO vo=new InformVO();
			vo.setD2_con1(st.nextToken());
			vo.setD2_con2(st.nextToken());
			vo.setD2_con3(st.nextToken());
			vo.setD2_con4(st.nextToken());
			return vo;
			//동사는 1985년에 시스템통합구축서비스와 소프트웨어의 개발 및 정보처리기술에 관한 전문적 서비스 및 교육훈련 서비스 등을 사업목적으로 하여 설립하였으며 IT서비스부문과 물류BPO부문으로 사업이 구성되어 있음,IT서비스부문은 IT컨설팅서비스 및 SI서비스의 구축형사업과 애플리케이션 아웃소싱서비스와 인프라서비스의 서비스형사업으로 구성, 물류BPO서비스부문은 4PL서비스로 솔루션을 통해 제공되는 물류 가시성이 특장점,IT서비스 부문의 주요 업체는 대부분 대기업 계열사로, 계열사 레퍼런스 축적을 통해 공공 및 금융부문 등과 같은 대외영업을 활발하게 전개하였으며, 동사와 LG CNS, SK C&C가 51.7% 점유율을 차지,동사는 End-To-End IT서비스 및 통합 솔루션을 제공, 삼성 관계사를 기반으로 한 안정적 사업 기반, 선진 물류 BPO 플랫폼을 통한 서비스 경쟁력 확보, 차세대 기술 대응력의 확보 등 강점을 가지고 있음,매출구성은 IT서비스 67.68%, 물류BPO 32.32%으로 구성,
		}
		public InformVO company_info(String code) throws IOException{
			  Document document=Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/c1020001.aspx?cmp_cd="+code).get();
				Elements info=document.select("table#cTB201 td");
				String company_data3="";
				for(int i=0;i<info.size();i++) {
					String data=info.get(i).text();
					company_data3+=data+"_";
				}
				company_data3=company_data3.substring(0,company_data3.lastIndexOf('_'));
				StringTokenizer st=new StringTokenizer(company_data3,"_");
				InformVO vo=new InformVO();
				vo.setD3_addr(st.nextToken());
				vo.setD3_homep(st.nextToken());
				vo.setD3_call(st.nextToken());
				vo.setD3_create(st.nextToken());
				vo.setD3_ceo(st.nextToken());
				vo.setD3_mainName(st.nextToken());
				vo.setD3_worker(st.nextToken());
				vo.setD3_stock(st.nextToken());
				vo.setD3_detect(st.nextToken());
				vo.setD3_gaesi(st.nextToken());
				vo.setD3_bank(st.nextToken());
				return vo;
				//서울특별시 송파구 올림픽로35길 125(신천동)_http://www.sds.samsung.co.kr_02)6155-3114_1985/05/01 (상장일: 2014/11/14)_전동수
				//_삼성_14,216 (2015/09)_77,377,800 주 / 0 주_삼정회계법인_한국예탁결제원_()
		}
		public InformVO recent_date(String code) throws IOException{
			
			String company_data4="";
			 Document document=Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/c1020001.aspx?cmp_cd="+code).get();
				Elements info=document.select("table#cTB202 tbody th");
				for(int i=0;i<info.size();i++) {
					String data=info.get(i).text();
					company_data4+=data+"_";
				}
				company_data4=company_data4.substring(0,company_data4.lastIndexOf('_'));
				StringTokenizer st=new StringTokenizer(company_data4,"_");
				InformVO vo=new InformVO();
				vo.setD4_con1(st.nextToken());
				vo.setD4_con2(st.nextToken());
				vo.setD4_con3(st.nextToken());
				vo.setD4_con4(st.nextToken());
				vo.setD4_con5(st.nextToken());
			return vo;
			//2015/06_2015/06_2015/04_2015/03/13_2015/03_
		}
		public  InformVO recent_info(String code) throws IOException{
			String company_data5="";
			Document document=Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/c1020001.aspx?cmp_cd="+code).get();
			Elements info=document.select("table#cTB202 td");
			for(int i=0;i<info.size();i++) {
				String data=info.get(i).text();
				company_data5+=data+"_";
			}
			company_data5=company_data5.substring(0,company_data5.lastIndexOf('_'));
			StringTokenizer st=new StringTokenizer(company_data5,"_");
			InformVO vo=new InformVO();
			vo.setD5_con1(st.nextToken());
			vo.setD5_con2(st.nextToken());
			vo.setD5_con3(st.nextToken());
			vo.setD5_con4(st.nextToken());
			vo.setD5_con5(st.nextToken());
			return vo;
		}
		public InformVO product(String code) throws IOException{
			String company_data6="";
			Document document=Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/c1020001.aspx?cmp_cd="+code).get();
			Elements info=document.select("table#cTB203 tbody th");
			for(int i=0;i<info.size();i++) {
				String data=info.get(i).text();
				company_data6+=data+"_";
			}
			company_data6=company_data6.substring(0,company_data6.lastIndexOf('_'));
			StringTokenizer st=new StringTokenizer(company_data6,"_");
			InformVO vo=new InformVO();
			vo.setD6_con1(st.nextToken());
			vo.setD6_con2(st.nextToken());
			vo.setD6_con3(st.nextToken());
			vo.setD6_con4(st.nextToken());
			vo.setD6_con5(st.nextToken());
			vo.setD6_con6(st.nextToken());
			vo.setD6_con7(st.nextToken());
			return vo;
			//IT서비스_물류BPO_ _ _ _ _ 
		}
		public InformVO product_rate(String code) throws IOException{
			String company_data7="";
			Document document=Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/c1020001.aspx?cmp_cd="+code).get();
			Elements info=document.select("table#cTB203 tbody td");
			for(int i=0;i<info.size();i++) {
				String data=info.get(i).text();
				company_data7+=data+"_";
			}
			company_data7=company_data7.substring(0,company_data7.lastIndexOf('_'));
			StringTokenizer st=new StringTokenizer(company_data7,"_");
			InformVO vo=new InformVO();
			vo.setD7_con1(st.nextToken());
			vo.setD7_con2(st.nextToken());
			vo.setD7_con3(st.nextToken());
			vo.setD7_con4(st.nextToken());
			vo.setD7_con5(st.nextToken());
			vo.setD7_con6(st.nextToken());
			vo.setD7_con7(st.nextToken());
			return vo;
			//67.68_32.32_ _ _ _ _ 
		}
		public  InformVO sisae(String code) throws IOException{
			String company_data8="";
			Document document=Jsoup.connect("http://companyinfo.stock.naver.com/v1/company/c1010001.aspx?cmp_cd="+code).get();
			Elements info=document.select("table#cTB11 tbody td");
			for(int i=0;i<info.size();i++) {
				String data=info.get(i).text();
				company_data8+=data+"_";
			}
			company_data8=company_data8.substring(0,company_data8.lastIndexOf('_'));
			StringTokenizer st=new StringTokenizer(company_data8,"_");
			InformVO vo=new InformVO();
			vo.setD8_con1(st.nextToken());
			vo.setD8_con2(st.nextToken());
			vo.setD8_con3(st.nextToken());
			vo.setD8_con4(st.nextToken());
			vo.setD8_con5(st.nextToken());
			vo.setD8_con6(st.nextToken());
			vo.setD8_con7(st.nextToken());
			vo.setD8_con8(st.nextToken());
			vo.setD8_con9(st.nextToken());
			return vo;
			//266,500원 / -3,000원 / -1.11%_341,000원 / 226,500원_500원_51,280주 / 138억원_206,212억원_1.22_77,377,800주 / 39.66%_6.48%_+3.29%/ -4.14%/ -3.09%/ -20.21%

		}
		public String code_serach(String bno) {
		      int bbno=Integer.parseInt(bno);
		      String[] data={"017670","017670","030200","036570","035420","066570","018260",
				       "035510","032640","094280","034310","034310","012750"};
		      String code=data[bbno];
		      return code;
		   }
	
/*public static void main(String[] args) throws Exception {
		String code="018260";
		InformVO c=product_rate(code);
		System.out.println(c.getD7_con1());
		}*/
	}
