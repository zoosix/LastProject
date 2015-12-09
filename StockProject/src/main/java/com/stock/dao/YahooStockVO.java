package com.stock.dao;

public class YahooStockVO {
	/*
	sysmbol // s  코드  
	name // n 이름
	Last Trade Date // d1 마지막 날자 (년일월)
	Last Trade (With Time) // l 마지막 시간만(시분) 플러스 가격  
	Last Trade (Price Only) // l1 마지막 가격 
	Market Capitalization //j1 시총
	open //o  오픈가  
	Previous Close //p  전날 종가
	Last Trade Time //t1
	52-week Low //j 52주 저
	52-week High //k 52주 고
	Day��s Low //g 일의 저
	Day��s High //h 일의 고
	Change //c1 변화
	http://finance.yahoo.com/d/quotes.csv?s=GE+PTR+MSFT+005930.ks&f=snd1ll1j1opt1jkghc1
	*/
	private String symbol; // s  코드  
	private String name; // n 이름
	private String lastDate; // d1 마지막 날자 (년일월)
	private String lastTimePrice; // l 마지막 시간만(시분) 플러스 가격 
	private String lastPrice; // l1 마지막 가격 
	private String marketTotal; //j1 시총
	private String open; //o  오픈가    
	private String previousClose; //p  전날 종가
	private String lastTime; //t1
	private String week52Low; //j 52주 저
	private String week52High; //k 52주 고  
	private String dayLow; //g 일의 저
	private String dayHigh; //h 일의 고
	private String change; //c1 변화
	private String tcolor;
	private int no;
	private String inputTime;
	private String rate;

	private int lastTradeSize;
	
	//종목명 현재가  전일대비  등락률=(현재가-어제가)/어제가*100
	//name/lasPrice/previousClose   (lasPrice-previousClose)/previousClose*100
	
	public int getLastTradeSize() {
		return lastTradeSize;
	}
	public void setLastTradeSize(int lastTradeSize) {
		this.lastTradeSize = lastTradeSize;
	}
	public int getNo() {
		return no;
	}
	public String getRate() {
		return rate;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getInputTime() {
		return inputTime;
	}
	public void setInputTime(String inputTime) {
		this.inputTime = inputTime;
	}
	public String getTcolor() {
		return tcolor;
	}
	public void setTcolor(String tcolor) {
		this.tcolor = tcolor;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getLastTimePrice() {
		return lastTimePrice;
	}
	public void setLastTimePrice(String lastTimePrice) {
		this.lastTimePrice = lastTimePrice;
	}
	public String getLastPrice() {
		return lastPrice;
	}
	public void setLastPrice(String lastPrice) {
		this.lastPrice = lastPrice;
	}
	public String getMarketTotal() {
		return marketTotal;
	}
	public void setMarketTotal(String marketTotal) {
		this.marketTotal = marketTotal;
	}
	public String getOpen() {
		return open;
	}
	public void setOpen(String open) {
		this.open = open;
	}
	public String getPreviousClose() {
		return previousClose;
	}
	public void setPreviousClose(String previousClose) {
		this.previousClose = previousClose;
	}
	public String getLastTime() {
		return lastTime;
	}
	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}
	public String getWeek52Low() {
		return week52Low;
	}
	public void setWeek52Low(String week52Low) {
		this.week52Low = week52Low;
	}
	public String getWeek52High() {
		return week52High;
	}
	public void setWeek52High(String week52High) {
		this.week52High = week52High;
	}
	public String getDayLow() {
		return dayLow;
	}
	public void setDayLow(String dayLow) {
		this.dayLow = dayLow;
	}
	public String getDayHigh() {
		return dayHigh;
	}
	public void setDayHigh(String dayHigh) {
		this.dayHigh = dayHigh;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	
	
	
}
